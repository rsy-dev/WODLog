import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/exercises.dart';
import 'tables/performed_sets.dart';
import 'tables/wod_results.dart';
import 'tables/workout_blocks.dart';
import 'tables/workout_exercises.dart';
import 'tables/workout_sessions.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    WorkoutSessions,
    WorkoutBlocks,
    Exercises,
    WorkoutExercises,
    PerformedSets,
    WodResults,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
      await customStatement(
        'CREATE INDEX workout_sessions_workout_date_idx '
        'ON workout_sessions (workout_date)',
      );
      await customStatement(
        'CREATE INDEX workout_blocks_session_sort_idx '
        'ON workout_blocks (session_id, sort_order)',
      );
      await customStatement(
        'CREATE INDEX workout_exercises_block_sort_idx '
        'ON workout_exercises (block_id, sort_order)',
      );
      await customStatement(
        'CREATE INDEX workout_exercises_exercise_idx '
        'ON workout_exercises (exercise_id)',
      );
      await customStatement(
        'CREATE UNIQUE INDEX performed_sets_exercise_number_idx '
        'ON performed_sets (workout_exercise_id, set_number)',
      );
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationSupportDirectory();
    final file = File(p.join(directory.path, 'wodlog.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
