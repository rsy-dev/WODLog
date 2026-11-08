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
}
