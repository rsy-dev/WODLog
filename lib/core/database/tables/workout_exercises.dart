import 'package:drift/drift.dart';

import 'exercises.dart';
import 'workout_blocks.dart';

class WorkoutExercises extends Table {
  TextColumn get id => text()();
  TextColumn get blockId => text()
      .named('block_id')
      .references(WorkoutBlocks, #id, onDelete: KeyAction.cascade)();
  TextColumn get exerciseId => text()
      .named('exercise_id')
      .nullable()
      .references(Exercises, #id, onDelete: KeyAction.setNull)();
  TextColumn get displayName => text().named('display_name')();
  IntColumn get sortOrder =>
      integer().named('sort_order').withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
