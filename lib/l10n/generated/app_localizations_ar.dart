// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'تمرين اليوم';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'لا يوجد تمرين مسجل اليوم';

  @override
  String get emptyTodayHelp => 'أنشئ جلسة لتسجيل تمرين اليوم.';

  @override
  String get startWorkout => 'ابدأ التمرين';

  @override
  String get workoutLog => 'سجل التمارين';

  @override
  String get loadWorkoutError => 'تعذر تحميل سجلات التمارين.';

  @override
  String get loadBlocksError => 'تعذر تحميل مجموعات التمرين.';

  @override
  String get addStrengthBlock => 'إضافة مجموعة قوة';

  @override
  String get addBlockTitle => 'إضافة مجموعة تمرين';

  @override
  String get blockName => 'اسم المجموعة';

  @override
  String get strength => 'القوة';

  @override
  String get add => 'إضافة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get addExercise => 'تمرين';

  @override
  String get exerciseName => 'اسم التمرين';

  @override
  String get exerciseHint => 'القرفصاء الخلفية';

  @override
  String get emptyBlockHelp => 'أضف تمرينًا إلى هذه المجموعة.';

  @override
  String get loadExercisesError => 'تعذر تحميل التمارين.';

  @override
  String get addSet => 'إضافة مجموعة تكرارات';

  @override
  String get emptyExerciseHelp => 'أضف مجموعة لتسجيل أدائك.';

  @override
  String get loadSetsError => 'تعذر تحميل المجموعات.';

  @override
  String get weightKg => 'الوزن (كجم)';

  @override
  String get reps => 'التكرارات';

  @override
  String get save => 'حفظ';

  @override
  String setLabel(int number) {
    return 'المجموعة $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight كجم × $reps تكرارات';
  }

  @override
  String get invalidSet =>
      'أدخل وزنًا صالحًا وعددًا صحيحًا من التكرارات أكبر من صفر.';

  @override
  String get bodyweight => 'وزن الجسم';

  @override
  String get emptyBlocks =>
      'لا توجد مجموعات تمرين بعد.\nأضف مجموعة قوة لبدء التسجيل.';
}
