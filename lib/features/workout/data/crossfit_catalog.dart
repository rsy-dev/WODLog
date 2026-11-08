/// Common CrossFit movements and named benchmark workouts for offline entry.
///
/// These are suggestions only. User-created movement names remain valid and
/// do not need to be added to this catalog first.
enum CrossFitCategory {
  barbell,
  gymnastics,
  dumbbellKettlebell,
  cardio,
  bodyweight,
  otherEquipment,
  benchmarkWod,
}

class CrossFitCatalogEntry {
  const CrossFitCatalogEntry({
    required this.id,
    required this.name,
    required this.category,
    this.aliases = const [],
  });

  /// Stable, lowercase identifier suitable for persistence or analytics.
  final String id;

  /// English source label. UI localization can map this stable ID later.
  final String name;

  final CrossFitCategory category;
  final List<String> aliases;

  List<String> get searchableNames => [name, ...aliases];
}

class CrossFitCatalog {
  CrossFitCatalog._();

  static const entries = <CrossFitCatalogEntry>[
    // Barbell and weightlifting.
    CrossFitCatalogEntry(
      id: 'back_squat',
      name: 'Back Squat',
      category: CrossFitCategory.barbell,
      aliases: ['Barbell Back Squat'],
    ),
    CrossFitCatalogEntry(
      id: 'front_squat',
      name: 'Front Squat',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'overhead_squat',
      name: 'Overhead Squat',
      category: CrossFitCategory.barbell,
      aliases: ['OHS'],
    ),
    CrossFitCatalogEntry(
      id: 'deadlift',
      name: 'Deadlift',
      category: CrossFitCategory.barbell,
      aliases: ['Barbell Deadlift'],
    ),
    CrossFitCatalogEntry(
      id: 'romanian_deadlift',
      name: 'Romanian Deadlift',
      category: CrossFitCategory.barbell,
      aliases: ['RDL'],
    ),
    CrossFitCatalogEntry(
      id: 'sumo_deadlift_high_pull',
      name: 'Sumo Deadlift High Pull',
      category: CrossFitCategory.barbell,
      aliases: ['SDHP'],
    ),
    CrossFitCatalogEntry(
      id: 'clean',
      name: 'Clean',
      category: CrossFitCategory.barbell,
      aliases: ['Squat Clean'],
    ),
    CrossFitCatalogEntry(
      id: 'power_clean',
      name: 'Power Clean',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'hang_power_clean',
      name: 'Hang Power Clean',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'hang_clean',
      name: 'Hang Squat Clean',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'clean_and_jerk',
      name: 'Clean and Jerk',
      category: CrossFitCategory.barbell,
      aliases: ['Clean & Jerk', 'C&J'],
    ),
    CrossFitCatalogEntry(
      id: 'split_jerk',
      name: 'Split Jerk',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'push_jerk',
      name: 'Push Jerk',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'snatch',
      name: 'Snatch',
      category: CrossFitCategory.barbell,
      aliases: ['Squat Snatch'],
    ),
    CrossFitCatalogEntry(
      id: 'power_snatch',
      name: 'Power Snatch',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'hang_power_snatch',
      name: 'Hang Power Snatch',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'hang_snatch',
      name: 'Hang Squat Snatch',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'push_press',
      name: 'Push Press',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'strict_press',
      name: 'Strict Press',
      category: CrossFitCategory.barbell,
      aliases: ['Shoulder Press', 'Military Press'],
    ),
    CrossFitCatalogEntry(
      id: 'thruster',
      name: 'Thruster',
      category: CrossFitCategory.barbell,
      aliases: ['Barbell Thruster'],
    ),
    CrossFitCatalogEntry(
      id: 'bench_press',
      name: 'Bench Press',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'barbell_row',
      name: 'Barbell Row',
      category: CrossFitCategory.barbell,
      aliases: ['Bent Over Row'],
    ),
    CrossFitCatalogEntry(
      id: 'overhead_lunge',
      name: 'Overhead Lunge',
      category: CrossFitCategory.barbell,
    ),

    // Gymnastics and rig movements.
    CrossFitCatalogEntry(
      id: 'pull_up',
      name: 'Pull-Up',
      category: CrossFitCategory.gymnastics,
      aliases: ['Pullup', 'Pull Up'],
    ),
    CrossFitCatalogEntry(
      id: 'chest_to_bar_pull_up',
      name: 'Chest-to-Bar Pull-Up',
      category: CrossFitCategory.gymnastics,
      aliases: ['Chest To Bar', 'C2B'],
    ),
    CrossFitCatalogEntry(
      id: 'bar_muscle_up',
      name: 'Bar Muscle-Up',
      category: CrossFitCategory.gymnastics,
      aliases: ['BMU'],
    ),
    CrossFitCatalogEntry(
      id: 'ring_muscle_up',
      name: 'Ring Muscle-Up',
      category: CrossFitCategory.gymnastics,
      aliases: ['RMU'],
    ),
    CrossFitCatalogEntry(
      id: 'toes_to_bar',
      name: 'Toes-to-Bar',
      category: CrossFitCategory.gymnastics,
      aliases: ['T2B', 'Toes To Bar'],
    ),
    CrossFitCatalogEntry(
      id: 'knees_to_elbows',
      name: 'Knees-to-Elbows',
      category: CrossFitCategory.gymnastics,
      aliases: ['K2E'],
    ),
    CrossFitCatalogEntry(
      id: 'handstand_push_up',
      name: 'Handstand Push-Up',
      category: CrossFitCategory.gymnastics,
      aliases: ['HSPU', 'Handstand Pushup'],
    ),
    CrossFitCatalogEntry(
      id: 'strict_handstand_push_up',
      name: 'Strict Handstand Push-Up',
      category: CrossFitCategory.gymnastics,
      aliases: ['Strict HSPU'],
    ),
    CrossFitCatalogEntry(
      id: 'handstand_walk',
      name: 'Handstand Walk',
      category: CrossFitCategory.gymnastics,
      aliases: ['HSW'],
    ),
    CrossFitCatalogEntry(
      id: 'ring_dip',
      name: 'Ring Dip',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'bar_dip',
      name: 'Bar Dip',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'ring_row',
      name: 'Ring Row',
      category: CrossFitCategory.gymnastics,
      aliases: ['Inverted Row'],
    ),
    CrossFitCatalogEntry(
      id: 'rope_climb',
      name: 'Rope Climb',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'legless_rope_climb',
      name: 'Legless Rope Climb',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'box_jump',
      name: 'Box Jump',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'box_jump_over',
      name: 'Box Jump-Over',
      category: CrossFitCategory.gymnastics,
      aliases: ['Box Jump Over'],
    ),
    CrossFitCatalogEntry(
      id: 'bar_facing_burpee',
      name: 'Bar-Facing Burpee',
      category: CrossFitCategory.gymnastics,
      aliases: ['BFB'],
    ),

    // Dumbbell and kettlebell.
    CrossFitCatalogEntry(
      id: 'dumbbell_snatch',
      name: 'Dumbbell Snatch',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['DB Snatch', 'Alternating Dumbbell Snatch'],
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_clean',
      name: 'Dumbbell Clean',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['DB Clean'],
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_clean_and_jerk',
      name: 'Dumbbell Clean and Jerk',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['DB Clean and Jerk', 'DB C&J'],
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_thruster',
      name: 'Dumbbell Thruster',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['DB Thruster'],
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_push_press',
      name: 'Dumbbell Push Press',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['DB Push Press'],
    ),
    CrossFitCatalogEntry(
      id: 'devils_press',
      name: "Devil's Press",
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['Devils Press'],
    ),
    CrossFitCatalogEntry(
      id: 'kettlebell_swing',
      name: 'Kettlebell Swing',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['KB Swing', 'Russian Kettlebell Swing'],
    ),
    CrossFitCatalogEntry(
      id: 'american_kettlebell_swing',
      name: 'American Kettlebell Swing',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['American KB Swing', 'Overhead Kettlebell Swing'],
    ),
    CrossFitCatalogEntry(
      id: 'kettlebell_snatch',
      name: 'Kettlebell Snatch',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['KB Snatch'],
    ),
    CrossFitCatalogEntry(
      id: 'kettlebell_clean',
      name: 'Kettlebell Clean',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['KB Clean'],
    ),
    CrossFitCatalogEntry(
      id: 'goblet_squat',
      name: 'Goblet Squat',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'turkish_get_up',
      name: 'Turkish Get-Up',
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['TGU'],
    ),
    CrossFitCatalogEntry(
      id: 'farmers_carry',
      name: "Farmer's Carry",
      category: CrossFitCategory.dumbbellKettlebell,
      aliases: ['Farmers Carry', 'Farmer Carry'],
    ),

    // Cardio and monostructural conditioning.
    CrossFitCatalogEntry(
      id: 'run',
      name: 'Run',
      category: CrossFitCategory.cardio,
      aliases: ['Running'],
    ),
    CrossFitCatalogEntry(
      id: 'row',
      name: 'Row',
      category: CrossFitCategory.cardio,
      aliases: ['Rowing', 'Concept2 Row'],
    ),
    CrossFitCatalogEntry(
      id: 'ski_erg',
      name: 'Ski Erg',
      category: CrossFitCategory.cardio,
      aliases: ['SkiErg'],
    ),
    CrossFitCatalogEntry(
      id: 'bike_erg',
      name: 'Bike Erg',
      category: CrossFitCategory.cardio,
      aliases: ['BikeErg'],
    ),
    CrossFitCatalogEntry(
      id: 'air_bike',
      name: 'Air Bike',
      category: CrossFitCategory.cardio,
      aliases: ['Assault Bike', 'Echo Bike'],
    ),
    CrossFitCatalogEntry(
      id: 'single_unders',
      name: 'Single-Unders',
      category: CrossFitCategory.cardio,
      aliases: ['Single Unders', 'SU'],
    ),
    CrossFitCatalogEntry(
      id: 'double_unders',
      name: 'Double-Unders',
      category: CrossFitCategory.cardio,
      aliases: ['Double Unders', 'DU'],
    ),
    CrossFitCatalogEntry(
      id: 'swim',
      name: 'Swim',
      category: CrossFitCategory.cardio,
      aliases: ['Swimming'],
    ),
    CrossFitCatalogEntry(
      id: 'shuttle_run',
      name: 'Shuttle Run',
      category: CrossFitCategory.cardio,
    ),

    // Bodyweight and core.
    CrossFitCatalogEntry(
      id: 'air_squat',
      name: 'Air Squat',
      category: CrossFitCategory.bodyweight,
      aliases: ['Bodyweight Squat', 'Squat'],
    ),
    CrossFitCatalogEntry(
      id: 'push_up',
      name: 'Push-Up',
      category: CrossFitCategory.bodyweight,
      aliases: ['Pushup', 'Push Up'],
    ),
    CrossFitCatalogEntry(
      id: 'burpee',
      name: 'Burpee',
      category: CrossFitCategory.bodyweight,
    ),
    CrossFitCatalogEntry(
      id: 'sit_up',
      name: 'Sit-Up',
      category: CrossFitCategory.bodyweight,
      aliases: ['Situp', 'Abmat Sit-Up'],
    ),
    CrossFitCatalogEntry(
      id: 'v_up',
      name: 'V-Up',
      category: CrossFitCategory.bodyweight,
      aliases: ['V Up'],
    ),
    CrossFitCatalogEntry(
      id: 'hollow_rock',
      name: 'Hollow Rock',
      category: CrossFitCategory.bodyweight,
    ),
    CrossFitCatalogEntry(
      id: 'lunge',
      name: 'Lunge',
      category: CrossFitCategory.bodyweight,
      aliases: ['Walking Lunge', 'Alternating Lunge'],
    ),
    CrossFitCatalogEntry(
      id: 'box_step_up',
      name: 'Box Step-Up',
      category: CrossFitCategory.bodyweight,
      aliases: ['Step-Up'],
    ),
    CrossFitCatalogEntry(
      id: 'plank',
      name: 'Plank',
      category: CrossFitCategory.bodyweight,
    ),

    // Other common equipment movements.
    CrossFitCatalogEntry(
      id: 'wall_ball',
      name: 'Wall Ball',
      category: CrossFitCategory.otherEquipment,
      aliases: ['Wall Balls', 'Wall-Ball Shot'],
    ),
    CrossFitCatalogEntry(
      id: 'medicine_ball_clean',
      name: 'Medicine Ball Clean',
      category: CrossFitCategory.otherEquipment,
      aliases: ['Med Ball Clean'],
    ),
    CrossFitCatalogEntry(
      id: 'sled_push',
      name: 'Sled Push',
      category: CrossFitCategory.otherEquipment,
    ),
    CrossFitCatalogEntry(
      id: 'sled_pull',
      name: 'Sled Pull',
      category: CrossFitCategory.otherEquipment,
    ),
    CrossFitCatalogEntry(
      id: 'sandbag_carry',
      name: 'Sandbag Carry',
      category: CrossFitCategory.otherEquipment,
    ),

    // Named benchmarks are WOD templates, not strength movements.
    CrossFitCatalogEntry(
      id: 'fran',
      name: 'Fran',
      category: CrossFitCategory.benchmarkWod,
      aliases: ['Fran WOD'],
    ),
    CrossFitCatalogEntry(
      id: 'grace',
      name: 'Grace',
      category: CrossFitCategory.benchmarkWod,
      aliases: ['Grace WOD'],
    ),
    CrossFitCatalogEntry(
      id: 'helen',
      name: 'Helen',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'diane',
      name: 'Diane',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'elizabeth',
      name: 'Elizabeth',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'isabel',
      name: 'Isabel',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'karen',
      name: 'Karen',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'cindy',
      name: 'Cindy',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'mary',
      name: 'Mary',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'annie',
      name: 'Annie',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'jackie',
      name: 'Jackie',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'nancy',
      name: 'Nancy',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'barbara',
      name: 'Barbara',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'chelsea',
      name: 'Chelsea',
      category: CrossFitCategory.benchmarkWod,
    ),
    CrossFitCatalogEntry(
      id: 'dt',
      name: 'DT',
      category: CrossFitCategory.benchmarkWod,
      aliases: ['DT Hero WOD'],
    ),
    CrossFitCatalogEntry(
      id: 'murph',
      name: 'Murph',
      category: CrossFitCategory.benchmarkWod,
      aliases: ['Murph Hero WOD'],
    ),
    CrossFitCatalogEntry(
      id: 'fight_gone_bad',
      name: 'Fight Gone Bad',
      category: CrossFitCategory.benchmarkWod,
    ),
  ];

  static final Map<String, CrossFitCatalogEntry> _byName = {
    for (final entry in entries)
      for (final value in entry.searchableNames) _normalize(value): entry,
  };

  static String normalize(String value) => _normalize(value);

  static CrossFitCatalogEntry? find(String name) => _byName[_normalize(name)];

  static List<CrossFitCatalogEntry> inCategory(CrossFitCategory category) =>
      entries.where((entry) => entry.category == category).toList();

  /// Searches names and aliases by normalized substring, returning canonical
  /// entries in catalog order. A blank query returns the full category/list.
  static List<CrossFitCatalogEntry> search(
    String query, {
    CrossFitCategory? category,
  }) {
    final needle = _normalize(query);
    return entries.where((entry) {
      if (category != null && entry.category != category) return false;
      if (needle.isEmpty) return true;
      return entry.searchableNames.any(
        (name) => _normalize(name).contains(needle),
      );
    }).toList();
  }
}

String _normalize(String value) => value
    .toLowerCase()
    .replaceAll(RegExp(r"[^\p{L}\p{N}]+", unicode: true), ' ')
    .trim()
    .replaceAll(RegExp(r'\s+'), ' ');
