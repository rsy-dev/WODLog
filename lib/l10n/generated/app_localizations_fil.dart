// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Workout ngayong araw';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Wala pang workout na naitala ngayong araw';

  @override
  String get emptyTodayHelp =>
      'Gumawa ng session para maitala ang workout ngayong araw.';

  @override
  String get startWorkout => 'Simulan ang workout';

  @override
  String get workoutLog => 'Workout log';

  @override
  String get loadWorkoutError => 'Hindi ma-load ang mga workout record.';

  @override
  String get loadBlocksError => 'Hindi ma-load ang mga workout block.';

  @override
  String get addStrengthBlock => 'Magdagdag ng strength block';

  @override
  String get addBlockTitle => 'Magdagdag ng workout block';

  @override
  String get blockName => 'Pangalan ng block';

  @override
  String get strength => 'Strength';

  @override
  String get add => 'Idagdag';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get addExercise => 'Ehersisyo';

  @override
  String get exerciseName => 'Pangalan ng ehersisyo';

  @override
  String get exerciseHint => 'Back Squat';

  @override
  String get emptyBlockHelp => 'Magdagdag ng ehersisyo sa block na ito.';

  @override
  String get loadExercisesError => 'Hindi ma-load ang mga ehersisyo.';

  @override
  String get addSet => 'Magdagdag ng set';

  @override
  String get emptyExerciseHelp =>
      'Magdagdag ng set para maitala ang iyong workout.';

  @override
  String get loadSetsError => 'Hindi ma-load ang mga set.';

  @override
  String setWeight(String unit) {
    return 'Bigat ($unit)';
  }

  @override
  String get reps => 'Mga ulit';

  @override
  String get save => 'I-save';

  @override
  String setLabel(String number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps ulit';
  }

  @override
  String get invalidSet =>
      'Maglagay ng wastong bigat at buong bilang ng mga ulit na higit sa zero.';

  @override
  String get bodyweight => 'Bigat ng katawan';

  @override
  String get emptyBlocks =>
      'Wala pang workout block.\nMagdagdag ng strength block para magsimulang magtala.';

  @override
  String get history => 'History';

  @override
  String get emptyHistory => 'Wala pang workout na naitatala.';

  @override
  String get editSession => 'I-edit ang session';

  @override
  String get sessionTitle => 'Pamagat ng session';

  @override
  String get sessionNotes => 'Mga tala (opsyonal)';

  @override
  String get deleteSession => 'Burahin ang session';

  @override
  String get confirmDeleteSession =>
      'Burahin ang session na ito at lahat ng workout record nito? Hindi ito maibabalik.';

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
  String get editSet => 'I-edit ang set';

  @override
  String get deleteSet => 'Tanggalin ang set';

  @override
  String get confirmDeleteSet => 'Tanggalin ang set na ito?';

  @override
  String get editBlock => 'I-edit ang block';

  @override
  String get deleteBlock => 'Burahin ang block';

  @override
  String get confirmDeleteBlock =>
      'Burahin ang block na ito pati lahat ng ehersisyo at set nito? Hindi ito maibabalik.';

  @override
  String get editExercise => 'I-edit ang ehersisyo';

  @override
  String get deleteExercise => 'Burahin ang ehersisyo';

  @override
  String get confirmDeleteExercise =>
      'Burahin ang ehersisyong ito pati lahat ng set nito? Hindi ito maibabalik.';

  @override
  String get progress => 'Progreso';

  @override
  String get todaySummary => 'Buod ngayon';

  @override
  String get trainingOverview => 'Buod ng training';

  @override
  String get sessionsLabel => 'mga session';

  @override
  String get setsLabel => 'mga set';

  @override
  String movementCount(int count) {
    return '$count galaw';
  }

  @override
  String get movementsLabel => 'mga galaw';

  @override
  String setCount(String count) {
    return '$count set';
  }

  @override
  String get weightedVolume => 'Kabuuang volume na may bigat';

  @override
  String get volumeUnit => 'kg·reps';

  @override
  String get bestLoadChange => 'Pagbabago sa pinakamabigat';

  @override
  String get volumeChange => 'Pagbabago sa volume';

  @override
  String get repChange => 'Pagbabago sa reps';

  @override
  String get noProgressYet =>
      'Ulitin ang ehersisyo para maikumpara ang progreso.';

  @override
  String get previousWorkout => 'Nakaraan';

  @override
  String get lastWorkout => 'Pinakabago';

  @override
  String get chooseDate => 'Pumili ng petsa ng workout';

  @override
  String get allMovements => 'Lahat';

  @override
  String get customExercise => 'Magdagdag ng sariling ehersisyo';

  @override
  String get noMovementsFound => 'Walang nahanap na galaw';

  @override
  String get noChange => 'Walang pagbabago';

  @override
  String get searchMovements => 'Maghanap ng galaw';

  @override
  String get benchmarkWorkouts => 'Mga benchmark na WOD';

  @override
  String get movementTypes => 'Mga grupo ng galaw';

  @override
  String get last7Days => 'Huling 7 araw';

  @override
  String get previous7Days => 'Naunang 7 araw';

  @override
  String get categoryBarbell => 'Barbell';

  @override
  String get categoryGymnastics => 'Gymnastics';

  @override
  String get categoryDumbbellKettlebell => 'Dumbbell/Kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Bigat ng katawan';

  @override
  String get categoryOtherEquipment => 'Iba pang kagamitan';

  @override
  String get settings => 'Mga setting';

  @override
  String get weightUnit => 'Unit ng bigat';

  @override
  String get weightUnitError => 'Hindi na-save ang unit ng bigat.';

  @override
  String get categoryBenchmarkWod => 'Mga benchmark na WOD';

  @override
  String get noRecentMovementRecords =>
      'Walang tala ng galaw sa nakaraang 14 na araw.';

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
}
