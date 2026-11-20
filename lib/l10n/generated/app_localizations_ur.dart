// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'آج کی ورزش';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'آج کی کوئی ورزش ریکارڈ نہیں ہوئی';

  @override
  String get emptyTodayHelp => 'آج کی ورزش ریکارڈ کرنے کے لیے سیشن بنائیں۔';

  @override
  String get startWorkout => 'ورزش شروع کریں';

  @override
  String get workoutLog => 'ورزش کا ریکارڈ';

  @override
  String get loadWorkoutError => 'ورزش کے ریکارڈ لوڈ نہیں ہو سکے۔';

  @override
  String get loadBlocksError => 'ورزش کے بلاکس لوڈ نہیں ہو سکے۔';

  @override
  String get addStrengthBlock => 'طاقت کا بلاک شامل کریں';

  @override
  String get addBlockTitle => 'ورزش کا بلاک شامل کریں';

  @override
  String get blockName => 'بلاک کا نام';

  @override
  String get strength => 'طاقت';

  @override
  String get add => 'شامل کریں';

  @override
  String get cancel => 'منسوخ';

  @override
  String get addExercise => 'ورزش';

  @override
  String get exerciseName => 'ورزش کا نام';

  @override
  String get exerciseHint => 'بیک اسکواٹ';

  @override
  String get emptyBlockHelp => 'اس بلاک میں ایک ورزش شامل کریں۔';

  @override
  String get loadExercisesError => 'ورزشیں لوڈ نہیں ہو سکیں۔';

  @override
  String get addSet => 'سیٹ شامل کریں';

  @override
  String get emptyExerciseHelp =>
      'اپنی کارکردگی ریکارڈ کرنے کے لیے سیٹ شامل کریں۔';

  @override
  String get loadSetsError => 'سیٹ لوڈ نہیں ہو سکے۔';

  @override
  String setWeight(String unit) {
    return 'وزن ($unit)';
  }

  @override
  String get reps => 'تکرار';

  @override
  String get save => 'محفوظ کریں';

  @override
  String setLabel(String number) {
    return 'سیٹ $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps تکرار';
  }

  @override
  String get invalidSet => 'درست وزن اور صفر سے بڑی مکمل تکرار درج کریں۔';

  @override
  String get bodyweight => 'جسمانی وزن';

  @override
  String get emptyBlocks =>
      'ابھی کوئی ورزش بلاک نہیں ہے۔\nریکارڈ شروع کرنے کے لیے طاقت کا بلاک شامل کریں۔';

  @override
  String get history => 'تاریخ';

  @override
  String get emptyHistory => 'ابھی تک کوئی ورزش ریکارڈ نہیں ہوئی۔';

  @override
  String get editSession => 'سیشن میں ترمیم';

  @override
  String get sessionTitle => 'سیشن کا عنوان';

  @override
  String get sessionNotes => 'نوٹس (اختیاری)';

  @override
  String get deleteSession => 'سیشن حذف کریں';

  @override
  String get confirmDeleteSession =>
      'کیا یہ سیشن اور اس کے تمام ورزش ریکارڈ حذف کریں؟ اسے واپس نہیں کیا جا سکتا۔';

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
  String get editSet => 'سیٹ میں ترمیم کریں';

  @override
  String get deleteSet => 'سیٹ حذف کریں';

  @override
  String get confirmDeleteSet => 'کیا یہ سیٹ حذف کریں؟';

  @override
  String get editBlock => 'بلاک میں ترمیم کریں';

  @override
  String get deleteBlock => 'بلاک حذف کریں';

  @override
  String get confirmDeleteBlock =>
      'کیا یہ بلاک اور اس کی تمام ورزشیں اور سیٹس حذف کریں؟ اسے واپس نہیں کیا جا سکتا۔';

  @override
  String get editExercise => 'ورزش میں ترمیم کریں';

  @override
  String get deleteExercise => 'ورزش حذف کریں';

  @override
  String get confirmDeleteExercise =>
      'کیا یہ ورزش اور اس کے تمام سیٹس حذف کریں؟ اسے واپس نہیں کیا جا سکتا۔';

  @override
  String get progress => 'پیش رفت';

  @override
  String get todaySummary => 'آج کا خلاصہ';

  @override
  String get trainingOverview => 'ورزش کا خلاصہ';

  @override
  String get sessionsLabel => 'سیشن';

  @override
  String get setsLabel => 'سیٹس';

  @override
  String movementCount(int count) {
    return '$count حرکات';
  }

  @override
  String get movementsLabel => 'حرکات';

  @override
  String setCount(String count) {
    return '$count سیٹس';
  }

  @override
  String get weightedVolume => 'وزن کے ساتھ کل حجم';

  @override
  String get volumeUnit => 'کلوگرام·دہرائیاں';

  @override
  String get bestLoadChange => 'زیادہ سے زیادہ وزن میں تبدیلی';

  @override
  String get volumeChange => 'حجم میں تبدیلی';

  @override
  String get repChange => 'دہرائیوں میں تبدیلی';

  @override
  String get noProgressYet =>
      'پیش رفت کا موازنہ کرنے کے لیے یہی ورزش دوبارہ درج کریں۔';

  @override
  String get previousWorkout => 'پچھلی';

  @override
  String get lastWorkout => 'تازہ ترین';

  @override
  String get chooseDate => 'ورزش کی تاریخ منتخب کریں';

  @override
  String get allMovements => 'سب';

  @override
  String get customExercise => 'اپنی ورزش شامل کریں';

  @override
  String get noMovementsFound => 'کوئی حرکت نہیں ملی';

  @override
  String get noChange => 'کوئی تبدیلی نہیں';

  @override
  String get searchMovements => 'حرکات تلاش کریں';

  @override
  String get benchmarkWorkouts => 'معیاری WOD';

  @override
  String get movementTypes => 'حرکات کے گروپ';

  @override
  String get last7Days => 'گزشتہ 7 دن';

  @override
  String get previous7Days => 'اس سے پہلے کے 7 دن';

  @override
  String get categoryBarbell => 'باربل';

  @override
  String get categoryGymnastics => 'جمناسٹکس';

  @override
  String get categoryDumbbellKettlebell => 'ڈمبل/کیٹل بیل';

  @override
  String get categoryCardio => 'کارڈیو';

  @override
  String get categoryBodyweight => 'جسمانی وزن';

  @override
  String get categoryOtherEquipment => 'دیگر سامان';

  @override
  String get settings => 'ترتیبات';

  @override
  String get weightUnit => 'وزن کی اکائی';

  @override
  String get weightUnitError => 'وزن کی اکائی محفوظ نہیں ہو سکی۔';

  @override
  String get categoryBenchmarkWod => 'معیاری WOD';

  @override
  String get noRecentMovementRecords =>
      'پچھلے 14 دنوں میں کسی حرکت کا ریکارڈ نہیں ہے۔';

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
  String weightConversionDirection(String source, String target) {
    return '$source to $target';
  }

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
  String get wodMissingTimeCap => 'Enter the time cap for a capped result.';

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
