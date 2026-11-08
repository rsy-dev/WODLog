import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';

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
