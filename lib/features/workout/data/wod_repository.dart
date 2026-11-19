import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import 'named_wod_catalog.dart';
import 'wod_prescription.dart';

typedef WodRecord = ({
  WorkoutBlock block,
  WodPrescription prescription,
  WodResult? result,
  WodOutcome outcome,
});

class WodRepository {
  WodRepository(this._database);

  final AppDatabase _database;
  static const _uuid = Uuid();

  /// Reuse the same attempt ID when retrying a confirmed save.
  Future<String> saveConfirmed({
    required String attemptId,
    required String sessionId,
    required int sortOrder,
    required WodPrescription prescription,
    required WodAttemptScore score,
  }) async {
    final title = prescription.title.trim();
    if (attemptId.trim().isEmpty || title.isEmpty) {
      throw ArgumentError('An attempt ID and a title are required');
    }
    score.validate(prescription.scoreKind);
    final payload = jsonEncode(prescription.toJson());
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    return _database.transaction(() async {
      final blocks = _database.workoutBlocks;
      final snapshots = _database.wodPrescriptionSnapshots;
      final results = _database.wodResults;
      final existing = await (_database.select(
        blocks,
      )..where((block) => block.id.equals(attemptId))).getSingleOrNull();
      if (existing != null) {
        final snapshot = await (_database.select(
          snapshots,
        )..where((row) => row.blockId.equals(attemptId))).getSingleOrNull();
        final result = await (_database.select(
          results,
        )..where((row) => row.blockId.equals(attemptId))).getSingleOrNull();
        if (existing.sessionId == sessionId &&
            snapshot?.payload == payload &&
            result != null &&
            result.outcome == score.outcome.name &&
            result.durationMs == score.elapsedMs &&
            result.rounds == score.rounds &&
            result.extraReps == score.reps &&
            result.scoreValue == score.value &&
            result.tieBreakMs == score.tieBreakMs &&
            result.resultText == score.text &&
            result.notes == score.notes) {
          return attemptId;
        }
        throw StateError('Attempt ID is already in use');
      }
      await _database
          .into(blocks)
          .insert(
            WorkoutBlocksCompanion.insert(
              id: attemptId,
              sessionId: sessionId,
              type: 'wod',
              title: Value(title),
              sortOrder: Value(sortOrder),
            ),
          );
      await _database
          .into(snapshots)
          .insert(
            WodPrescriptionSnapshotsCompanion.insert(
              blockId: attemptId,
              payload: payload,
            ),
          );
      await _database
          .into(results)
          .insert(
            WodResultsCompanion.insert(
              id: attemptId,
              blockId: attemptId,
              resultType: prescription.scoreKind.name,
              durationMs: Value(score.elapsedMs),
              rounds: Value(score.rounds?.toDouble()),
              extraReps: Value(score.reps),
              scoreValue: Value(score.value),
              outcome: Value(score.outcome.name),
              tieBreakMs: Value(score.tieBreakMs),
              resultText: Value(score.text),
              notes: Value(score.notes),
              createdAt: now,
              updatedAt: now,
            ),
          );
      return attemptId;
    });
  }

  Future<WodRecord?> getRecord(String attemptId) async {
    final query = _recordsQuery();
    query.where(_database.workoutBlocks.id.equals(attemptId));
    final row = await query.getSingleOrNull();
    return row == null ? null : _readRecord(row);
  }

  Future<List<WodRecord>> searchRecords(
    String text, {
    String? sessionId,
  }) async {
    final blocks = _database.workoutBlocks;
    final query = _recordsQuery();
    if (sessionId != null) query.where(blocks.sessionId.equals(sessionId));
    query.orderBy([
      OrderingTerm.asc(blocks.sortOrder),
      OrderingTerm.asc(blocks.id),
    ]);
    final needle = text.trim().toLowerCase();
    return (await query.get()).map(_readRecord).where((record) {
      final prescription = record.prescription;
      return needle.isEmpty ||
          [
            record.block.title,
            record.block.notes,
            prescription.title,
            prescription.rawText,
            prescription.sourceCollection,
            ...prescription.movements.map((movement) => movement.name),
            record.result?.resultText,
            record.result?.notes,
          ].whereType<String>().any(
            (value) => value.toLowerCase().contains(needle),
          );
    }).toList();
  }

  JoinedSelectStatement _recordsQuery() {
    final blocks = _database.workoutBlocks;
    final snapshots = _database.wodPrescriptionSnapshots;
    final results = _database.wodResults;
    return _database.select(blocks).join([
      leftOuterJoin(snapshots, snapshots.blockId.equalsExp(blocks.id)),
      leftOuterJoin(results, results.blockId.equalsExp(blocks.id)),
    ])..where(blocks.type.equals('wod'));
  }

  WodRecord _readRecord(TypedResult row) {
    final block = row.readTable(_database.workoutBlocks);
    final snapshot = row.readTableOrNull(_database.wodPrescriptionSnapshots);
    final result = row.readTableOrNull(_database.wodResults);
    return (
      block: block,
      prescription: snapshot == null
          ? WodPrescription(title: block.title ?? '', rawText: block.notes)
          : WodPrescription.fromJson(
              jsonDecode(snapshot.payload) as Map<String, dynamic>,
            ),
      result: result,
      outcome: result?.outcome == null
          ? WodOutcome.unknown
          : WodOutcome.values.byName(result!.outcome!),
    );
  }

  Stream<List<WorkoutBlock>> watchWodBlocks(String sessionId) {
    return (_database.select(_database.workoutBlocks)
          ..where(
            (block) =>
                block.sessionId.equals(sessionId) & block.type.equals('wod'),
          )
          ..orderBy([(block) => OrderingTerm.asc(block.sortOrder)]))
        .watch();
  }

  Stream<WodResult?> watchResult(String blockId) {
    return (_database.select(
      _database.wodResults,
    )..where((result) => result.blockId.equals(blockId))).watchSingleOrNull();
  }

  Future<void> createWodBlock({
    required String sessionId,
    required String title,
    required int sortOrder,
  }) async {
    await _database
        .into(_database.workoutBlocks)
        .insert(
          WorkoutBlocksCompanion.insert(
            id: _uuid.v4(),
            sessionId: sessionId,
            type: 'wod',
            title: Value(title.trim().isEmpty ? null : title.trim()),
            sortOrder: Value(sortOrder),
          ),
        );
  }

  /// Creates the WOD result card and its prescribed movements in one write.
  /// Movement notes preserve the target scheme while performed sets capture
  /// what the athlete actually completed.
  Future<void> createNamedWod({
    required String sessionId,
    required NamedWodTemplate template,
    required int sortOrder,
  }) async {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final wodBlockId = _uuid.v4();
    final movementBlockId = _uuid.v4();
    await _database.transaction(() async {
      await _database
          .into(_database.workoutBlocks)
          .insert(
            WorkoutBlocksCompanion.insert(
              id: wodBlockId,
              sessionId: sessionId,
              type: 'wod',
              title: Value(template.name),
              notes: Value('${template.format} · ${template.prescription}'),
              sortOrder: Value(sortOrder),
            ),
          );
      await _database
          .into(_database.workoutBlocks)
          .insert(
            WorkoutBlocksCompanion.insert(
              id: movementBlockId,
              sessionId: sessionId,
              type: 'strength',
              title: Value('${template.name} movements'),
              sortOrder: Value(sortOrder + 1),
            ),
          );
      for (var index = 0; index < template.movements.length; index++) {
        final movement = template.movements[index];
        final exerciseId = _uuid.v4();
        await _database
            .into(_database.exercises)
            .insert(
              ExercisesCompanion.insert(
                id: exerciseId,
                name: movement.name,
                normalizedName: movement.name.toLowerCase().replaceAll(
                  RegExp(r'\s+'),
                  ' ',
                ),
                createdAt: now,
              ),
            );
        await _database
            .into(_database.workoutExercises)
            .insert(
              WorkoutExercisesCompanion.insert(
                id: _uuid.v4(),
                blockId: movementBlockId,
                exerciseId: Value(exerciseId),
                displayName: movement.name,
                notes: Value(movement.prescription),
                sortOrder: Value(index),
              ),
            );
      }
    });
  }

  Future<void> saveResult({
    required String blockId,
    required String resultType,
    required String resultText,
    required String notes,
  }) async {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final current = await (_database.select(
      _database.wodResults,
    )..where((result) => result.blockId.equals(blockId))).getSingleOrNull();
    final text = resultText.trim();
    final normalizedNotes = notes.trim();
    if (current == null) {
      await _database
          .into(_database.wodResults)
          .insert(
            WodResultsCompanion.insert(
              id: _uuid.v4(),
              blockId: blockId,
              resultType: resultType,
              resultText: Value(text.isEmpty ? null : text),
              notes: Value(normalizedNotes.isEmpty ? null : normalizedNotes),
              createdAt: now,
              updatedAt: now,
            ),
          );
    } else {
      await (_database.update(
        _database.wodResults,
      )..where((result) => result.blockId.equals(blockId))).write(
        WodResultsCompanion(
          resultType: Value(resultType),
          outcome: const Value(null),
          tieBreakMs: const Value(null),
          durationMs: current.outcome == null
              ? const Value.absent()
              : const Value(null),
          rounds: current.outcome == null
              ? const Value.absent()
              : const Value(null),
          extraReps: current.outcome == null
              ? const Value.absent()
              : const Value(null),
          scoreValue: current.outcome == null
              ? const Value.absent()
              : const Value(null),
          resultText: Value(text.isEmpty ? null : text),
          notes: Value(normalizedNotes.isEmpty ? null : normalizedNotes),
          updatedAt: Value(now),
        ),
      );
    }
  }
}
