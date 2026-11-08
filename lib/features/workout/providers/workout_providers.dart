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
