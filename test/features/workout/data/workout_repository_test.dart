import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/core/database/app_database.dart';
import 'package:wodlog/features/workout/data/workout_repository.dart';

void main() {
  late AppDatabase database;
  late WorkoutRepository repository;

  setUp(() async {
    database = AppDatabase(NativeDatabase.memory());
    repository = WorkoutRepository(database);

    await database
        .into(database.workoutSessions)
        .insert(
          WorkoutSessionsCompanion.insert(
            id: 'session-1',
            workoutDate: '2026-11-08',
            createdAt: 1,
            updatedAt: 1,
          ),
        );
    await database
        .into(database.workoutBlocks)
        .insert(
          WorkoutBlocksCompanion.insert(
            id: 'block-1',
            sessionId: 'session-1',
            type: 'strength',
          ),
        );
    await database
        .into(database.exercises)
        .insert(
          ExercisesCompanion.insert(
            id: 'exercise-1',
            name: 'Back Squat',
            normalizedName: 'back squat',
            createdAt: 1,
          ),
        );
    await database
        .into(database.workoutExercises)
        .insert(
          WorkoutExercisesCompanion.insert(
            id: 'workout-exercise-1',
            blockId: 'block-1',
            exerciseId: const Value('exercise-1'),
            displayName: 'Back Squat',
          ),
        );
  });

  tearDown(() async {
    await database.close();
  });

  test('adds a new set after a middle set was deleted', () async {
    for (var index = 0; index < 3; index++) {
      await repository.addSet(
        workoutExerciseId: 'workout-exercise-1',
        weightKg: 60.0 + index,
        reps: 5,
      );
    }

    final beforeDelete = await database.select(database.performedSets).get();
    await repository.deleteSet(beforeDelete[1].id);

    await repository.addSet(
      workoutExerciseId: 'workout-exercise-1',
      weightKg: 65,
      reps: 5,
    );

    final sets = await (database.select(
      database.performedSets,
    )..orderBy([(set) => OrderingTerm.asc(set.setNumber)])).get();
    expect(sets.map((set) => set.setNumber), [1, 3, 4]);
  });
}
