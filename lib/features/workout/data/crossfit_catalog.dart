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

enum MovementCategory {
  gymnastics,
  machine,
  barbell,
  dumbbellKettlebell,
  bodyweight,
  runSwim,
  otherEquipment,
}

class MovementMatch {
  const MovementMatch(this.input, this.entry, this.candidates);
  final String input;
  final CrossFitCatalogEntry? entry;
  final List<CrossFitCatalogEntry> candidates;
  bool get allowsCustomEntry => entry == null;
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

  MovementCategory? get movementCategory => switch (category) {
    CrossFitCategory.benchmarkWod => null,
    CrossFitCategory.barbell => MovementCategory.barbell,
    CrossFitCategory.dumbbellKettlebell => MovementCategory.dumbbellKettlebell,
    CrossFitCategory.gymnastics when !id.startsWith('box_') =>
      MovementCategory.gymnastics,
    CrossFitCategory.bodyweight when id != 'box_step_up' =>
      MovementCategory.bodyweight,
    CrossFitCategory.cardio
        when const {'run', 'shuttle_run', 'swim'}.contains(id) =>
      MovementCategory.runSwim,
    CrossFitCategory.cardio when !id.endsWith('_unders') =>
      MovementCategory.machine,
    _ => MovementCategory.otherEquipment,
  };

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
      aliases: ['백 스쿼트', 'Barbell Back Squat'],
    ),
    CrossFitCatalogEntry(
      id: 'front_squat',
      name: 'Front Squat',
      category: CrossFitCategory.barbell,
      aliases: ['프론트 스쿼트'],
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
      aliases: ['데드리프트', 'Barbell Deadlift'],
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
      aliases: ['클린', 'Squat Clean'],
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
      aliases: ['Hang Clean'],
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
      aliases: ['스내치', 'Squat Snatch'],
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
      aliases: ['Hang Snatch'],
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
      aliases: ['풀업', 'Pullup', 'Pull Up'],
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
      aliases: ['박스 점프'],
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
      aliases: ['덤벨 스내치', 'DB Snatch', 'Alternating Dumbbell Snatch'],
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
      aliases: ['케틀벨 스윙', 'KB Swing', 'Russian Kettlebell Swing'],
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
      aliases: ['달리기', 'Running'],
    ),
    CrossFitCatalogEntry(
      id: 'row',
      name: 'Row',
      category: CrossFitCategory.cardio,
      aliases: ['로잉', 'Rowing', 'Concept2 Row'],
    ),
    CrossFitCatalogEntry(
      id: 'ski_erg',
      name: 'Ski Erg',
      category: CrossFitCategory.cardio,
      aliases: ['스키에르그', 'SkiErg'],
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
      aliases: ['에어 바이크', '에어바이크', 'AirBike'],
    ),
    CrossFitCatalogEntry(
      id: 'single_unders',
      name: 'Single-Unders',
      category: CrossFitCategory.cardio,
      aliases: ['Single Unders', 'Single Under', 'SU'],
    ),
    CrossFitCatalogEntry(
      id: 'double_unders',
      name: 'Double-Unders',
      category: CrossFitCategory.cardio,
      aliases: ['더블언더', 'Double Unders', 'Double Under', 'DU'],
    ),
    CrossFitCatalogEntry(
      id: 'swim',
      name: 'Swim',
      category: CrossFitCategory.cardio,
      aliases: ['수영', 'Swimming'],
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
      aliases: ['에어 스쿼트', 'Bodyweight Squat', 'Squat'],
    ),
    CrossFitCatalogEntry(
      id: 'push_up',
      name: 'Push-Up',
      category: CrossFitCategory.bodyweight,
      aliases: ['푸시업', 'Pushup', 'Push Up'],
    ),
    CrossFitCatalogEntry(
      id: 'burpee',
      name: 'Burpee',
      category: CrossFitCategory.bodyweight,
      aliases: ['버피'],
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
      aliases: [
        '월볼',
        '월볼샷',
        '월볼 샷',
        'Wall-Ball Shots',
        'Wall Balls',
        'Wall-Ball Shot',
      ],
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

    // Additional movements from the official movement index in issue #19.
    CrossFitCatalogEntry(
      id: 'back_scale',
      name: 'Back Scale',
      category: CrossFitCategory.bodyweight,
    ),
    CrossFitCatalogEntry(
      id: 'barbell_front_rack_lunge',
      name: 'Barbell Front-rack Lunge',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'burpee_box_jump_over',
      name: 'Burpee Box Jump-over',
      category: CrossFitCategory.otherEquipment,
    ),
    CrossFitCatalogEntry(
      id: 'butterfly_pull_up',
      name: 'Butterfly Pull-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'chest_to_wall_handstand_push_up',
      name: 'Chest-to-wall Handstand Push-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'clean_and_push_jerk',
      name: 'Clean and Push Jerk',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'dip',
      name: 'Dip',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_deadlift',
      name: 'Dumbbell Deadlift',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_front_squat',
      name: 'Dumbbell Front Squat',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_front_rack_lunge',
      name: 'Dumbbell Front-rack Lunge',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_hang_clean',
      name: 'Dumbbell Hang Clean',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_hang_power_clean',
      name: 'Dumbbell Hang Power Clean',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_overhead_squat',
      name: 'Dumbbell Overhead Squat',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_overhead_walking_lunge',
      name: 'Dumbbell Overhead Walking Lunge',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_power_clean',
      name: 'Dumbbell Power Clean',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_power_snatch',
      name: 'Dumbbell Power Snatch',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_push_jerk',
      name: 'Dumbbell Push Jerk',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'dumbbell_squat_snatch',
      name: 'Dumbbell Squat Snatch',
      category: CrossFitCategory.dumbbellKettlebell,
    ),
    CrossFitCatalogEntry(
      id: 'forward_roll_from_support',
      name: 'Forward Roll From Support',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'freestanding_handstand_push_up',
      name: 'Freestanding Handstand Push-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'front_scale',
      name: 'Front Scale',
      category: CrossFitCategory.bodyweight,
    ),
    CrossFitCatalogEntry(
      id: 'ghd_back_extension',
      name: 'GHD Back Extension',
      category: CrossFitCategory.otherEquipment,
    ),
    CrossFitCatalogEntry(
      id: 'ghd_hip_and_back_extension',
      name: 'GHD Hip and Back Extension',
      category: CrossFitCategory.otherEquipment,
    ),
    CrossFitCatalogEntry(
      id: 'ghd_hip_extension',
      name: 'GHD Hip Extension',
      category: CrossFitCategory.otherEquipment,
    ),
    CrossFitCatalogEntry(
      id: 'ghd_sit_up',
      name: 'GHD Sit-up',
      category: CrossFitCategory.otherEquipment,
    ),
    CrossFitCatalogEntry(
      id: 'glide_kip',
      name: 'Glide Kip',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'good_morning',
      name: 'Good Morning',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'handstand',
      name: 'Handstand',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'handstand_pirouette',
      name: 'Handstand Pirouette',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'hang_clean_and_push_jerk',
      name: 'Hang Clean and Push Jerk',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'hanging_l_sit',
      name: 'Hanging L-sit',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'inverted_burpee',
      name: 'Inverted Burpee',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'kipping_bar_muscle_up',
      name: 'Kipping Bar Muscle-up',
      category: CrossFitCategory.gymnastics,
      aliases: ['BMU', 'Bar MU'],
    ),
    CrossFitCatalogEntry(
      id: 'kipping_chest_to_bar_pull_up',
      name: 'Kipping Chest-to-bar Pull-up',
      category: CrossFitCategory.gymnastics,
      aliases: ['C2B', 'CTB'],
    ),
    CrossFitCatalogEntry(
      id: 'kipping_deficit_handstand_push_up',
      name: 'Kipping Deficit Handstand Push-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'kipping_handstand_push_up',
      name: 'Kipping Handstand Push-up',
      category: CrossFitCategory.gymnastics,
      aliases: ['Kipping HSPU'],
    ),
    CrossFitCatalogEntry(
      id: 'kipping_muscle_up',
      name: 'Kipping Muscle-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'kipping_pull_up',
      name: 'Kipping Pull-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'kipping_toes_to_bar',
      name: 'Kipping Toes-to-bar',
      category: CrossFitCategory.gymnastics,
      aliases: ['TTB', 'Toes to Bar'],
    ),
    CrossFitCatalogEntry(
      id: 'l_pull_up',
      name: 'L Pull-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'l_sit',
      name: 'L-sit',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'l_sit_on_rings',
      name: 'L-sit on Rings',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'l_sit_rope_climb',
      name: 'L-sit Rope Climb',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'l_sit_to_shoulder_stand',
      name: 'L-sit to Shoulder Stand',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'modified_rope_climb',
      name: 'Modified Rope Climb',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'muscle_snatch',
      name: 'Muscle Snatch',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'power_clean_and_split_jerk',
      name: 'Power Clean and Split Jerk',
      category: CrossFitCategory.barbell,
      aliases: ['Power Clean + Split Jerk'],
    ),
    CrossFitCatalogEntry(
      id: 'pull_over',
      name: 'Pull-over',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'ring_push_up',
      name: 'Ring Push-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'rope_climb_basket',
      name: 'Rope Climb (Basket)',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'rope_climb_wrapping',
      name: 'Rope Climb (Wrapping)',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'shoot_through',
      name: 'Shoot-through',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'single_leg_squat_pistol',
      name: 'Single-leg Squat (Pistol)',
      category: CrossFitCategory.bodyweight,
      aliases: ['Pistol', 'Pistol Squat'],
    ),
    CrossFitCatalogEntry(
      id: 'skin_the_cat',
      name: 'Skin the Cat',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'slam_ball',
      name: 'Slam Ball',
      category: CrossFitCategory.otherEquipment,
    ),
    CrossFitCatalogEntry(
      id: 'snatch_balance',
      name: 'Snatch Balance',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'sots_press',
      name: 'Sots Press',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'split_clean',
      name: 'Split Clean',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'split_snatch',
      name: 'Split Snatch',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'straddle_press_to_handstand',
      name: 'Straddle Press to Handstand',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'strict_bar_muscle_up',
      name: 'Strict Bar Muscle-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'strict_chest_to_bar_pull_up',
      name: 'Strict Chest-to-bar Pull-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'strict_knees_to_elbows',
      name: 'Strict Knees-to-elbows',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'strict_muscle_up',
      name: 'Strict Muscle-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'strict_pull_up',
      name: 'Strict Pull-up',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'strict_toes_to_bar',
      name: 'Strict Toes-to-bar',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'strict_toes_to_rings',
      name: 'Strict Toes-to-rings',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'sumo_deadlift',
      name: 'Sumo Deadlift',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'swing_to_backward_roll_to_support',
      name: 'Swing to Backward Roll to Support',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'wall_walk',
      name: 'Wall Walk',
      category: CrossFitCategory.gymnastics,
    ),
    CrossFitCatalogEntry(
      id: 'windshield_wiper',
      name: 'Windshield Wiper',
      category: CrossFitCategory.bodyweight,
    ),
    CrossFitCatalogEntry(
      id: 'zercher_squat',
      name: 'Zercher Squat',
      category: CrossFitCategory.barbell,
    ),
    CrossFitCatalogEntry(
      id: 'bike',
      name: 'Bike',
      category: CrossFitCategory.cardio,
    ),
    CrossFitCatalogEntry(
      id: 'echo_bike',
      name: 'Echo Bike',
      category: CrossFitCategory.cardio,
      aliases: ['Rogue Echo Bike', 'EchoBike', '에코 바이크', '에코바이크'],
    ),
    CrossFitCatalogEntry(
      id: 'assault_bike',
      name: 'Assault Bike',
      category: CrossFitCategory.cardio,
      aliases: ['AssaultBike', '어썰트 바이크', '어썰트바이크'],
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
    for (final entry in entries.reversed)
      for (final value in entry.searchableNames) _normalize(value): entry,
  };

  static final _byId = {for (final entry in entries) entry.id: entry};

  static CrossFitCatalogEntry? byId(String id) => _byId[id];

  static MovementMatch resolveMovement(String input) {
    final query = _normalize(input);
    final candidates = query.isEmpty
        ? <CrossFitCatalogEntry>[]
        : search(input)
              .where((entry) => entry.movementCategory != null)
              .toList();
    final exact = candidates.where(
      (entry) => entry.searchableNames.any((name) => _normalize(name) == query),
    );
    final canonical = exact.where((entry) => _normalize(entry.name) == query);
    final matches = canonical.isEmpty ? exact : canonical;
    final entry = matches.length == 1 ? matches.single : null;
    return MovementMatch(input, entry, List.unmodifiable(candidates));
  }

  static List<CrossFitCatalogEntry> searchMovements(
    String query, {
    MovementCategory? category,
  }) => search(query).where((entry) {
    final group = entry.movementCategory;
    return group != null && (category == null || group == category);
  }).toList();

  static String normalize(String value) => _normalize(value);

  static CrossFitCatalogEntry? find(String name) {
    final key = _normalize(name);
    return switch (key) {
      'echo bike' || 'assault bike' => byId('air_bike'),
      _ => _byName[key],
    };
  }

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
