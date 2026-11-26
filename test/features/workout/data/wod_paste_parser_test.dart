import 'package:flutter_test/flutter_test.dart';
import 'package:wodlog/features/workout/data/wod_parser.dart';
import 'package:wodlog/features/workout/data/wod_prescription.dart';

void main() {
  const parser = WodTextParser();

  test('parses official AMRAP and round-for-time headings', () {
    final amrap = parser.parsePrescription(
      'Complete as many rounds and reps as possible in 16 minutes of:\n'
      '20-calorie row',
    );
    expect(amrap.structure, WodStructure.amrap);
    expect(amrap.durationSeconds, 960);
    expect(amrap.movements.single.movementId, 'row');

    final forTime = parser.parsePrescription(
      '4 rounds for time of:\n400-meter run\nTime cap: 15 min',
    );
    expect(forTime.structure, WodStructure.forTime);
    expect(forTime.rounds, 4);
    expect(forTime.timeCapSeconds, 900);
    expect(forTime.movements.single.quantities, [400]);
  });

  test('parses EMOM slots and keeps official instructions for review', () {
    const raw = '''
Every minute on the minute for 15 minutes complete:
Minute 1: 20 wall-ball shots
Minute 3: 10 deadlifts. Minute 4: Max ring muscle-ups
Minute 5: Rest
♀ 14-lb medicine ball to a 9-foot target
Post total ring muscle-up reps to comments.
Scaling:
10 ring rows per minute
Coaching cues:
2 sets with a consistent pace
''';
    final draft = parser.parsePrescription(raw);
    expect(draft.rawText, raw);
    expect(draft.structure, WodStructure.emom);
    expect(draft.intervalCount, 15);
    expect(draft.intervalSeconds, 60);
    expect(draft.scoreKind, WodScoreKind.reps);
    expect(draft.movements.map((movement) => movement.interval), [1, 3, 4]);
    expect(draft.movements.map((movement) => movement.movementId), [
      'wall_ball',
      'deadlift',
      'ring_muscle_up',
    ]);
    expect(draft.movements.last.quantities, isEmpty);
    expect(
      draft.unparsedLines,
      containsAll([
        'Minute 5: Rest',
        'Post total ring muscle-up reps to comments.',
        '10 ring rows per minute',
        '2 sets with a consistent pace',
      ]),
    );
    expect(
      draft.standards,
      contains('♀ 14-lb medicine ball to a 9-foot target'),
    );
  });

  test(
    'inherits a shared interval header and keeps common standards for review',
    () {
      const raw = '''
Every 3 minutes for 8 rounds:
♀ 20-inch box
Rx’d:
12 box jumps
Intermediate:
10 box step-ups
Beginner:
8 box step-ups
''';
      expect(parser.parse(raw).levels.map((level) => level.label), [
        'Rx’d',
        'Intermediate',
        'Beginner',
      ]);
      final prescription = parser.parsePrescription(raw, levelIndex: 0);
      expect(prescription.version, WodVersion.rx);
      expect(prescription.structure, WodStructure.intervals);
      expect(prescription.intervalSeconds, 180);
      expect(prescription.intervalCount, 8);
      expect(prescription.movements.single.movementId, 'box_jump');
      expect(prescription.unparsedLines, ['♀ 20-inch box']);
      expect(prescription.standards, ['♀ 20-inch box', 'Rx’d']);
    },
  );

  test(
    'separates implicit Rx and official options without mixing movements',
    () {
      const raw = '''
Every minute on the minute for 15 minutes complete:
Minute 1: 20 wall-ball shots
Scaling:
10 ring rows per minute
Intermediate option:
E2MOM 12 min
Minute 1: 15 box jumps
Beginner option:
4 rounds for time of:
400-meter run
''';
      expect(parser.parse(raw).levels.map((level) => level.label), [
        'Rx',
        'Intermediate option',
        'Beginner option',
      ]);
      final rx = parser.parsePrescription(raw, levelIndex: 0);
      final intermediate = parser.parsePrescription(raw, levelIndex: 1);
      final beginner = parser.parsePrescription(raw, levelIndex: 2);
      expect(rx.version, WodVersion.rx);
      expect(rx.intervalSeconds, 60);
      expect(rx.movements.single.movementId, 'wall_ball');
      expect(intermediate.intervalSeconds, 120);
      expect(intermediate.intervalCount, 6);
      expect(intermediate.movements.single.movementId, 'box_jump');
      expect(intermediate.unparsedLines, isEmpty);
      expect(beginner.rounds, 4);
      expect(beginner.movements.single.movementId, 'run');
      expect(beginner.rawText, raw);
    },
  );

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
