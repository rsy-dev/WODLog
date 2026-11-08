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
  String get weightKg => 'وزن (کلوگرام)';

  @override
  String get reps => 'تکرار';

  @override
  String get save => 'محفوظ کریں';

  @override
  String setLabel(int number) {
    return 'سیٹ $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight کلوگرام × $reps تکرار';
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
}
