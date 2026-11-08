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
