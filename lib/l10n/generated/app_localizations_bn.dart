// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'আজকের ওয়ার্কআউট';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'আজকের কোনো ওয়ার্কআউট রেকর্ড নেই';

  @override
  String get emptyTodayHelp => 'আজকের ওয়ার্কআউট লিখতে একটি সেশন তৈরি করুন।';

  @override
  String get startWorkout => 'ওয়ার্কআউট শুরু করুন';

  @override
  String get workoutLog => 'ওয়ার্কআউট লগ';

  @override
  String get loadWorkoutError => 'ওয়ার্কআউট রেকর্ড লোড করা যায়নি।';

  @override
  String get loadBlocksError => 'ওয়ার্কআউট ব্লক লোড করা যায়নি।';

  @override
  String get addStrengthBlock => 'স্ট্রেংথ ব্লক যোগ করুন';

  @override
  String get addBlockTitle => 'ওয়ার্কআউট ব্লক যোগ করুন';

  @override
  String get blockName => 'ব্লকের নাম';

  @override
  String get strength => 'স্ট্রেংথ';

  @override
  String get add => 'যোগ করুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get addExercise => 'ব্যায়াম';

  @override
  String get exerciseName => 'ব্যায়ামের নাম';

  @override
  String get exerciseHint => 'ব্যাক স্কোয়াট';

  @override
  String get emptyBlockHelp => 'এই ব্লকে একটি ব্যায়াম যোগ করুন।';

  @override
  String get loadExercisesError => 'ব্যায়াম লোড করা যায়নি।';

  @override
  String get addSet => 'সেট যোগ করুন';

  @override
  String get emptyExerciseHelp => 'আপনার অনুশীলন লিখতে একটি সেট যোগ করুন।';

  @override
  String get loadSetsError => 'সেট লোড করা যায়নি।';

  @override
  String setWeight(String unit) {
    return 'ওজন ($unit)';
  }

  @override
  String get reps => 'পুনরাবৃত্তি';

  @override
  String get save => 'সংরক্ষণ';

  @override
  String setLabel(String number) {
    return 'সেট $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps বার';
  }

  @override
  String get invalidSet =>
      'সঠিক ওজন এবং শূন্যের বেশি পূর্ণসংখ্যা পুনরাবৃত্তি লিখুন।';

  @override
  String get bodyweight => 'শরীরের ওজন';

  @override
  String get emptyBlocks =>
      'এখনও কোনো ওয়ার্কআউট ব্লক নেই।\nশুরু করতে একটি স্ট্রেংথ ব্লক যোগ করুন।';

  @override
  String get history => 'ইতিহাস';

  @override
  String get emptyHistory => 'এখনও কোনো ওয়ার্কআউট রেকর্ড নেই।';

  @override
  String get editSession => 'সেশন সম্পাদনা';

  @override
  String get sessionTitle => 'সেশনের শিরোনাম';

  @override
  String get sessionNotes => 'নোট (ঐচ্ছিক)';

  @override
  String get deleteSession => 'সেশন মুছুন';

  @override
  String get confirmDeleteSession =>
      'এই সেশন এবং এর সব ওয়ার্কআউট রেকর্ড মুছবেন? এটি ফিরিয়ে আনা যাবে না।';

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
  String get editSet => 'সেট সম্পাদনা করুন';

  @override
  String get deleteSet => 'সেট মুছুন';

  @override
  String get confirmDeleteSet => 'এই সেটটি মুছবেন?';

  @override
  String get editBlock => 'ব্লক সম্পাদনা';

  @override
  String get deleteBlock => 'ব্লক মুছুন';

  @override
  String get confirmDeleteBlock =>
      'এই ব্লক, এর সব ব্যায়াম ও সেট মুছে ফেলবেন? এটি ফিরিয়ে আনা যাবে না।';

  @override
  String get editExercise => 'ব্যায়াম সম্পাদনা';

  @override
  String get deleteExercise => 'ব্যায়াম মুছুন';

  @override
  String get confirmDeleteExercise =>
      'এই ব্যায়াম ও এর সব সেট মুছে ফেলবেন? এটি ফিরিয়ে আনা যাবে না।';

  @override
  String get progress => 'অগ্রগতি';

  @override
  String get todaySummary => 'আজকের সারাংশ';

  @override
  String get trainingOverview => 'প্রশিক্ষণের সারাংশ';

  @override
  String get sessionsLabel => 'সেশন';

  @override
  String get setsLabel => 'সেট';

  @override
  String movementCount(int count) {
    return '$countটি মুভমেন্ট';
  }

  @override
  String get movementsLabel => 'মুভমেন্ট';

  @override
  String setCount(String count) {
    return '$countটি সেট';
  }

  @override
  String get weightedVolume => 'ওজনসহ মোট ভলিউম';

  @override
  String get volumeUnit => 'কেজি·রেপ';

  @override
  String get bestLoadChange => 'সর্বোচ্চ ওজনের পরিবর্তন';

  @override
  String get volumeChange => 'ভলিউমের পরিবর্তন';

  @override
  String get repChange => 'রেপের পরিবর্তন';

  @override
  String get noProgressYet =>
      'একই ব্যায়াম আবার করলে আগের রেকর্ডের সঙ্গে তুলনা দেখতে পাবেন।';

  @override
  String get previousWorkout => 'আগের';

  @override
  String get lastWorkout => 'সর্বশেষ';

  @override
  String get chooseDate => 'ওয়ার্কআউটের তারিখ বেছে নিন';

  @override
  String get allMovements => 'সব';

  @override
  String get customExercise => 'নিজের ব্যায়াম যোগ করুন';

  @override
  String get noMovementsFound => 'কোনো মুভমেন্ট পাওয়া যায়নি';

  @override
  String get noChange => 'কোনো পরিবর্তন নেই';

  @override
  String get searchMovements => 'মুভমেন্ট খুঁজুন';

  @override
  String get benchmarkWorkouts => 'বেঞ্চমার্ক WOD';

  @override
  String get movementTypes => 'মুভমেন্টের ধরন';

  @override
  String get last7Days => 'গত ৭ দিন';

  @override
  String get previous7Days => 'তার আগের ৭ দিন';

  @override
  String get categoryBarbell => 'বারবেল';

  @override
  String get categoryGymnastics => 'জিমন্যাস্টিকস';

  @override
  String get categoryDumbbellKettlebell => 'ডাম্বেল/কেটলবেল';

  @override
  String get categoryCardio => 'কার্ডিও';

  @override
  String get categoryBodyweight => 'শরীরের ওজন';

  @override
  String get categoryOtherEquipment => 'অন্যান্য সরঞ্জাম';

  @override
  String get settings => 'সেটিংস';

  @override
  String get weightUnit => 'ওজনের একক';

  @override
  String get weightUnitError => 'ওজনের একক সংরক্ষণ করা যায়নি।';

  @override
  String get categoryBenchmarkWod => 'বেঞ্চমার্ক WOD';

  @override
  String get noRecentMovementRecords =>
      'গত ১৪ দিনে কোনো মুভমেন্টের রেকর্ড নেই।';

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
