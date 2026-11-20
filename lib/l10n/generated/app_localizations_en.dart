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
  String setWeight(String unit) {
    return 'Weight ($unit)';
  }

  @override
  String get reps => 'Reps';

  @override
  String get save => 'Save';

  @override
  String setLabel(String number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps reps';
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
  String setCount(String count) {
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

  @override
  String get settings => 'Settings';

  @override
  String get weightUnit => 'Weight unit';

  @override
  String get weightUnitError => 'Could not save the weight unit.';

  @override
  String get categoryBenchmarkWod => 'Benchmark WODs';

  @override
  String get noRecentMovementRecords =>
      'No movement records in the last 14 days.';

  @override
  String get todayTab => 'Today';

  @override
  String get recordWod => 'Record WOD';

  @override
  String get languageSetting => 'Language';

  @override
  String get deviceLanguage => 'Device language';

  @override
  String get weeklyGoal => 'Weekly goal';

  @override
  String get weightCalculator => 'Weight calculator';

  @override
  String get movementLibrary => 'Movement library';

  @override
  String get glossary => 'Glossary';

  @override
  String get lastSevenDays => 'Last 7 days';

  @override
  String get pastWods => 'Past WODs';

  @override
  String get strengthSessions => 'Strength sessions';

  @override
  String get chooseBenchmark => 'Choose a benchmark';

  @override
  String get searchWorkouts => 'Search workouts';

  @override
  String get noMatchingWorkouts => 'No matching workouts';

  @override
  String get settingsSaveError => 'Could not save the setting. Try again.';

  @override
  String get openSession => 'Open session';

  @override
  String get reviewWodText => 'Review WOD text';

  @override
  String get wodSourceText => 'Workout text';

  @override
  String get unreadWodLines => 'Lines to review';

  @override
  String get wodPrescription => 'Prescription';

  @override
  String get closeSheet => 'Close';

  @override
  String get glossaryAmrap =>
      'Complete as many rounds or reps as possible in the time limit.';

  @override
  String get glossaryEmom =>
      'Start the prescribed work at the start of each minute.';

  @override
  String get glossaryForTime =>
      'Record completion time or completed reps at the cap.';

  @override
  String get glossaryRx => 'Perform the workout as prescribed.';

  @override
  String get glossaryScaled => 'Adjust the load, movement, or volume.';

  @override
  String get wodSaveError => 'Could not save the WOD result. Try again.';

  @override
  String get applyWodSource => 'Apply to notes';

  @override
  String get statsTab => 'Stats';

  @override
  String get wodFinished => 'Finished';

  @override
  String get wodCapped => 'Time cap';

  @override
  String get wodStopped => 'Stopped';

  @override
  String get wodEnding => 'Finish status';

  @override
  String get wodFinishTime => 'Finish time (min:sec)';

  @override
  String get wodCompletedReps => 'Reps completed at the cap';

  @override
  String get wodCompletedRounds => 'Completed rounds';

  @override
  String get wodCompletedIntervals => 'Completed intervals';

  @override
  String get wodExtraReps => 'Extra reps';

  @override
  String get wodEnterNewScore => 'Enter a new score';

  @override
  String get wodInvalidScore => 'Enter a valid result for this workout type.';

  @override
  String get wodPersonalRecords => 'WOD personal records';

  @override
  String get wodNoComparableRecords =>
      'No WOD results with confirmed comparison conditions.';

  @override
  String get wodCurrentBest => 'Current best';

  @override
  String get wodRecordImprovements => 'Record improvements';

  @override
  String get wodScoreHistory => 'Score history';

  @override
  String get strengthPersonalRecords => 'Strength records';

  @override
  String get strengthEstimatedOneRepMax => 'Estimated 1RM';

  @override
  String get strengthRecordMethod =>
      'Actual: successful sets at each rep count. Estimated: Epley (2–10 reps).';

  @override
  String get strengthDailyBest => 'Heaviest weight by date';

  @override
  String get wodRecentRecords => 'Recent WODs';

  @override
  String get wodViewAll => 'View all';

  @override
  String get wodRecordAgain => 'Record again';

  @override
  String get wodNewPersonalRecord => 'New personal record';

  @override
  String get wodWorkoutStandard => 'Workout standard';

  @override
  String get wodUnconfirmedStandard => 'Unconfirmed';

  @override
  String get wodCustomStandard => 'Custom';

  @override
  String get wodTimeCapSeconds => 'Time cap (seconds)';

  @override
  String get wodTotalRounds => 'Total rounds';

  @override
  String get wodDurationSeconds => 'Workout duration (seconds)';

  @override
  String get wodTotalIntervals => 'Total intervals';

  @override
  String get wodIntervalLengthSeconds => 'Interval length (seconds)';

  @override
  String get wodIntervals => 'Intervals';

  @override
  String get wodTiebreak => 'Tiebreak (min:sec)';

  @override
  String get wodUnreadLinesConfirmed =>
      'I reviewed the unread lines and corrected the prescription';

  @override
  String get wodMovementQuantities => 'Quantities by segment (/ separated)';

  @override
  String get wodMovementEquipment => 'Equipment';

  @override
  String get wodMovementStandard => 'Target height and movement standard';

  @override
  String get wodMoveUp => 'Move up';

  @override
  String get wodMoveDown => 'Move down';

  @override
  String get wodDeleteRecord => 'Delete WOD';

  @override
  String get glossaryWodMetcon =>
      'Workout of the day / metabolic conditioning.';

  @override
  String get glossaryRft => 'Time to complete the prescribed rounds.';

  @override
  String get glossaryE2Mom => 'Start the prescribed work every two minutes.';

  @override
  String get glossaryIntervals => 'Repeat prescribed work and rest intervals.';

  @override
  String get glossaryTabata =>
      'Repeat 20 seconds of work and 10 seconds of rest.';

  @override
  String get glossaryMaxLoadReps =>
      'Heaviest successful load / maximum repetitions.';

  @override
  String get glossaryDistanceCalories =>
      'Distance or calorie score recorded by the equipment.';

  @override
  String get glossaryFoundations =>
      'A prescription for athletes building foundational skills.';

  @override
  String get glossaryTimeCap => 'The prescribed workout time limit.';

  @override
  String get glossaryTiebreak =>
      'The elapsed time at a specified checkpoint used to break a tie.';

  @override
  String get glossaryChipper =>
      'Complete a series of movements in order, once each.';

  @override
  String get glossaryCoupletTriplet =>
      'A workout combining two / three movements.';

  @override
  String get glossaryLadder =>
      'Repetitions or load change in steps across sets.';

  @override
  String get glossaryBuyInCashOut =>
      'Prescribed work before / after the main workout.';

  @override
  String get glossaryUnbroken => 'Complete a set without a break.';

  @override
  String get glossaryNoRep =>
      'A repetition that does not meet the movement standard.';

  @override
  String get glossaryPr =>
      'A personal record under comparable workout conditions.';
}
