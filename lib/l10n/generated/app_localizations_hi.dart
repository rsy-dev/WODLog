// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'आज का वर्कआउट';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'आज का कोई वर्कआउट दर्ज नहीं है';

  @override
  String get emptyTodayHelp =>
      'आज का वर्कआउट दर्ज करने के लिए एक सत्र शुरू करें।';

  @override
  String get startWorkout => 'वर्कआउट शुरू करें';

  @override
  String get workoutLog => 'वर्कआउट लॉग';

  @override
  String get loadWorkoutError => 'वर्कआउट रिकॉर्ड लोड नहीं हो सके।';

  @override
  String get loadBlocksError => 'वर्कआउट ब्लॉक लोड नहीं हो सके।';

  @override
  String get addStrengthBlock => 'स्ट्रेंथ ब्लॉक जोड़ें';

  @override
  String get addBlockTitle => 'वर्कआउट ब्लॉक जोड़ें';

  @override
  String get blockName => 'ब्लॉक का नाम';

  @override
  String get strength => 'स्ट्रेंथ';

  @override
  String get add => 'जोड़ें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get addExercise => 'व्यायाम';

  @override
  String get exerciseName => 'व्यायाम का नाम';

  @override
  String get exerciseHint => 'बैक स्क्वाट';

  @override
  String get emptyBlockHelp => 'इस ब्लॉक में व्यायाम जोड़ें।';

  @override
  String get loadExercisesError => 'व्यायाम लोड नहीं हो सके।';

  @override
  String get addSet => 'सेट जोड़ें';

  @override
  String get emptyExerciseHelp =>
      'अपना प्रदर्शन दर्ज करने के लिए एक सेट जोड़ें।';

  @override
  String get loadSetsError => 'सेट लोड नहीं हो सके।';

  @override
  String setWeight(String unit) {
    return 'वज़न ($unit)';
  }

  @override
  String get reps => 'दोहराव';

  @override
  String get save => 'सहेजें';

  @override
  String setLabel(String number) {
    return 'सेट $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps दोहराव';
  }

  @override
  String get invalidSet =>
      'मान्य वज़न और शून्य से अधिक पूर्णांक दोहराव दर्ज करें।';

  @override
  String get bodyweight => 'शरीर का वज़न';

  @override
  String get emptyBlocks =>
      'अभी कोई वर्कआउट ब्लॉक नहीं है।\nशुरू करने के लिए स्ट्रेंथ ब्लॉक जोड़ें।';

  @override
  String get history => 'इतिहास';

  @override
  String get emptyHistory => 'अभी तक कोई वर्कआउट दर्ज नहीं है।';

  @override
  String get editSession => 'सत्र संपादित करें';

  @override
  String get sessionTitle => 'सत्र का शीर्षक';

  @override
  String get sessionNotes => 'नोट (वैकल्पिक)';

  @override
  String get deleteSession => 'सत्र हटाएँ';

  @override
  String get confirmDeleteSession =>
      'क्या यह सत्र और इसके सभी वर्कआउट रिकॉर्ड हटाने हैं? इसे वापस नहीं किया जा सकता।';

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
  String get editSet => 'सेट संपादित करें';

  @override
  String get deleteSet => 'सेट हटाएँ';

  @override
  String get confirmDeleteSet => 'क्या यह सेट हटाएँ?';

  @override
  String get editBlock => 'ब्लॉक संपादित करें';

  @override
  String get deleteBlock => 'ब्लॉक हटाएँ';

  @override
  String get confirmDeleteBlock =>
      'क्या यह ब्लॉक और इसके सभी व्यायाम व सेट हटाने हैं? इसे वापस नहीं किया जा सकता।';

  @override
  String get editExercise => 'व्यायाम संपादित करें';

  @override
  String get deleteExercise => 'व्यायाम हटाएँ';

  @override
  String get confirmDeleteExercise =>
      'क्या यह व्यायाम और इसके सभी सेट हटाने हैं? इसे वापस नहीं किया जा सकता।';

  @override
  String get progress => 'प्रगति';

  @override
  String get todaySummary => 'आज का सारांश';

  @override
  String get trainingOverview => 'प्रशिक्षण सारांश';

  @override
  String get sessionsLabel => 'सेशन';

  @override
  String get setsLabel => 'सेट';

  @override
  String movementCount(int count) {
    return '$count मूवमेंट';
  }

  @override
  String get movementsLabel => 'मूवमेंट';

  @override
  String setCount(String count) {
    return '$count सेट';
  }

  @override
  String get weightedVolume => 'वज़न सहित कुल वॉल्यूम';

  @override
  String get volumeUnit => 'किग्रा·रेप';

  @override
  String get bestLoadChange => 'सबसे अधिक वज़न में बदलाव';

  @override
  String get volumeChange => 'वॉल्यूम में बदलाव';

  @override
  String get repChange => 'रेप में बदलाव';

  @override
  String get noProgressYet =>
      'प्रगति देखने के लिए वही व्यायाम दोबारा दर्ज करें।';

  @override
  String get previousWorkout => 'पिछला';

  @override
  String get lastWorkout => 'नवीनतम';

  @override
  String get chooseDate => 'वर्कआउट की तारीख चुनें';

  @override
  String get allMovements => 'सभी';

  @override
  String get customExercise => 'अपना व्यायाम जोड़ें';

  @override
  String get noMovementsFound => 'कोई मूवमेंट नहीं मिला';

  @override
  String get noChange => 'कोई बदलाव नहीं';

  @override
  String get searchMovements => 'मूवमेंट खोजें';

  @override
  String get benchmarkWorkouts => 'बेंचमार्क WOD';

  @override
  String get movementTypes => 'मूवमेंट समूह';

  @override
  String get last7Days => 'पिछले 7 दिन';

  @override
  String get previous7Days => 'उससे पिछले 7 दिन';

  @override
  String get categoryBarbell => 'बारबेल';

  @override
  String get categoryGymnastics => 'जिम्नास्टिक्स';

  @override
  String get categoryDumbbellKettlebell => 'डम्बल/केटलबेल';

  @override
  String get categoryCardio => 'कार्डियो';

  @override
  String get categoryBodyweight => 'शरीर का वज़न';

  @override
  String get categoryOtherEquipment => 'अन्य उपकरण';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get weightUnit => 'वज़न की इकाई';

  @override
  String get weightUnitError => 'वज़न की इकाई सहेजी नहीं जा सकी।';

  @override
  String get categoryBenchmarkWod => 'बेंचमार्क WOD';

  @override
  String get noRecentMovementRecords =>
      'पिछले 14 दिनों में किसी मूवमेंट का रिकॉर्ड नहीं है।';

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
