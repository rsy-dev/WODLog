import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/features/workout/data/crossfit_catalog.dart';

void main() {
  group('CrossFitCatalog', () {
    test('contains common movement categories and named benchmarks', () {
      final categories = CrossFitCatalog.entries.map((entry) => entry.category);
      expect(categories, contains(CrossFitCategory.barbell));
      expect(categories, contains(CrossFitCategory.gymnastics));
      expect(categories, contains(CrossFitCategory.dumbbellKettlebell));
      expect(categories, contains(CrossFitCategory.cardio));
      expect(categories, contains(CrossFitCategory.bodyweight));
      expect(categories, contains(CrossFitCategory.otherEquipment));
      expect(categories, contains(CrossFitCategory.benchmarkWod));
      expect(
        CrossFitCatalog.find('Fran')?.category,
        CrossFitCategory.benchmarkWod,
      );
    });

    test(
      'resolves aliases to canonical entries independent of punctuation',
      () {
        expect(CrossFitCatalog.find('C2B')?.id, 'chest_to_bar_pull_up');
        expect(
          CrossFitCatalog.find('Chest to bar')?.id,
          'chest_to_bar_pull_up',
        );
        expect(CrossFitCatalog.find('db snatch')?.id, 'dumbbell_snatch');
        expect(CrossFitCatalog.find('Toes-To-Bar')?.id, 'toes_to_bar');
        expect(CrossFitCatalog.find('not a movement'), isNull);
      },
    );

    test('resolves machines independently while retaining legacy lookup', () {
      expect(CrossFitCatalog.find('Echo Bike')?.id, 'air_bike');
      expect(CrossFitCatalog.find('Assault Bike')?.id, 'air_bike');
      expect(CrossFitCatalog.find('AssaultBike')?.id, 'assault_bike');
      for (final (name, id) in [
        ('Echo Bike', 'echo_bike'),
        ('EchoBike', 'echo_bike'),
        ('에코바이크', 'echo_bike'),
        ('어썰트바이크', 'assault_bike'),
        ('Assault Bike', 'assault_bike'),
        ('SkiErg', 'ski_erg'),
        ('로잉', 'row'),
      ]) {
        final match = CrossFitCatalog.resolveMovement(name);
        expect(match.entry?.id, id);
        expect(match.entry?.movementCategory, MovementCategory.machine);
      }
    });

    test(
      'searches specific equipment and the compact Korean movement alias',
      () {
        for (final (query, id) in [
          ('월볼샷', 'wall_ball'),
          ('EchoBike', 'echo_bike'),
          ('AssaultBike', 'assault_bike'),
          ('Echo Bike', 'echo_bike'),
          ('Assault Bike', 'assault_bike'),
          ('에어바이크', 'air_bike'),
        ]) {
          expect(CrossFitCatalog.searchMovements(query).single.id, id);
          expect(CrossFitCatalog.resolveMovement(query).entry?.id, id);
        }
      },
    );

    test('supports custom entry and offers candidates for ambiguous names', () {
      final match = CrossFitCatalog.resolveMovement('muscle-up');
      expect(match.allowsCustomEntry, isTrue);
      expect(
        match.candidates.map((entry) => entry.id),
        containsAll(['bar_muscle_up', 'ring_muscle_up']),
      );
      expect(
        CrossFitCatalog.resolveMovement('custom drill').candidates,
        isEmpty,
      );
      expect(CrossFitCatalog.resolveMovement('Fran').entry, isNull);
      expect(
        CrossFitCatalog.searchMovements(
          '박스 점프',
          category: MovementCategory.otherEquipment,
        ).single.id,
        'box_jump',
      );
      expect(
        CrossFitCatalog.byId('box_jump')?.category,
        CrossFitCategory.gymnastics,
      );
      final ids = CrossFitCatalog.entries.map((entry) => entry.id);
      expect(ids.toSet(), hasLength(ids.length));
    });

    test('search filters category and matches names or aliases', () {
      final allSnatches = CrossFitCatalog.search('snatch');
      expect(allSnatches.map((entry) => entry.id), contains('snatch'));
      expect(allSnatches.map((entry) => entry.id), contains('dumbbell_snatch'));

      final barbellOnly = CrossFitCatalog.search(
        'snatch',
        category: CrossFitCategory.barbell,
      );
      expect(barbellOnly, isNotEmpty);
      expect(
        barbellOnly.every(
          (entry) => entry.category == CrossFitCategory.barbell,
        ),
        isTrue,
      );

      expect(CrossFitCatalog.search('  '), CrossFitCatalog.entries);
    });
  });
}
