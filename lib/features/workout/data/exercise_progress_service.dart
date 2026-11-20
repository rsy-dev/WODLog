import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';

/// Builds local exercise histories from recorded successful strength sets.
///
/// Histories use a normalized display name instead of exercise IDs because
/// older workout entry flows create a new catalog row for each occurrence.
class ExerciseProgressService {
  ExerciseProgressService(this._database);

  final AppDatabase _database;

  Stream<List<ExerciseProgress>> watchAllProgress() {
    return _query().watch().map(_groupRows);
  }

  Future<List<ExerciseProgress>> getAllProgress() async {
    return _groupRows(await _query().get());
  }

  Stream<ExerciseProgress?> watchProgress(String exerciseName) {
    final normalizedName = normalizeExerciseName(exerciseName);
    return watchAllProgress().map((items) {
      for (final item in items) {
        if (item.normalizedName == normalizedName) return item;
      }
      return null;
    });
  }

  JoinedSelectStatement<HasResultSet, dynamic> _query() {
    final query =
        _database.select(_database.performedSets).join([
          innerJoin(
            _database.workoutExercises,
            _database.workoutExercises.id.equalsExp(
              _database.performedSets.workoutExerciseId,
            ),
          ),
          innerJoin(
            _database.workoutBlocks,
            _database.workoutBlocks.id.equalsExp(
              _database.workoutExercises.blockId,
            ),
          ),
          innerJoin(
            _database.workoutSessions,
            _database.workoutSessions.id.equalsExp(
              _database.workoutBlocks.sessionId,
            ),
          ),
          leftOuterJoin(
            _database.exercises,
            _database.exercises.id.equalsExp(
              _database.workoutExercises.exerciseId,
            ),
          ),
        ])..where(
          _database.workoutBlocks.type.equals('strength') &
              _database.performedSets.isSuccessful.equals(true),
        );

    query.orderBy([
      OrderingTerm.asc(_database.workoutSessions.workoutDate),
      OrderingTerm.asc(_database.workoutSessions.createdAt),
      OrderingTerm.asc(_database.workoutExercises.sortOrder),
      OrderingTerm.asc(_database.performedSets.setNumber),
    ]);
    return query;
  }

  List<ExerciseProgress> _groupRows(List<TypedResult> rows) {
    final histories = <String, _MovementHistory>{};

    for (final row in rows) {
      final set = row.readTable(_database.performedSets);
      final workoutExercise = row.readTable(_database.workoutExercises);
      final session = row.readTable(_database.workoutSessions);
      final exercise = row.readTableOrNull(_database.exercises);
      final movementName = workoutExercise.displayName.trim();
      final normalizedName = normalizeExerciseName(
        exercise?.normalizedName ?? movementName,
      );
      if (normalizedName.isEmpty) continue;

      final movement = histories.putIfAbsent(
        normalizedName,
        () => _MovementHistory(
          normalizedName: normalizedName,
          name: movementName,
        ),
      );
      final workoutKey = '${session.id}\u0000$normalizedName';
      final workout = movement.workouts.putIfAbsent(
        workoutKey,
        () => _WorkoutBuilder(
          sessionId: session.id,
          workoutDate: session.workoutDate,
          sessionTitle: session.title,
          createdAt: session.createdAt,
        ),
      );
      workout.add(set);
    }

    final result = <ExerciseProgress>[];
    for (final movement in histories.values) {
      final workouts =
          movement.workouts.values.map((workout) => workout.build()).toList()
            ..sort((a, b) {
              final dateOrder = a.workoutDate.compareTo(b.workoutDate);
              if (dateOrder != 0) return dateOrder;
              final createdOrder = a.createdAt.compareTo(b.createdAt);
              if (createdOrder != 0) return createdOrder;
              return a.sessionId.compareTo(b.sessionId);
            });
      result.add(
        ExerciseProgress(
          normalizedName: movement.normalizedName,
          name: movement.name,
          workouts: List.unmodifiable(workouts),
        ),
      );
    }
    result.sort((a, b) {
      final dateOrder = (b.latest?.workoutDate ?? '').compareTo(
        a.latest?.workoutDate ?? '',
      );
      return dateOrder != 0 ? dateOrder : a.name.compareTo(b.name);
    });
    return result;
  }
}

/// Lowercases and folds common separators so `Back-squat` and `Back Squat`
/// resolve to the same movement. This intentionally leaves localized letters
/// intact.
String normalizeExerciseName(String name) {
  return name
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'[-_]+'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ');
}

class ExerciseProgress {
  const ExerciseProgress({
    required this.normalizedName,
    required this.name,
    required this.workouts,
  });

  final String normalizedName;
  final String name;
  final List<ExerciseWorkoutSnapshot> workouts;

  ExerciseWorkoutSnapshot? get latest =>
      workouts.isEmpty ? null : workouts.last;

  ExerciseWorkoutSnapshot? get previous =>
      workouts.length < 2 ? null : workouts[workouts.length - 2];

  /// Highest verified weight for a set of exactly 1, 3, or 5 reps.
  double? actualRepMaxKg(int reps) =>
      _maximum(workouts.map((workout) => workout.actualRepMaxesKg[reps]));

  /// Highest Epley estimate from a successful weighted set of 2–10 reps.
  double? get estimatedOneRepMaxKg =>
      _maximum(workouts.map((workout) => workout.estimatedOneRepMaxKg));

  /// Highest successful weight on each recorded date, in ascending order.
  Map<String, double> get dailyBestWeightKg {
    final weights = <String, double>{};
    for (final workout in workouts) {
      final weight = workout.bestWeightKg;
      if (weight == null || !weight.isFinite || weight <= 0) continue;
      final date = workout.workoutDate;
      if (weight > (weights[date] ?? 0)) weights[date] = weight;
    }
    return Map.unmodifiable(weights);
  }

  double? _maximum(Iterable<double?> weights) {
    double? maximum;
    for (final weight in weights) {
      if (weight != null && (maximum == null || weight > maximum)) {
        maximum = weight;
      }
    }
    return maximum;
  }

  double? get volumeChangeKg {
    final current = latest?.volumeKg;
    final before = previous?.volumeKg;
    if (current == null || before == null) return null;
    return current - before;
  }

  double? get volumeChangePercent {
    final before = previous?.volumeKg;
    final change = volumeChangeKg;
    if (before == null || before == 0 || change == null) return null;
    return change / before * 100;
  }

  double? get bestWeightChangeKg {
    final current = latest?.bestWeightKg;
    final before = previous?.bestWeightKg;
    if (current == null || before == null) return null;
    return current - before;
  }

  int? get repChange {
    final current = latest?.repCount;
    final before = previous?.repCount;
    if (current == null || before == null) return null;
    return current - before;
  }
}

class ExerciseWorkoutSnapshot {
  const ExerciseWorkoutSnapshot({
    required this.sessionId,
    required this.workoutDate,
    required this.sessionTitle,
    required this.createdAt,
    required this.setCount,
    required this.repCount,
    required this.volumeKg,
    required this.bestWeightKg,
    this.actualRepMaxesKg = const {},
    this.estimatedOneRepMaxKg,
  });

  final String sessionId;
  final String workoutDate;
  final String? sessionTitle;
  final int createdAt;
  final int setCount;
  final int repCount;

  /// Sum of successful weighted reps. Null means no complete weight/reps pair.
  final double? volumeKg;
  final double? bestWeightKg;
  final Map<int, double> actualRepMaxesKg;
  final double? estimatedOneRepMaxKg;
}

class _MovementHistory {
  _MovementHistory({required this.normalizedName, required this.name});

  final String normalizedName;
  final String name;
  final Map<String, _WorkoutBuilder> workouts = {};
}

class _WorkoutBuilder {
  _WorkoutBuilder({
    required this.sessionId,
    required this.workoutDate,
    required this.sessionTitle,
    required this.createdAt,
  });

  final String sessionId;
  final String workoutDate;
  final String? sessionTitle;
  final int createdAt;
  final List<PerformedSet> _sets = [];

  void add(PerformedSet set) => _sets.add(set);

  ExerciseWorkoutSnapshot build() {
    var reps = 0;
    var volume = 0.0;
    var hasWeightedReps = false;
    double? bestWeight;
    final actualRepMaxes = <int, double>{};
    double? estimatedOneRepMax;

    for (final set in _sets) {
      final weight = set.weightKg;
      final setReps = set.reps;
      if (setReps != null) reps += setReps;
      if (weight != null && setReps != null) {
        volume += weight * setReps;
        hasWeightedReps = true;
      }
      if (weight != null &&
          weight.isFinite &&
          (bestWeight == null || weight > bestWeight)) {
        bestWeight = weight;
      }

      if (weight == null ||
          !weight.isFinite ||
          weight <= 0 ||
          setReps == null) {
        continue;
      }
      if ((setReps == 1 || setReps == 3 || setReps == 5) &&
          weight > (actualRepMaxes[setReps] ?? 0)) {
        actualRepMaxes[setReps] = weight;
      }
      if (setReps >= 2 && setReps <= 10) {
        final estimate = weight * (1 + setReps / 30);
        if (estimate.isFinite && estimate > (estimatedOneRepMax ?? 0)) {
          estimatedOneRepMax = estimate;
        }
      }
    }

    return ExerciseWorkoutSnapshot(
      sessionId: sessionId,
      workoutDate: workoutDate,
      sessionTitle: sessionTitle,
      createdAt: createdAt,
      setCount: _sets.length,
      repCount: reps,
      volumeKg: hasWeightedReps ? volume : null,
      bestWeightKg: bestWeight,
      actualRepMaxesKg: Map.unmodifiable(actualRepMaxes),
      estimatedOneRepMaxKg: estimatedOneRepMax,
    );
  }
}
