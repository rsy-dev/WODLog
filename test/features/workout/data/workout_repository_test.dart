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

  test('updates a strength block title after trimming whitespace', () async {
    await repository.updateStrengthBlock(
      blockId: 'block-1',
      title: '  Olympic lifts  ',
    );

    final block = await database.select(database.workoutBlocks).getSingle();
    expect(block.title, 'Olympic lifts');
  });

  test(
    'deleting a strength block cascades through exercises and sets',
    () async {
      await repository.addSet(
        workoutExerciseId: 'workout-exercise-1',
        weightKg: 60,
        reps: 5,
      );

      await repository.deleteStrengthBlock('block-1');

      expect(await database.select(database.workoutExercises).get(), isEmpty);
      expect(await database.select(database.performedSets).get(), isEmpty);
      expect(await database.select(database.exercises).get(), isEmpty);
    },
  );

  test('updates a workout exercise display and catalog name', () async {
    await repository.updateWorkoutExercise(
      workoutExerciseId: 'workout-exercise-1',
      displayName: '  Front Squat  ',
    );

    final workoutExercise = await database
        .select(database.workoutExercises)
        .getSingle();
    final exercise = await database.select(database.exercises).getSingle();
    expect(workoutExercise.displayName, 'Front Squat');
    expect(exercise.name, 'Front Squat');
    expect(exercise.normalizedName, 'front squat');
  });

  test('deleting a workout exercise cascades through its sets', () async {
    await repository.addSet(
      workoutExerciseId: 'workout-exercise-1',
      weightKg: 60,
      reps: 5,
    );

    await repository.deleteWorkoutExercise('workout-exercise-1');

    expect(await database.select(database.workoutExercises).get(), isEmpty);
    expect(await database.select(database.performedSets).get(), isEmpty);
    expect(await database.select(database.exercises).get(), isEmpty);
  });
}
