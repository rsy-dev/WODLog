import 'crossfit_catalog.dart';
import 'wod_prescription.dart';

enum BenchmarkScoring {
  elapsedTime,
  roundsAndReps,
  totalStationPoints,
  sumOfStationMinimums,
}

enum BenchmarkStandard { women, men }

class NamedWodPrescription {
  const NamedWodPrescription({
    required this.id,
    required this.sourceUrl,
    required this.scoring,
    required this.draft,
    this.confirmations = const [],
  });

  final String id;
  final String sourceUrl;
  final BenchmarkScoring scoring;
  final WodPrescription draft;
  final List<String> confirmations;
}

/// Offline templates for common CrossFit benchmark workouts.
///
/// Prescriptions are saved as editable notes so athletes can scale the WOD
/// without losing the benchmark name used for progress tracking.
class NamedWodMovement {
  const NamedWodMovement(this.name, this.prescription);

  final String name;
  final String prescription;
}

class NamedWodTemplate {
  const NamedWodTemplate({
    required this.name,
    required this.format,
    required this.prescription,
    required this.movements,
  });

  final String name;
  final String format;
  final String prescription;
  final List<NamedWodMovement> movements;
}

abstract final class NamedWodCatalog {
  static const templates = <NamedWodTemplate>[
    NamedWodTemplate(
      name: 'Fran',
      format: 'For time',
      prescription: '21-15-9 reps',
      movements: [
        NamedWodMovement('Thruster', '21-15-9 reps'),
        NamedWodMovement('Pull-up', '21-15-9 reps'),
      ],
    ),
    NamedWodTemplate(
      name: 'Grace',
      format: 'For time',
      prescription: '30 reps',
      movements: [NamedWodMovement('Clean and Jerk', '30 reps')],
    ),
    NamedWodTemplate(
      name: 'Helen',
      format: 'For time',
      prescription: '3 rounds',
      movements: [
        NamedWodMovement('Run', '400 m × 3'),
        NamedWodMovement('Kettlebell Swing', '21 reps × 3'),
        NamedWodMovement('Pull-up', '12 reps × 3'),
      ],
    ),
    NamedWodTemplate(
      name: 'Diane',
      format: 'For time',
      prescription: '21-15-9 reps',
      movements: [
        NamedWodMovement('Deadlift', '21-15-9 reps'),
        NamedWodMovement('Handstand Push-up', '21-15-9 reps'),
      ],
    ),
    NamedWodTemplate(
      name: 'Elizabeth',
      format: 'For time',
      prescription: '21-15-9 reps',
      movements: [
        NamedWodMovement('Clean', '21-15-9 reps'),
        NamedWodMovement('Ring Dip', '21-15-9 reps'),
      ],
    ),
    NamedWodTemplate(
      name: 'Isabel',
      format: 'For time',
      prescription: '30 reps',
      movements: [NamedWodMovement('Snatch', '30 reps')],
    ),
    NamedWodTemplate(
      name: 'Karen',
      format: 'For time',
      prescription: '150 reps',
      movements: [NamedWodMovement('Wall Ball', '150 reps')],
    ),
    NamedWodTemplate(
      name: 'Cindy',
      format: 'AMRAP 20 min',
      prescription: '20-minute AMRAP',
      movements: [
        NamedWodMovement('Pull-up', '5 reps per round'),
        NamedWodMovement('Push-up', '10 reps per round'),
        NamedWodMovement('Air Squat', '15 reps per round'),
      ],
    ),
    NamedWodTemplate(
      name: 'Mary',
      format: 'AMRAP 20 min',
      prescription: '20-minute AMRAP',
      movements: [
        NamedWodMovement('Handstand Push-up', '5 reps per round'),
        NamedWodMovement('Pistol', '10 reps per round'),
        NamedWodMovement('Pull-up', '15 reps per round'),
      ],
    ),
    NamedWodTemplate(
      name: 'Annie',
      format: 'For time',
      prescription: '50-40-30-20-10 reps',
      movements: [
        NamedWodMovement('Double-under', '50-40-30-20-10 reps'),
        NamedWodMovement('Sit-up', '50-40-30-20-10 reps'),
      ],
    ),
    NamedWodTemplate(
      name: 'Jackie',
      format: 'For time',
      prescription: 'For time',
      movements: [
        NamedWodMovement('Row', '1000 m'),
        NamedWodMovement('Thruster', '50 reps'),
        NamedWodMovement('Pull-up', '30 reps'),
      ],
    ),
    NamedWodTemplate(
      name: 'Nancy',
      format: 'For time',
      prescription: '5 rounds',
      movements: [
        NamedWodMovement('Run', '400 m × 5'),
        NamedWodMovement('Overhead Squat', '15 reps × 5'),
      ],
    ),
    NamedWodTemplate(
      name: 'Barbara',
      format: 'For time',
      prescription: '5 rounds, rest 3 min between rounds',
      movements: [
        NamedWodMovement('Pull-up', '20 reps × 5'),
        NamedWodMovement('Push-up', '30 reps × 5'),
        NamedWodMovement('Sit-up', '40 reps × 5'),
        NamedWodMovement('Air Squat', '50 reps × 5'),
      ],
    ),
    NamedWodTemplate(
      name: 'Chelsea',
      format: 'EMOM 30 min',
      prescription: '30-minute EMOM',
      movements: [
        NamedWodMovement('Pull-up', '5 reps per minute'),
        NamedWodMovement('Push-up', '10 reps per minute'),
        NamedWodMovement('Air Squat', '15 reps per minute'),
      ],
    ),
    NamedWodTemplate(
      name: 'DT',
      format: 'For time',
      prescription: '5 rounds',
      movements: [
        NamedWodMovement('Deadlift', '12 reps × 5'),
        NamedWodMovement('Hang Power Clean', '9 reps × 5'),
        NamedWodMovement('Push Jerk', '6 reps × 5'),
      ],
    ),
    NamedWodTemplate(
      name: 'Murph',
      format: 'For time',
      prescription: 'Partition pull-ups, push-ups, and squats as desired',
      movements: [
        NamedWodMovement('Run', '2 miles total'),
        NamedWodMovement('Pull-up', '100 reps'),
        NamedWodMovement('Push-up', '200 reps'),
        NamedWodMovement('Air Squat', '300 reps'),
      ],
    ),
    NamedWodTemplate(
      name: 'Fight Gone Bad',
      format: 'Rounds for reps',
      prescription: '3 rounds: 1 min per station, 1 min rest after each round',
      movements: [
        NamedWodMovement('Wall Ball', '1 min per round'),
        NamedWodMovement('Sumo Deadlift High Pull', '1 min per round'),
        NamedWodMovement('Box Jump', '1 min per round'),
        NamedWodMovement('Push Press', '1 min per round'),
        NamedWodMovement('Row', '1 min per round'),
      ],
    ),
  ];

  /// Builds a fresh prescription with the athlete's selected load profile.
  /// The actual performance version is confirmed by the editor.
  static List<NamedWodPrescription> prescriptions({
    BenchmarkStandard? standard,
  }) {
    const repScheme = [21, 15, 9];
    const annieScheme = [50, 40, 30, 20, 10];
    const meters = WodQuantityUnit.meters;
    const calories = WodQuantityUnit.calories;

    WodMovementPrescription movement(
      String id,
      List<num> quantities, {
      WodQuantityUnit unit = WodQuantityUnit.reps,
      String? equipment,
      int? interval,
      String? technique,
      (int, int)? lb,
      (int, int)? targetFeet,
    }) {
      final entry = CrossFitCatalog.byId(id)!;
      final pounds = switch (standard) {
        BenchmarkStandard.women => lb?.$1,
        BenchmarkStandard.men => lb?.$2,
        null => null,
      };
      final target = switch (standard) {
        BenchmarkStandard.women => targetFeet?.$1,
        BenchmarkStandard.men => targetFeet?.$2,
        null => null,
      };
      String describe(int pounds, int? feet) =>
          feet == null ? '$pounds lb' : '$pounds lb to $feet ft';
      return WodMovementPrescription(
        name: entry.name,
        movementId: entry.id,
        quantities: List.unmodifiable(quantities),
        unit: unit,
        equipment: equipment,
        interval: interval,
        weightKg: pounds == null ? null : pounds * 0.45359237,
        standard: [
          ?technique,
          if (pounds != null) describe(pounds, target),
        ].join('. '),
        options: lb == null
            ? const []
            : List.unmodifiable([
                'Women: ${describe(lb.$1, targetFeet?.$1)}',
                'Men: ${describe(lb.$2, targetFeet?.$2)}',
              ]),
      );
    }

    NamedWodPrescription template(
      String id,
      String title,
      String url,
      List<WodMovementPrescription> movements, {
      BenchmarkScoring scoring = BenchmarkScoring.elapsedTime,
      WodStructure structure = WodStructure.forTime,
      int? rounds,
      int? duration,
      int? intervalSeconds,
      int? intervalCount,
      List<String> standards = const [],
      List<String> confirmations = const [],
      String collection = 'benchmark',
      String version = '1',
    }) => NamedWodPrescription(
      id: id,
      sourceUrl: url,
      scoring: scoring,
      confirmations: List.unmodifiable([
        if (standard == null && movements.any((m) => m.options.isNotEmpty))
          'Confirm the load and target for the selected standard.',
        ...confirmations,
      ]),
      draft: WodPrescription(
        title: title,
        sourceCollection: collection,
        sourceVersion: '$id@$version',
        structure: structure,
        scoreKind: switch (scoring) {
          BenchmarkScoring.elapsedTime => WodScoreKind.time,
          BenchmarkScoring.roundsAndReps => WodScoreKind.roundsAndReps,
          _ => WodScoreKind.points,
        },
        rounds: rounds,
        durationSeconds: duration,
        intervalSeconds: intervalSeconds,
        intervalCount: intervalCount,
        standards: standards,
        movements: List.unmodifiable(movements),
      ),
    );

    return List.unmodifiable([
      template(
        'fran',
        'Fran',
        'https://www.crossfit.com/essentials/crossfit-15-benchmarks',
        [
          movement('thruster', repScheme, lb: (65, 95), equipment: 'barbell'),
          movement('pull_up', repScheme),
        ],
      ),
      template(
        'cindy',
        'Cindy',
        'https://www.crossfit.com/benchmark/cindy',
        [
          movement('pull_up', [5]),
          movement('push_up', [10]),
          movement('air_squat', [15]),
        ],
        scoring: BenchmarkScoring.roundsAndReps,
        structure: WodStructure.amrap,
        duration: 1200,
      ),
      template('grace', 'Grace', 'https://www.crossfit.com/benchmark/grace', [
        movement(
          'clean_and_jerk',
          [30],
          lb: (95, 135),
          equipment: 'barbell',
          technique: 'Power clean and jerk',
        ),
      ]),
      template('annie', 'Annie', 'https://www.crossfit.com/benchmark/annie', [
        movement('double_unders', annieScheme, equipment: 'jump rope'),
        movement('sit_up', annieScheme),
      ]),
      template(
        'dt',
        'DT',
        'https://www.crossfit.com/heroes/dt-workout',
        [
          movement('deadlift', [12], lb: (105, 155), equipment: 'barbell'),
          movement(
            'hang_power_clean',
            [9],
            lb: (105, 155),
            equipment: 'barbell',
          ),
          movement('push_jerk', [6], lb: (105, 155), equipment: 'barbell'),
        ],
        rounds: 5,
        collection: 'hero',
      ),
      template(
        'helen',
        'Helen',
        'https://www.crossfit.com/250625',
        [
          movement('run', [400], unit: meters),
          movement(
            'american_kettlebell_swing',
            [21],
            lb: (35, 53),
            equipment: 'kettlebell',
          ),
          movement('pull_up', [12]),
        ],
        rounds: 3,
        version: '2025-06-25',
      ),
      template('karen', 'Karen', 'https://www.crossfit.com/benchmark/karen', [
        movement(
          'wall_ball',
          [150],
          lb: (14, 20),
          targetFeet: (9, 10),
          equipment: 'medicine ball',
        ),
      ]),
      template('diane', 'Diane', 'https://www.crossfit.com/benchmark/diane', [
        movement('deadlift', repScheme, lb: (155, 225), equipment: 'barbell'),
        movement('handstand_push_up', repScheme),
      ]),
      template(
        'murph',
        'Murph',
        'https://www.crossfit.com/benchmark/murph',
        [
          movement('run', [1609.344], unit: meters),
          movement('pull_up', [100]),
          movement('push_up', [200]),
          movement('air_squat', [300]),
          movement('run', [1609.344], unit: meters),
        ],
        collection: 'hero',
        standards: const [
          'The middle movements may be partitioned. The runs bracket the middle work.',
          'Prescribed vest or armor: women 14 lb, men 20 lb if available.',
        ],
        confirmations: const [
          'Confirm the actual vest weight or no vest.',
          'Confirm the partition scheme or unpartitioned work.',
        ],
      ),
      template(
        'fight_gone_bad',
        'Fight Gone Bad',
        'https://www.crossfit.com/240412',
        [
          movement(
            'wall_ball',
            [],
            lb: (14, 20),
            targetFeet: (9, 10),
            equipment: 'medicine ball',
            interval: 1,
          ),
          movement(
            'sumo_deadlift_high_pull',
            [],
            lb: (55, 75),
            equipment: 'barbell',
            interval: 2,
          ),
          movement('box_jump', [], equipment: '20-inch box', interval: 3),
          movement(
            'push_press',
            [],
            lb: (55, 75),
            equipment: 'barbell',
            interval: 4,
          ),
          movement('row', [], unit: calories, equipment: 'rower', interval: 5),
        ],
        scoring: BenchmarkScoring.totalStationPoints,
        structure: WodStructure.intervals,
        rounds: 3,
        intervalSeconds: 60,
        intervalCount: 15,
        version: '2024-04-12',
        standards: const [
          'Each station lasts 60 seconds. Rest 60 seconds between rounds.',
          'Add every rep and every rowing calorie from all rounds.',
        ],
      ),
      template(
        'tabata_this',
        'Tabata This!',
        'https://library.crossfit.com/free/pdf/04_02_erg_scores_hof_workouts.pdf',
        [
          movement('air_squat', [], interval: 1),
          movement('row', [], unit: calories, equipment: 'rower', interval: 2),
          movement('pull_up', [], interval: 3),
          movement('sit_up', [], interval: 4),
          movement('push_up', [], interval: 5),
        ],
        scoring: BenchmarkScoring.sumOfStationMinimums,
        structure: WodStructure.intervals,
        intervalSeconds: 30,
        intervalCount: 40,
        standards: const [
          'Complete eight intervals at each station: 20 seconds of work and 10 seconds of rest.',
          'Allow a 60-second transition between stations.',
          'For each station, take the lowest interval result, then sum the five station minimums.',
        ],
      ),
    ]);
  }

  /// Copies only the snapshot. A new attempt ID and score are chosen at save.
  static WodPrescription repeatDraft(WodPrescription previous) =>
      WodPrescription.fromJson(previous.toJson());

  static String _normalize(String value) => value
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9]+'), ' ')
      .trim()
      .replaceAll(RegExp(r'\s+'), ' ');

  static NamedWodTemplate? find(String name) {
    final key = _normalize(name);
    for (final template in templates) {
      if (_normalize(template.name) == key ||
          _normalize('${template.name} WOD') == key ||
          (template.name == 'Fight Gone Bad' && _normalize('FGB') == key)) {
        return template;
      }
    }
    return null;
  }
}
