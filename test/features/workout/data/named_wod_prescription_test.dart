import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/core/database/app_database.dart';
import 'package:wodlog/features/workout/data/named_wod_catalog.dart';
import 'package:wodlog/features/workout/data/wod_prescription.dart';
import 'package:wodlog/features/workout/data/wod_repository.dart';

void main() {
  Map<String, NamedWodPrescription> catalog([BenchmarkStandard? standard]) => {
    for (final entry in NamedWodCatalog.prescriptions(standard: standard))
      entry.id: entry,
  };

  test('all eleven benchmarks include source, version and stable IDs', () {
    final entries = catalog();
    expect(
      entries.keys,
      unorderedEquals([
        'fran',
        'cindy',
        'grace',
        'annie',
        'dt',
        'helen',
        'karen',
        'diane',
        'murph',
        'fight_gone_bad',
        'tabata_this',
      ]),
    );
    for (final template in entries.values) {
      expect(Uri.parse(template.sourceUrl).host, endsWith('crossfit.com'));
      expect(template.draft.sourceVersion, startsWith('${template.id}@'));
      expect(
        template.draft.movements.every((m) => m.movementId != null),
        isTrue,
      );
    }
  });

  test('load and target variants need explicit selection', () {
    final pending = catalog()['karen']!;
    expect(pending.confirmations, isNotEmpty);
    expect(pending.draft.movements.single.weightKg, isNull);
    final women = catalog(BenchmarkStandard.women)['karen']!;
    final men = catalog(BenchmarkStandard.men)['karen']!;
    expect(women.confirmations, isEmpty);
    expect(women.draft.movements.single.weightKg, closeTo(6.35, .01));
    expect(men.draft.movements.single.weightKg, closeTo(9.07, .01));
    expect(women.draft.movements.single.standard, contains('9 ft'));
    expect(men.draft.movements.single.standard, contains('10 ft'));
    expect(women.draft.version, WodVersion.unknown);
  });

  test('Murph and station workouts retain distinct rules', () {
    final entries = catalog(BenchmarkStandard.men);
    final murph = entries['murph']!;
    expect(murph.confirmations, hasLength(2));
    expect(murph.draft.movements.map((m) => m.movementId), [
      'run',
      'pull_up',
      'push_up',
      'air_squat',
      'run',
    ]);
    final fight = entries['fight_gone_bad']!;
    final tabata = entries['tabata_this']!;
    expect(fight.scoring, BenchmarkScoring.totalStationPoints);
    expect(fight.draft.intervalCount, 15);
    expect(tabata.scoring, BenchmarkScoring.sumOfStationMinimums);
    expect(tabata.draft.intervalCount, 40);
    expect(tabata.draft.movements[1].unit, WodQuantityUnit.calories);
  });

  test(
    'repeating a persisted benchmark copies only its prescription',
    () async {
      final database = AppDatabase(NativeDatabase.memory());
      addTearDown(database.close);
      await database
          .into(database.workoutSessions)
          .insert(
            WorkoutSessionsCompanion.insert(
              id: 'session',
              workoutDate: '2026-11-19',
              createdAt: 1,
              updatedAt: 1,
            ),
          );
      final original = catalog(BenchmarkStandard.women)['fran']!.draft;
      final repository = WodRepository(database);
      await repository.saveConfirmed(
        attemptId: 'first',
        sessionId: 'session',
        sortOrder: 0,
        prescription: original,
        score: const WodAttemptScore(
          outcome: WodOutcome.completed,
          elapsedMs: 300000,
        ),
      );

      final record = (await repository.getRecord('first'))!;
      final draft = NamedWodCatalog.repeatDraft(record.prescription);
      expect(draft.toJson(), original.toJson());
      expect(
        identical(draft.movements.first, record.prescription.movements.first),
        isFalse,
      );
      expect(draft.toJson().keys, isNot(contains('attemptId')));
      expect(draft.toJson().keys, isNot(contains('score')));
      expect(await repository.searchRecords('Fran'), hasLength(1));
      final revised = catalog(BenchmarkStandard.men)['fran']!.draft;
      expect(
        revised.movements.first.weightKg,
        isNot(original.movements.first.weightKg),
      );
      expect(
        (await repository.getRecord('first'))!.prescription.toJson(),
        original.toJson(),
      );
      expect((await repository.getRecord('first'))!.result?.durationMs, 300000);
    },
  );
}
