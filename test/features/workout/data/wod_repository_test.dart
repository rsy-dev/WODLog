import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/core/database/app_database.dart';
import 'package:wodlog/features/workout/data/wod_repository.dart';
import 'package:wodlog/features/workout/data/wod_comparison.dart';
import 'package:wodlog/features/workout/data/wod_prescription.dart';
import 'package:wodlog/features/workout/data/wod_parser.dart';

void main() {
  late AppDatabase database;
  late WodRepository repository;

  setUp(() async {
    database = AppDatabase(NativeDatabase.memory());
    repository = WodRepository(database);
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
  });

  tearDown(() async {
    await database.close();
  });

  const prescription = WodPrescription(
    title: '21-15-9',
    structure: WodStructure.forTime,
    scoreKind: WodScoreKind.time,
    sourceCollection: 'benchmark',
    sourceVersion: '1',
    version: WodVersion.scaled,
    timeCapSeconds: 600,
    rawText: '21-15-9 Thruster',
    unparsedLines: ['Choose a target'],
    movements: [
      WodMovementPrescription(
        name: 'Thruster',
        quantities: [21, 15, 9],
        weightKg: 30,
      ),
    ],
  );
  const score = WodAttemptScore(
    outcome: WodOutcome.capped,
    reps: 42,
    tieBreakMs: 530000,
  );

  test(
    'repeat stores an independent attempt and recalculates comparable PRs',
    () async {
      const movements = [
        WodMovementPrescription(
          name: 'Thruster',
          movementId: 'thruster',
          quantities: [21, 15, 9],
          weightKg: 30,
        ),
      ];
      WodPrescription draft(WodVersion version) => WodPrescription(
        title: '21-15-9',
        structure: WodStructure.forTime,
        scoreKind: WodScoreKind.time,
        version: version,
        movements: movements,
        timeCapSeconds: 600,
      );
      Future<void> repeat(
        String id,
        int day,
        WodAttemptScore result, [
        WodVersion version = WodVersion.scaled,
      ]) => repository.saveRepeat(
        attemptId: id,
        workoutDate: '2026-11-${day.toString().padLeft(2, '0')}',
        prescription: draft(version),
        score: result,
      );
      await repeat('baseline', 1, score);
      await repeat('baseline', 1, score);
      const finish = WodAttemptScore(
        outcome: WodOutcome.completed,
        elapsedMs: 550000,
      );
      await repeat('improvement', 2, finish);
      await repeat('tie', 3, finish);
      await repeat('rx', 4, finish, WodVersion.rx);
      await repeat('unknown', 5, finish, WodVersion.unknown);
      await repeat(
        'stopped',
        6,
        const WodAttemptScore(outcome: WodOutcome.stopped),
      );
      final records = await repository.watchCompletedRecords().first;
      final bests = wodPersonalBests(records);
      expect(records, hasLength(6));
      expect(bests.map((group) => group.best.block.id), ['improvement', 'rx']);
      expect(bests.first.improvements.map((record) => record.block.id), [
        'improvement',
      ]);
      expect(bests.last.improvements, isEmpty);

      await repository.saveStructuredResult(
        blockId: 'improvement',
        prescription: draft(WodVersion.scaled),
        score: const WodAttemptScore(
          outcome: WodOutcome.completed,
          elapsedMs: 570000,
        ),
      );
      final updated = wodPersonalBests(
        await repository.watchCompletedRecords().first,
      );
      expect(updated.first.best.block.id, 'tie');
      await (database.delete(
        database.workoutSessions,
      )..where((row) => row.id.equals('tie'))).go();
      final deleted = wodPersonalBests(
        await repository.watchCompletedRecords().first,
      );
      expect(deleted.first.best.block.id, 'improvement');
    },
  );

  test(
    'keeps specific bikes distinct through WOD storage and PR comparison',
    () async {
      const parser = WodTextParser();
      for (final (attempt, equipment, duration) in [
        ('echo-first', 'EchoBike', 120000),
        ('assault', 'Assault Bike', 90000),
        ('echo-faster', '에코바이크', 100000),
        ('legacy-air', 'Air Bike', 80000),
      ]) {
        final draft = parser.parsePrescription(
          'Rx:\n4 rounds for time of:\n20-calorie $equipment\n'
          'Beginner:\n10-calorie row',
          title: 'Bike WOD',
          levelIndex: 0,
        );
        await repository.saveRepeat(
          attemptId: attempt,
          workoutDate: '2026-11-08',
          prescription: draft,
          score: WodAttemptScore(
            outcome: WodOutcome.completed,
            elapsedMs: duration,
          ),
        );
      }
      final records = await repository.watchCompletedRecords().first;
      expect(
        records.map(
          (record) => record.prescription.movements.single.movementId,
        ),
        unorderedEquals(['echo_bike', 'assault_bike', 'echo_bike', 'air_bike']),
      );
      final bests = wodPersonalBests(records);
      expect(
        bests.map((group) => group.best.block.id),
        unorderedEquals(['echo-faster', 'assault', 'legacy-air']),
      );
    },
  );

  Future<String> save({WodAttemptScore result = score}) =>
      repository.saveConfirmed(
        attemptId: 'attempt',
        sessionId: 'session-1',
        sortOrder: 0,
        prescription: prescription,
        score: result,
      );

  test(
    'confirmed snapshots survive concurrent retries with original scores',
    () async {
      expect(await Future.wait([save(), save()]), ['attempt', 'attempt']);
      final records = await repository.searchRecords('thruster');
      final record = records.single;
      expect(record.prescription.toJson(), prescription.toJson());
      expect(record.outcome, WodOutcome.capped);
      expect(record.result?.durationMs, isNull);
      expect(record.result?.extraReps, 42);
      expect(record.result?.tieBreakMs, 530000);
      await expectLater(
        save(
          result: const WodAttemptScore(
            outcome: WodOutcome.completed,
            elapsedMs: 400000,
          ),
        ),
        throwsStateError,
      );
      expect(await database.select(database.wodResults).get(), hasLength(1));
    },
  );

  test('failed score insert rolls back the block and snapshot', () async {
    await database.customStatement("""
      CREATE TRIGGER reject_result BEFORE INSERT ON wod_results
      BEGIN SELECT RAISE(ABORT, 'forced failure'); END
    """);
    await expectLater(save(), throwsException);
    expect(await repository.getRecord('attempt'), isNull);
    expect(
      await database.select(database.wodPrescriptionSnapshots).get(),
      isEmpty,
    );
    await database.customStatement('DROP TRIGGER reject_result');
    expect(await save(), 'attempt');
  });

  test('score validation distinguishes complete, capped, and stopped', () {
    expect(
      () => const WodAttemptScore(
        outcome: WodOutcome.capped,
        elapsedMs: 600000,
        reps: 42,
      ).validate(WodScoreKind.time),
      throwsArgumentError,
    );
    expect(
      () =>
          const WodAttemptScore(outcome: WodOutcome.stopped)
              .validate(WodScoreKind.time),
      returnsNormally,
    );
    expect(
      () => const WodAttemptScore(
        outcome: WodOutcome.completed,
        rounds: 4,
        reps: 9,
      ).validate(WodScoreKind.roundsAndReps),
      returnsNormally,
    );
  });

  test(
    'v1 migration retains searchable text and unconfirmed conditions',
    () async {
      await database.close();
      database = AppDatabase(
        NativeDatabase.memory(
          setup: (db) {
            db.execute("""
        CREATE TABLE workout_blocks (
          id TEXT PRIMARY KEY NOT NULL, session_id TEXT NOT NULL,
          type TEXT NOT NULL, title TEXT, sort_order INTEGER NOT NULL DEFAULT 0, notes TEXT
        );
        CREATE TABLE wod_results (
          id TEXT PRIMARY KEY NOT NULL, block_id TEXT NOT NULL UNIQUE,
          result_type TEXT NOT NULL, duration_ms INTEGER, rounds REAL,
          extra_reps INTEGER, score_value REAL, result_text TEXT, notes TEXT,
          created_at INTEGER NOT NULL, updated_at INTEGER NOT NULL
        );
        INSERT INTO workout_blocks VALUES
          ('old', 'session-1', 'wod', 'Legacy', 0, 'Unedited origin');
        INSERT INTO wod_results
          (id, block_id, result_type, result_text, created_at, updated_at)
          VALUES ('result', 'old', 'for_time', '12:51', 1, 1);
        PRAGMA user_version = 1;
      """);
          },
        ),
      );
      final repo = WodRepository(database);
      final record = (await repo.searchRecords('unedited origin')).single;
      expect(record.prescription.rawText, 'Unedited origin');
      expect(record.prescription.unparsedLines, ['Unedited origin']);
      expect(record.prescription.version, WodVersion.unknown);
      expect(record.prescription.structure, WodStructure.unknown);
      expect(record.outcome, WodOutcome.unknown);
      expect(record.result?.resultText, '12:51');
      expect(
        await database.select(database.wodPrescriptionSnapshots).get(),
        hasLength(1),
      );
    },
  );

  test('persists the chosen prescription and score as a WOD', () async {
    final draft = const WodTextParser().parse(
      '12 min AMRAP\nRx: 10 Thrusters 95 lb\nScaled: 8 Thrusters 65 lb',
    );
    await repository.createImportedWod(
      sessionId: 'session-1',
      title: 'Lunch WOD',
      draft: draft,
      levelIndex: 1,
      score: '5+3',
    );

    final block = (await repository.watchWodBlocks('session-1').first).single;
    expect(block.title, 'Lunch WOD · Scaled');
    expect(block.notes, contains('AMRAP · 12 min'));
    expect(block.notes, contains('8 Thrusters 65 lb'));
    expect(block.notes, isNot(contains('95 lb')));
    final result = await repository.watchResult(block.id).first;
    expect(result?.resultType, 'amrap');
    expect(result?.resultText, '5+3');
  });

  test('saves and updates a WOD result without duplicating it', () async {
    await repository.createWodBlock(
      sessionId: 'session-1',
      title: 'AMRAP 10',
      sortOrder: 0,
    );
    final block = await (database.select(
      database.workoutBlocks,
    )..where((row) => row.sessionId.equals('session-1'))).getSingle();

    await repository.saveResult(
      blockId: block.id,
      resultType: 'amrap',
      resultText: '5 rounds',
      notes: '  felt good  ',
    );
    final first = await (database.select(
      database.wodResults,
    )..where((row) => row.blockId.equals(block.id))).getSingle();

    await repository.saveResult(
      blockId: block.id,
      resultType: 'amrap',
      resultText: '6 rounds',
      notes: '',
    );
    final results = await (database.select(
      database.wodResults,
    )..where((row) => row.blockId.equals(block.id))).get();

    expect(results, hasLength(1));
    expect(results.single.id, first.id);
    expect(results.single.resultText, '6 rounds');
    expect(results.single.notes, equals(null));
  });

  test('deleting a session cascades to WOD blocks and results', () async {
    await repository.createWodBlock(
      sessionId: 'session-1',
      title: 'For Time',
      sortOrder: 0,
    );
    final block = await (database.select(
      database.workoutBlocks,
    )..where((row) => row.sessionId.equals('session-1'))).getSingle();
    await repository.saveResult(
      blockId: block.id,
      resultType: 'for_time',
      resultText: '08:30',
      notes: '',
    );

    await (database.delete(
      database.workoutSessions,
    )..where((row) => row.id.equals('session-1'))).go();

    expect(await database.select(database.workoutBlocks).get(), isEmpty);
    expect(await database.select(database.wodResults).get(), isEmpty);
  });
}
