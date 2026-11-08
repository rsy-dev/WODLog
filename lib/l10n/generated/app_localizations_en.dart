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

  @override
  String get history => 'History';

  @override
  String get emptyHistory => 'No workouts recorded yet.';

  @override
  String get editSession => 'Edit session';

  @override
  String get sessionTitle => 'Session title';

  @override
  String get sessionNotes => 'Notes (optional)';

  @override
  String get deleteSession => 'Delete session';

  @override
  String get confirmDeleteSession =>
      'Delete this session and all of its workout records? This cannot be undone.';

  @override
  String get wodSectionTitle => 'WODs';

  @override
  String get addWodBlock => 'Add WOD';

  @override
  String get wodName => 'WOD name';

  @override
  String get addWodResult => 'Add result';

  @override
  String get editWodResult => 'Edit result';

  @override
  String get wodResultType => 'Result type';

  @override
  String get wodScore => 'Score or result';

  @override
  String get wodNotes => 'Result notes';

  @override
  String get emptyWodBlocks => 'No WODs yet. Add one to log a result.';

  @override
  String get emptyWodResult => 'No result recorded.';

  @override
  String get resultForTime => 'For time';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => 'Rounds + reps';

  @override
  String get resultLoad => 'Load';

  @override
  String get resultOther => 'Other';

  @override
  String get editSet => 'Edit set';

  @override
  String get deleteSet => 'Delete set';

  @override
  String get confirmDeleteSet => 'Delete this set?';

  @override
  String get editBlock => 'Edit block';

  @override
  String get deleteBlock => 'Delete block';

  @override
  String get confirmDeleteBlock =>
      'Delete this block and all its exercises and sets? This cannot be undone.';

  @override
  String get editExercise => 'Edit exercise';

  @override
  String get deleteExercise => 'Delete exercise';

  @override
  String get confirmDeleteExercise =>
      'Delete this exercise and all its sets? This cannot be undone.';

  @override
  String get progress => 'Progress';

  @override
  String get todaySummary => 'Today at a glance';

  @override
  String get trainingOverview => 'Training overview';

  @override
  String get sessionsLabel => 'sessions';

  @override
  String get setsLabel => 'sets';

  @override
  String movementCount(int count) {
    return '$count movements';
  }

  @override
  String get movementsLabel => 'movements';

  @override
  String setCount(int count) {
    return '$count sets';
  }

  @override
  String get weightedVolume => 'Weighted volume';

  @override
  String get volumeUnit => 'kg·reps';

  @override
  String get bestLoadChange => 'Best load change';

  @override
  String get volumeChange => 'Volume change';

  @override
  String get repChange => 'Rep change';

  @override
  String get noProgressYet =>
      'Repeat an exercise to see how your record changes.';

  @override
  String get previousWorkout => 'Previous';

  @override
  String get lastWorkout => 'Latest';

  @override
  String get chooseDate => 'Choose workout date';

  @override
  String get allMovements => 'All';

  @override
  String get customExercise => 'Add a custom exercise';

  @override
  String get noMovementsFound => 'No movements found';

  @override
  String get noChange => 'No change';

  @override
  String get searchMovements => 'Search movements';

  @override
  String get benchmarkWorkouts => 'Benchmark WODs';

  @override
  String get movementTypes => 'Similar movement types';

  @override
  String get last7Days => 'Last 7 days';

  @override
  String get previous7Days => 'Previous 7 days';

  @override
  String get categoryBarbell => 'Barbell';

  @override
  String get categoryGymnastics => 'Gymnastics';

  @override
  String get categoryDumbbellKettlebell => 'Dumbbell & kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Bodyweight';

  @override
  String get categoryOtherEquipment => 'Other equipment';
}
