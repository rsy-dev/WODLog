import 'package:drift/drift.dart';

import 'tables/exercises.dart';
import 'tables/performed_sets.dart';
import 'tables/wod_results.dart';
import 'tables/wod_prescription_snapshots.dart';
import 'tables/workout_blocks.dart';
import 'tables/workout_exercises.dart';
import 'tables/workout_sessions.dart';
import 'database_connection.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    WorkoutSessions,
    WorkoutBlocks,
    Exercises,
    WorkoutExercises,
    PerformedSets,
    WodResults,
    WodPrescriptionSnapshots,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? openConnection());

  @override
  int get schemaVersion => 2;

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
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await transaction(() async {
          await migrator.createTable(wodPrescriptionSnapshots);
          await migrator.addColumn(wodResults, wodResults.outcome);
          await migrator.addColumn(wodResults, wodResults.tieBreakMs);
          await customStatement("""
            INSERT INTO wod_prescription_snapshots (block_id, payload)
            SELECT id, json_object(
              'title', coalesce(title, ''),
              'structure', 'unknown',
              'scoreKind', 'unknown',
              'version', 'unknown',
              'movements', json_array(),
              'standards', json_array(),
              'rawText', notes,
              'unparsedLines', CASE WHEN notes IS NULL THEN json_array()
                                    ELSE json_array(notes) END
            ) FROM workout_blocks WHERE type = 'wod'
          """);
        });
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
