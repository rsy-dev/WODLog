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
  String get weightKg => 'वज़न (kg)';

  @override
  String get reps => 'दोहराव';

  @override
  String get save => 'सहेजें';

  @override
  String setLabel(int number) {
    return 'सेट $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps दोहराव';
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
  String setCount(int count) {
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
}
