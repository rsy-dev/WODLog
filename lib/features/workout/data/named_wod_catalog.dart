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
