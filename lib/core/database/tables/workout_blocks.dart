import 'package:drift/drift.dart';

import 'workout_sessions.dart';

class WorkoutBlocks extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text()
      .named('session_id')
      .references(WorkoutSessions, #id, onDelete: KeyAction.cascade)();
  TextColumn get type => text()();
  TextColumn get title => text().nullable()();
  IntColumn get sortOrder =>
      integer().named('sort_order').withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
