// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Today\'s workout';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'No workout recorded today';

  @override
  String get emptyTodayHelp => 'Start a session to log today\'s workout.';

  @override
  String get startWorkout => 'Start workout';

  @override
  String get workoutLog => 'Workout log';

  @override
  String get loadWorkoutError => 'Couldn\'t load workout records.';

  @override
  String get loadBlocksError => 'Couldn\'t load workout blocks.';

  @override
  String get addStrengthBlock => 'Add strength block';

  @override
  String get addBlockTitle => 'Add workout block';

  @override
  String get blockName => 'Block name';

  @override
  String get strength => 'Strength';

  @override
  String get add => 'Add';

  @override
  String get cancel => 'Cancel';

  @override
  String get addExercise => 'Exercise';

  @override
  String get exerciseName => 'Exercise name';

  @override
  String get exerciseHint => 'Back Squat';

  @override
  String get emptyBlockHelp => 'Add an exercise to this block.';

  @override
  String get loadExercisesError => 'Couldn\'t load exercises.';

  @override
  String get addSet => 'Add set';

  @override
  String get emptyExerciseHelp => 'Add a set to record your work.';

  @override
  String get loadSetsError => 'Couldn\'t load sets.';

  @override
  String get weightKg => 'Weight (kg)';

  @override
  String get reps => 'Reps';

  @override
  String get save => 'Save';

  @override
  String setLabel(int number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps reps';
  }

  @override
  String get invalidSet =>
      'Enter a valid weight and a whole number of reps greater than zero.';

  @override
  String get bodyweight => 'Bodyweight';

  @override
  String get emptyBlocks =>
      'No workout blocks yet.\nAdd a Strength block to start logging.';
}
