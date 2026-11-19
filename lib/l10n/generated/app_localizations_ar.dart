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
  String setWeight(String unit) {
    return 'الوزن ($unit)';
  }

  @override
  String get reps => 'التكرارات';

  @override
  String get save => 'حفظ';

  @override
  String setLabel(String number) {
    return 'المجموعة $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps تكرارات';
  }

  @override
  String get invalidSet =>
      'أدخل وزنًا صالحًا وعددًا صحيحًا من التكرارات أكبر من صفر.';

  @override
  String get bodyweight => 'وزن الجسم';

  @override
  String get emptyBlocks =>
      'لا توجد مجموعات تمرين بعد.\nأضف مجموعة قوة لبدء التسجيل.';

  @override
  String get history => 'السجل';

  @override
  String get emptyHistory => 'لا توجد تمارين مسجلة بعد.';

  @override
  String get editSession => 'تعديل الجلسة';

  @override
  String get sessionTitle => 'عنوان الجلسة';

  @override
  String get sessionNotes => 'ملاحظات (اختياري)';

  @override
  String get deleteSession => 'حذف الجلسة';

  @override
  String get confirmDeleteSession =>
      'هل تريد حذف هذه الجلسة وجميع سجلات التمرين؟ لا يمكن التراجع عن ذلك.';

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
  String get editSet => 'تعديل المجموعة';

  @override
  String get deleteSet => 'حذف المجموعة';

  @override
  String get confirmDeleteSet => 'هل تريد حذف هذه المجموعة؟';

  @override
  String get editBlock => 'تعديل الكتلة';

  @override
  String get deleteBlock => 'حذف الكتلة';

  @override
  String get confirmDeleteBlock =>
      'هل تريد حذف هذه الكتلة وكل تمارينها ومجموعاتها؟ لا يمكن التراجع عن ذلك.';

  @override
  String get editExercise => 'تعديل التمرين';

  @override
  String get deleteExercise => 'حذف التمرين';

  @override
  String get confirmDeleteExercise =>
      'هل تريد حذف هذا التمرين وكل مجموعاته؟ لا يمكن التراجع عن ذلك.';

  @override
  String get progress => 'التقدّم';

  @override
  String get todaySummary => 'ملخص اليوم';

  @override
  String get trainingOverview => 'ملخص التدريب';

  @override
  String get sessionsLabel => 'جلسات';

  @override
  String get setsLabel => 'مجموعات';

  @override
  String movementCount(int count) {
    return '$count حركات';
  }

  @override
  String get movementsLabel => 'حركات';

  @override
  String setCount(String count) {
    return '$count مجموعات';
  }

  @override
  String get weightedVolume => 'الحجم مع الأوزان';

  @override
  String get volumeUnit => 'كغ·تكرارات';

  @override
  String get bestLoadChange => 'تغيّر أفضل وزن';

  @override
  String get volumeChange => 'تغيّر الحجم';

  @override
  String get repChange => 'تغيّر التكرارات';

  @override
  String get noProgressYet => 'كرّر التمرين لمقارنة سجلك السابق.';

  @override
  String get previousWorkout => 'السابق';

  @override
  String get lastWorkout => 'الأحدث';

  @override
  String get chooseDate => 'اختر تاريخ التمرين';

  @override
  String get allMovements => 'الكل';

  @override
  String get customExercise => 'إضافة تمرين مخصّص';

  @override
  String get noMovementsFound => 'لم يتم العثور على حركات';

  @override
  String get noChange => 'لا تغيير';

  @override
  String get searchMovements => 'ابحث عن الحركات';

  @override
  String get benchmarkWorkouts => 'تمارين WOD القياسية';

  @override
  String get movementTypes => 'مجموعات الحركات';

  @override
  String get last7Days => 'آخر 7 أيام';

  @override
  String get previous7Days => 'الـ7 أيام السابقة';

  @override
  String get categoryBarbell => 'باربل';

  @override
  String get categoryGymnastics => 'جمباز';

  @override
  String get categoryDumbbellKettlebell => 'دمبل/كيتل بيل';

  @override
  String get categoryCardio => 'كارديو';

  @override
  String get categoryBodyweight => 'وزن الجسم';

  @override
  String get categoryOtherEquipment => 'معدات أخرى';

  @override
  String get settings => 'الإعدادات';

  @override
  String get weightUnit => 'وحدة الوزن';

  @override
  String get weightUnitError => 'تعذر حفظ وحدة الوزن.';

  @override
  String get categoryBenchmarkWod => 'تمارين WOD المرجعية';

  @override
  String get noRecentMovementRecords => 'لا توجد سجلات حركات في آخر ١٤ يومًا.';

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
