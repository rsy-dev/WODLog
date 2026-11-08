import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/features/workout/data/wod_parser.dart';

void main() {
  const parser = WodTextParser();

  group('WodTextParser', () {
    test('parses an AMRAP and explicit movement lines', () {
      const rawText = '''
12 Min AMRAP
10 Wall Balls 20 lb
8 Burpees
''';

      final draft = parser.parse(rawText);

      expect(draft.rawText, rawText);
      expect(draft.format, WodFormat.amrap);
      expect(draft.durationMinutes, 12);
      expect(draft.movements, hasLength(2));
      expect(draft.movements[0].name, 'Wall Balls');
      expect(draft.movements[0].repScheme, [10]);
      expect(draft.movements[0].weight, 20);
      expect(draft.movements[0].weightUnit, 'lb');
      expect(draft.movements[1].name, 'Burpees');
      expect(draft.movements[1].repScheme, [8]);
      expect(draft.unknownLines, isEmpty);
      expect(draft.requiresReview, isTrue);
    });

    test('parses For Time cap and a descending rep scheme', () {
      final draft = parser.parse('''
For Time (cap 15 min)
21-15-9 Thrusters 95 lb
''');

      expect(draft.format, WodFormat.forTime);
      expect(draft.timeCapMinutes, 15);
      expect(draft.movements, hasLength(1));
      expect(draft.movements.single.name, 'Thrusters');
      expect(draft.movements.single.repScheme, [21, 15, 9]);
      expect(draft.movements.single.weight, 95);
      expect(draft.movements.single.weightUnit, 'lb');
    });

    test('parses an EMOM duration and kilogram movement', () {
      final draft = parser.parse('''
EMOM 10 min
5 Power Cleans 60 kg
''');

      expect(draft.format, WodFormat.emom);
      expect(draft.durationMinutes, 10);
      expect(draft.movements.single.name, 'Power Cleans');
      expect(draft.movements.single.repScheme, [5]);
      expect(draft.movements.single.weight, 60);
      expect(draft.movements.single.weightUnit, 'kg');
    });

    test('keeps Korean mixed text and unknown lines for review', () {
      const rawText = '''
10분 AMRAP
12 스쿼트 40 kg
8 push ups
휴식은 필요하면 추가
''';

      final draft = parser.parse(rawText);

      expect(draft.format, WodFormat.amrap);
      expect(draft.durationMinutes, 10);
      expect(draft.movements.map((movement) => movement.name), [
        '스쿼트',
        'push ups',
      ]);
      expect(draft.movements.first.weight, 40);
      expect(draft.movements.first.weightUnit, 'kg');
      expect(draft.unknownLines, ['휴식은 필요하면 추가']);
      expect(draft.confidence, lessThan(1));
    });

    test('does not guess ambiguous load ratios or unstructured lines', () {
      final draft = parser.parse('''
AMRAP
20/14 Wall Balls
Max effort
''');

      expect(draft.format, WodFormat.amrap);
      expect(draft.movements, isEmpty);
      expect(draft.unknownLines, ['20/14 Wall Balls', 'Max effort']);
      expect(draft.confidence, lessThan(0.7));
    });

    test('returns an empty reviewable draft for empty text', () {
      final draft = parser.parse(' \n\r\n');

      expect(draft.format, WodFormat.unknown);
      expect(draft.movements, isEmpty);
      expect(draft.unknownLines, isEmpty);
      expect(draft.confidence, 0);
      expect(draft.requiresReview, isTrue);
    });
  });
}
