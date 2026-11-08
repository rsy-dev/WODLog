import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/core/database/app_database.dart';
import 'package:wodlog/features/workout/data/exercise_progress_service.dart';

void main() {
  late AppDatabase database;
  late ExerciseProgressService service;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    service = ExerciseProgressService(database);
  });

  tearDown(() async {
    await database.close();
  });

  test(
    'compares repeat movement names across newly created exercise IDs',
    () async {
      await _insertWorkout(
        database: database,
        sessionId: 'session-1',
        date: '2026-11-01',
        exerciseId: 'exercise-1',
        movementName: 'Back squat',
        exerciseNormalizedName: 'back squat',
        workoutExerciseId: 'workout-exercise-1',
        sets: const [
          (number: 1, weight: 60.0, reps: 5, success: true),
          (number: 2, weight: 70.0, reps: 3, success: true),
        ],
      );
      await _insertWorkout(
        database: database,
        sessionId: 'session-2',
        date: '2026-11-02',
        exerciseId: 'exercise-2',
        movementName: 'Back-squat',
        exerciseNormalizedName: 'back-squat',
        workoutExerciseId: 'workout-exercise-2',
      blockId: 'block-2',
        sets: const [
          (number: 1, weight: 65.0, reps: 5, success: true),
          (number: 2, weight: 75.0, reps: 3, success: true),
          (number: 3, weight: 110.0, reps: 1, success: false),
        ],
      );

      final progress = await service.getAllProgress();
      final squats = progress.single;

      expect(squats.normalizedName, 'back squat');
      expect(squats.workouts, hasLength(2));
      expect(squats.previous?.sessionId, 'session-1');
      expect(squats.latest?.sessionId, 'session-2');
      expect(squats.latest?.setCount, 2);
      expect(squats.latest?.repCount, 8);
      expect(squats.previous?.volumeKg, 510);
      expect(squats.latest?.volumeKg, 550);
      expect(squats.latest?.bestWeightKg, 75);
      expect(squats.volumeChangeKg, 40);
      expect(squats.volumeChangePercent, closeTo(7.843, 0.001));
      expect(squats.bestWeightChangeKg, 5);
      expect(squats.repChange, 0);
    },
  );

  test('groups repeated entries in the same workout session', () async {
    await _insertWorkout(
      database: database,
      sessionId: 'session-1',
      date: '2026-11-01',
      exerciseId: 'exercise-1',
      movementName: 'Deadlift',
      exerciseNormalizedName: 'deadlift',
      workoutExerciseId: 'workout-exercise-1',
      sets: const [(number: 1, weight: 100.0, reps: 3, success: true)],
    );
    await _insertWorkout(
      database: database,
      sessionId: 'session-1',
      date: '2026-11-01',
      exerciseId: 'exercise-2',
      movementName: 'deadlift',
      exerciseNormalizedName: 'deadlift',
      workoutExerciseId: 'workout-exercise-2',
      blockId: 'block-2',
      sets: const [(number: 1, weight: 110.0, reps: 2, success: true)],
    );

    final progress = await service.watchProgress('DEADLIFT').first;

    expect(progress, isNotNull);
    expect(progress!.workouts, hasLength(1));
    expect(progress.latest?.setCount, 2);
    expect(progress.latest?.repCount, 5);
    expect(progress.latest?.volumeKg, 520);
    expect(progress.latest?.bestWeightKg, 110);
  });

  test('keeps unweighted exercise volume unavailable', () async {
    await _insertWorkout(
      database: database,
      sessionId: 'session-1',
      date: '2026-11-01',
      exerciseId: 'exercise-1',
      movementName: 'Pull-up',
      exerciseNormalizedName: 'pull-up',
      workoutExerciseId: 'workout-exercise-1',
      sets: const [(number: 1, weight: null, reps: 8, success: true)],
    );

    final progress = (await service.getAllProgress()).single;

    expect(progress.latest?.repCount, 8);
    expect(progress.latest?.volumeKg, isNull);
    expect(progress.latest?.bestWeightKg, isNull);
  });
}

Future<void> _insertWorkout({
  required AppDatabase database,
  required String sessionId,
  required String date,
  required String exerciseId,
  required String movementName,
  required String exerciseNormalizedName,
  required String workoutExerciseId,
  required List<({int number, double? weight, int reps, bool success})> sets,
  String blockId = 'block-1',
}) async {
  await database
      .into(database.workoutSessions)
      .insert(
        WorkoutSessionsCompanion.insert(
          id: sessionId,
          workoutDate: date,
          createdAt: DateTime.parse(date).millisecondsSinceEpoch,
          updatedAt: DateTime.parse(date).millisecondsSinceEpoch,
        ),
        mode: InsertMode.insertOrIgnore,
      );
  await database
      .into(database.workoutBlocks)
      .insert(
        WorkoutBlocksCompanion.insert(
          id: blockId,
          sessionId: sessionId,
          type: 'strength',
        ),
        mode: InsertMode.insertOrIgnore,
      );
  await database
      .into(database.exercises)
      .insert(
        ExercisesCompanion.insert(
          id: exerciseId,
          name: movementName,
          normalizedName: exerciseNormalizedName,
          createdAt: 1,
        ),
      );
  await database
      .into(database.workoutExercises)
      .insert(
        WorkoutExercisesCompanion.insert(
          id: workoutExerciseId,
          blockId: blockId,
          exerciseId: Value(exerciseId),
          displayName: movementName,
        ),
      );
  for (final set in sets) {
    await database
        .into(database.performedSets)
        .insert(
          PerformedSetsCompanion.insert(
            id: '$workoutExerciseId-${set.number}',
            workoutExerciseId: workoutExerciseId,
            setNumber: set.number,
            weightKg: Value(set.weight),
            reps: Value(set.reps),
            isSuccessful: Value(set.success),
            createdAt: 1,
            updatedAt: 1,
          ),
        );
  }
}
