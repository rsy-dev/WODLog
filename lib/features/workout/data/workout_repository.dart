import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';

class WorkoutRepository {
  WorkoutRepository(this._database);

  final AppDatabase _database;
  static const _uuid = Uuid();

  Stream<List<WorkoutSession>> watchSessionsForDate(String workoutDate) {
    return (_database.select(_database.workoutSessions)
          ..where((session) => session.workoutDate.equals(workoutDate))
          ..orderBy([(session) => OrderingTerm.desc(session.createdAt)]))
        .watch();
  }

  Stream<List<WorkoutSession>> watchRecentSessions() {
    return (_database.select(_database.workoutSessions)
          ..orderBy([
            (session) => OrderingTerm.desc(session.workoutDate),
            (session) => OrderingTerm.desc(session.createdAt),
          ])
          ..limit(500))
        .watch();
  }

  Stream<WorkoutSession?> watchSession(String sessionId) {
    return (_database.select(
      _database.workoutSessions,
    )..where((session) => session.id.equals(sessionId))).watchSingleOrNull();
  }

  Future<String> createSession({required String workoutDate}) async {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final id = _uuid.v4();
    await _database
        .into(_database.workoutSessions)
        .insert(
          WorkoutSessionsCompanion.insert(
            id: id,
            workoutDate: workoutDate,
            createdAt: now,
            updatedAt: now,
          ),
        );
    return id;
  }

  Future<void> updateSession({
    required String sessionId,
    required String title,
    required String notes,
  }) async {
    final normalizedTitle = title.trim();
    final normalizedNotes = notes.trim();
    await (_database.update(
      _database.workoutSessions,
    )..where((session) => session.id.equals(sessionId))).write(
      WorkoutSessionsCompanion(
        title: Value(normalizedTitle.isEmpty ? null : normalizedTitle),
        notes: Value(normalizedNotes.isEmpty ? null : normalizedNotes),
        updatedAt: Value(DateTime.now().toUtc().millisecondsSinceEpoch),
      ),
    );
  }

  Future<void> deleteSession(String sessionId) async {
    await (_database.delete(
      _database.workoutSessions,
    )..where((session) => session.id.equals(sessionId))).go();
  }

  Stream<List<WorkoutBlock>> watchBlocksForSession(String sessionId) {
    return (_database.select(_database.workoutBlocks)
          ..where((block) => block.sessionId.equals(sessionId))
          ..orderBy([(block) => OrderingTerm.asc(block.sortOrder)]))
        .watch();
  }

  Stream<List<WorkoutExercise>> watchExercisesForBlock(String blockId) {
    return (_database.select(_database.workoutExercises)
          ..where((exercise) => exercise.blockId.equals(blockId))
          ..orderBy([(exercise) => OrderingTerm.asc(exercise.sortOrder)]))
        .watch();
  }

  Stream<List<PerformedSet>> watchSetsForExercise(String workoutExerciseId) {
    return (_database.select(_database.performedSets)
          ..where((set) => set.workoutExerciseId.equals(workoutExerciseId))
          ..orderBy([(set) => OrderingTerm.asc(set.setNumber)]))
        .watch();
  }

  Future<void> createStrengthBlock({
    required String sessionId,
    required String title,
    required int sortOrder,
  }) async {
    await _database
        .into(_database.workoutBlocks)
        .insert(
          WorkoutBlocksCompanion.insert(
            id: _uuid.v4(),
            sessionId: sessionId,
            type: 'strength',
            title: Value(title.trim()),
            sortOrder: Value(sortOrder),
          ),
        );
  }

  Future<void> addExercise({
    required String blockId,
    required String name,
    required int sortOrder,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ArgumentError.value(name, 'name', 'Exercise name cannot be empty.');
    }

    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final exerciseId = _uuid.v4();
    await _database.transaction(() async {
      await _database
          .into(_database.exercises)
          .insert(
            ExercisesCompanion.insert(
              id: exerciseId,
              name: trimmedName,
              normalizedName: trimmedName.toLowerCase().replaceAll(
                RegExp(r'\s+'),
                ' ',
              ),
              createdAt: now,
            ),
          );
      await _database
          .into(_database.workoutExercises)
          .insert(
            WorkoutExercisesCompanion.insert(
              id: _uuid.v4(),
              blockId: blockId,
              exerciseId: Value(exerciseId),
              displayName: trimmedName,
              sortOrder: Value(sortOrder),
            ),
          );
    });
  }

  Future<void> addSet({
    required String workoutExerciseId,
    required int setNumber,
    required double weightKg,
    required int reps,
  }) async {
    if (weightKg < 0 || !weightKg.isFinite) {
      throw ArgumentError.value(
        weightKg,
        'weightKg',
        'Weight must be zero or more.',
      );
    }
    if (reps <= 0) {
      throw ArgumentError.value(
        reps,
        'reps',
        'Reps must be greater than zero.',
      );
    }

    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    await _database
        .into(_database.performedSets)
        .insert(
          PerformedSetsCompanion.insert(
            id: _uuid.v4(),
            workoutExerciseId: workoutExerciseId,
            setNumber: setNumber,
            weightKg: Value(weightKg),
            reps: Value(reps),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<void> updateSet({
    required String setId,
    required double weightKg,
    required int reps,
  }) async {
    _validateSet(weightKg, reps);
    await (_database.update(
      _database.performedSets,
    )..where((set) => set.id.equals(setId))).write(
      PerformedSetsCompanion(
        weightKg: Value(weightKg),
        reps: Value(reps),
        updatedAt: Value(DateTime.now().toUtc().millisecondsSinceEpoch),
      ),
    );
  }

  Future<void> deleteSet(String setId) async {
    await (_database.delete(
      _database.performedSets,
    )..where((set) => set.id.equals(setId))).go();
  }

  void _validateSet(double weightKg, int reps) {
    if (weightKg < 0 || !weightKg.isFinite) {
      throw ArgumentError.value(
        weightKg,
        'weightKg',
        'Weight must be zero or more.',
      );
    }
    if (reps <= 0) {
      throw ArgumentError.value(
        reps,
        'reps',
        'Reps must be greater than zero.',
      );
    }
  }
}
