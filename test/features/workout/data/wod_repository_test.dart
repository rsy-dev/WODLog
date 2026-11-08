import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/core/database/app_database.dart';
import 'package:wodlog/features/workout/data/wod_repository.dart';

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
