import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import 'named_wod_catalog.dart';

class WodRepository {
  WodRepository(this._database);

  final AppDatabase _database;
  static const _uuid = Uuid();

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
          resultText: Value(text.isEmpty ? null : text),
          notes: Value(normalizedNotes.isEmpty ? null : normalizedNotes),
          updatedAt: Value(now),
        ),
      );
    }
  }
}
