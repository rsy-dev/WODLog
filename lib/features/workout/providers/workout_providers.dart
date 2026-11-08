import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/database_provider.dart';
import '../data/workout_repository.dart';

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) {
  return WorkoutRepository(ref.watch(appDatabaseProvider));
});

final sessionsForDateProvider = StreamProvider.family((
  ref,
  String workoutDate,
) {
  return ref.watch(workoutRepositoryProvider).watchSessionsForDate(workoutDate);
});

final blocksForSessionProvider = StreamProvider.family((ref, String sessionId) {
  return ref.watch(workoutRepositoryProvider).watchBlocksForSession(sessionId);
});

final exercisesForBlockProvider = StreamProvider.family((ref, String blockId) {
  return ref.watch(workoutRepositoryProvider).watchExercisesForBlock(blockId);
});

final setsForExerciseProvider = StreamProvider.family((
  ref,
  String workoutExerciseId,
) {
  return ref
      .watch(workoutRepositoryProvider)
      .watchSetsForExercise(workoutExerciseId);
});
