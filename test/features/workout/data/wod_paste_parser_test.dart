import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/features/workout/data/wod_parser.dart';
import 'package:wodlog/features/workout/data/wod_prescription.dart';

void main() {
  const parser = WodTextParser();

  test('parses official RFT metrics, explicit loads and cap', () {
    final draft = parser.parsePrescription('''
3 rounds for time (time cap: 12:30)
400-meter run
20-calorie row
9 thrusters (95 lb)
''');
    expect(draft.structure, WodStructure.forTime);
    expect(draft.rounds, 3);
    expect(draft.timeCapSeconds, 750);
    expect(draft.movements.map((m) => m.movementId), [
      'run',
      'row',
      'thruster',
    ]);
    expect(draft.movements.map((m) => m.unit), [
      WodQuantityUnit.meters,
      WodQuantityUnit.calories,
      WodQuantityUnit.reps,
    ]);
    expect(draft.movements.last.weightKg, closeTo(43.09, .01));
    expect(draft.unparsedLines, isEmpty);
  });

  test('retains descending rep schemes and standalone movement weights', () {
    final draft = parser.parsePrescription(
      'For time:\n21-15-9\nThrusters (65 lb)\nPull-ups',
    );
    expect(draft.movements.map((m) => m.quantities), [
      [21, 15, 9],
      [21, 15, 9],
    ]);
    expect(draft.movements.map((m) => m.movementId), ['thruster', 'pull_up']);
    expect(draft.movements.first.weightKg, closeTo(29.48, .01));
  });

  test('parses AMRAP, E2MOM slots, and interval headers', () {
    expect(parser.parsePrescription('12 min AMRAP').durationSeconds, 720);
    final emom = parser.parsePrescription(
      'E2MOM 12 min\nMinute 1: 20 wall-ball shots',
    );
    expect(emom.structure, WodStructure.emom);
    expect(emom.intervalCount, 6);
    expect(emom.intervalSeconds, 120);
    expect(emom.movements.single.interval, 1);
    expect(emom.movements.single.movementId, 'wall_ball');
    final intervals = parser.parsePrescription(
      'Intervals: 5 x 2 min\n400-meter run',
    );
    expect(intervals.structure, WodStructure.intervals);
    expect(intervals.intervalCount, 5);
    expect(intervals.intervalSeconds, 120);
  });

  test(
    'keeps alternate standards, separate sets, and special scoring for review',
    () {
      const raw =
          'AMRAP 10\r\n20 wall-ball shots (14/20 lb, 9/10 ft)\n'
          'Set B: max pull-ups or ring rows\nScore: lowest round';
      final draft = parser.parsePrescription(raw);
      expect(draft.rawText, raw);
      expect(draft.parserVersion, isNotEmpty);
      expect(draft.unparsedLines, hasLength(3));
      expect(draft.standards, hasLength(2));
    },
  );
}
