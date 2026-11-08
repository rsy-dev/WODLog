import 'package:drift/drift.dart';

import 'workout_blocks.dart';

class WodResults extends Table {
  TextColumn get id => text()();
  TextColumn get blockId => text()
      .named('block_id')
      .unique()
      .references(WorkoutBlocks, #id, onDelete: KeyAction.cascade)();
  TextColumn get resultType => text().named('result_type')();
  IntColumn get durationMs => integer().named('duration_ms').nullable()();
  RealColumn get rounds => real().nullable()();
  IntColumn get extraReps => integer().named('extra_reps').nullable()();
  RealColumn get scoreValue => real().named('score_value').nullable()();
  TextColumn get resultText => text().named('result_text').nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
