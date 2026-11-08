import 'package:drift/drift.dart';

class WorkoutSessions extends Table {
  TextColumn get id => text()();
  TextColumn get workoutDate => text().named('workout_date')();
  TextColumn get title => text().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer().named('created_at')();
  IntColumn get updatedAt => integer().named('updated_at')();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
