import 'package:drift/drift.dart';

import 'workout_exercises.dart';

class PerformedSets extends Table {
  TextColumn get id => text()();
  TextColumn get workoutExerciseId => text()
      .named('workout_exercise_id')
      .references(WorkoutExercises, #id, onDelete: KeyAction.cascade)();
  IntColumn get setNumber => integer().named('set_number')();
  RealColumn get weightKg => real().named('weight_kg').nullable()();
  IntColumn get reps => integer().nullable()();
  BoolColumn get isSuccessful =>
      boolean().named('is_successful').withDefault(const Constant(true))();
  RealColumn get rpe => real().nullable()();
  IntColumn get durationMs => integer().named('duration_ms').nullable()();
  RealColumn get distanceM => real().named('distance_m').nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
