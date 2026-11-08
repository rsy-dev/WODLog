// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'การออกกำลังกายวันนี้';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'วันนี้ยังไม่มีบันทึกการออกกำลังกาย';

  @override
  String get emptyTodayHelp => 'สร้างเซสชันเพื่อบันทึกการออกกำลังกายวันนี้';

  @override
  String get startWorkout => 'เริ่มออกกำลังกาย';

  @override
  String get workoutLog => 'บันทึกการออกกำลังกาย';

  @override
  String get loadWorkoutError => 'โหลดบันทึกการออกกำลังกายไม่สำเร็จ';

  @override
  String get loadBlocksError => 'โหลดบล็อกการออกกำลังกายไม่สำเร็จ';

  @override
  String get addStrengthBlock => 'เพิ่มบล็อก Strength';

  @override
  String get addBlockTitle => 'เพิ่มบล็อกการออกกำลังกาย';

  @override
  String get blockName => 'ชื่อบล็อก';

  @override
  String get strength => 'Strength';

  @override
  String get add => 'เพิ่ม';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get addExercise => 'ท่าออกกำลังกาย';

  @override
  String get exerciseName => 'ชื่อท่าออกกำลังกาย';

  @override
  String get exerciseHint => 'Back Squat';

  @override
  String get emptyBlockHelp => 'เพิ่มท่าออกกำลังกายในบล็อกนี้';

  @override
  String get loadExercisesError => 'โหลดท่าออกกำลังกายไม่สำเร็จ';

  @override
  String get addSet => 'เพิ่มเซต';

  @override
  String get emptyExerciseHelp => 'เพิ่มเซตเพื่อบันทึกการออกกำลังกาย';

  @override
  String get loadSetsError => 'โหลดเซตไม่สำเร็จ';

  @override
  String get weightKg => 'น้ำหนัก (กก.)';

  @override
  String get reps => 'จำนวนครั้ง';

  @override
  String get save => 'บันทึก';

  @override
  String setLabel(int number) {
    return 'เซตที่ $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight กก. × $reps ครั้ง';
  }

  @override
  String get invalidSet =>
      'กรุณากรอกน้ำหนักที่ถูกต้องและจำนวนครั้งเป็นจำนวนเต็มที่มากกว่าศูนย์';

  @override
  String get bodyweight => 'น้ำหนักตัว';

  @override
  String get emptyBlocks =>
      'ยังไม่มีบล็อกการออกกำลังกาย\nเพิ่มบล็อก Strength เพื่อเริ่มบันทึก';
}
