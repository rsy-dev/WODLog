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

  Future<void> createSession({required String workoutDate}) async {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    await _database
        .into(_database.workoutSessions)
        .insert(
          WorkoutSessionsCompanion.insert(
            id: _uuid.v4(),
            workoutDate: workoutDate,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }
}
