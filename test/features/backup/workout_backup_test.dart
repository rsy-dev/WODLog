import 'dart:convert';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/core/database/app_database.dart';
import 'package:wodlog/features/backup/data/workout_backup.dart';
import 'package:wodlog/features/workout/data/wod_prescription.dart';

void main() {
  late AppDatabase destination;
  late WorkoutBackup backup;
  late String original;
  late String incoming;

  setUp(() async {
    final source = AppDatabase(NativeDatabase.memory());
    try {
      await _seed(source, 'incoming');
      incoming = await WorkoutBackup(source).exportJson();
    } finally {
      await source.close();
    }

    destination = AppDatabase(NativeDatabase.memory());
    backup = WorkoutBackup(destination);
    await _seed(destination, 'existing');
    original = await backup.exportJson();
  });

  tearDown(() => destination.close());

  test(
    'version 1 replaces all seven tables and preserves row values',
    () async {
      final document = jsonDecode(incoming) as Map<String, dynamic>;
      expect(document['format'], 'wodlog-workout-backup');
      expect(document['version'], 1);
      expect((document['tables'] as Map).values, everyElement(hasLength(1)));

      backup.validateJson(incoming);
      expect(await backup.exportJson(), original);
      await backup.restoreJson(incoming);
      expect(await backup.exportJson(), incoming);
      await backup.restoreJson(incoming);
      expect(await backup.exportJson(), incoming);
    },
  );

  test('an empty backup clears all workout tables', () async {
    final document = jsonDecode(incoming) as Map<String, dynamic>;
    (document['tables'] as Map).updateAll((key, value) => []);
    final empty = jsonEncode(document);

    await backup.restoreJson(empty);
    expect(await backup.exportJson(), empty);
  });

  test('invalid backups fail both preflight and restore', () async {
    String change(void Function(Map<String, dynamic>) edit) {
      final document = jsonDecode(incoming) as Map<String, dynamic>;
      edit(document);
      return jsonEncode(document);
    }

    List<dynamic> rows(Map<String, dynamic> document, String table) =>
        document['tables'][table] as List<dynamic>;

    const invalid = WorkoutBackupError.invalidFormat;
    const duplicate = WorkoutBackupError.duplicateRecord;
    final cases = [
      ('{', invalid),
      (
        change((doc) => doc['version'] = 2),
        WorkoutBackupError.unsupportedVersion,
      ),
      (change((doc) => doc['tables'].remove('exercises')), invalid),
      (
        change((doc) => rows(doc, 'workout_sessions').single.remove('notes')),
        invalid,
      ),
      (
        change(
          (doc) => rows(doc, 'performed_sets').single['is_successful'] = 0,
        ),
        invalid,
      ),
      (
        change(
          (doc) => rows(doc, 'workout_blocks').single['session_id'] = 'missing',
        ),
        invalid,
      ),
      (
        change(
          (doc) =>
              rows(doc, 'wod_prescription_snapshots').single['payload'] = '{}',
        ),
        invalid,
      ),
      (
        change((doc) {
          final sessions = rows(doc, 'workout_sessions');
          sessions.add(sessions.single);
        }),
        duplicate,
      ),
      (
        change((doc) {
          final sets = rows(doc, 'performed_sets');
          sets.add({
            ...sets.single as Map<String, dynamic>,
            'id': 'second-set',
          });
        }),
        duplicate,
      ),
      (
        change((doc) {
          final results = rows(doc, 'wod_results');
          results.add({
            ...results.single as Map<String, dynamic>,
            'id': 'second-result',
          });
        }),
        duplicate,
      ),
    ];

    for (final (source, reason) in cases) {
      final error = isA<WorkoutBackupException>().having(
        (exception) => exception.reason,
        'reason',
        reason,
      );
      expect(() => backup.validateJson(source), throwsA(error));
      await expectLater(backup.restoreJson(source), throwsA(error));
      expect(await backup.exportJson(), original);
    }
  });

  test('a late database failure rolls back deletes and inserts', () async {
    await destination.customStatement('''
      CREATE TRIGGER reject_snapshot BEFORE INSERT ON wod_prescription_snapshots
      BEGIN
        SELECT RAISE(ABORT, 'test restore failure');
      END
    ''');

    await expectLater(
      backup.restoreJson(incoming),
      throwsA(
        predicate<Object>(
          (error) => error.toString().contains('test restore failure'),
        ),
      ),
    );
    expect(await backup.exportJson(), original);
  });
}

Future<void> _seed(AppDatabase db, String id) async {
  await db
      .into(db.workoutSessions)
      .insert(
        WorkoutSession(
          id: id,
          workoutDate: '2026-11-28',
          notes: '운동 메모\nsecond line',
          createdAt: 1795866200000,
          updatedAt: 1795866200000,
        ),
      );
  await db
      .into(db.exercises)
      .insert(
        Exercise(
          id: '$id-exercise',
          name: 'Thruster',
          normalizedName: 'thruster',
          unitType: 'weight',
          createdAt: 1,
          archivedAt: 2,
        ),
      );
  await db
      .into(db.workoutBlocks)
      .insert(
        WorkoutBlock(id: '$id-block', sessionId: id, type: 'wod', sortOrder: 0),
      );
  await db
      .into(db.workoutExercises)
      .insert(
        WorkoutExercise(
          id: '$id-movement',
          blockId: '$id-block',
          exerciseId: '$id-exercise',
          displayName: 'Thruster',
          sortOrder: 0,
        ),
      );
  await db
      .into(db.performedSets)
      .insert(
        PerformedSet(
          id: '$id-set',
          workoutExerciseId: '$id-movement',
          setNumber: 1,
          weightKg: 42.5,
          reps: 8,
          isSuccessful: false,
          createdAt: 3,
          updatedAt: 4,
        ),
      );
  await db
      .into(db.wodResults)
      .insert(
        WodResult(
          id: '$id-result',
          blockId: '$id-block',
          resultType: 'time',
          outcome: 'capped',
          tieBreakMs: 5000,
          createdAt: 5,
          updatedAt: 6,
        ),
      );
  await db
      .into(db.wodPrescriptionSnapshots)
      .insert(
        WodPrescriptionSnapshot(
          blockId: '$id-block',
          payload: jsonEncode(const WodPrescription(title: '오늘의 WOD').toJson()),
        ),
      );
}
