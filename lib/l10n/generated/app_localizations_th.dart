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
  String setWeight(String unit) {
    return 'น้ำหนัก ($unit)';
  }

  @override
  String get reps => 'จำนวนครั้ง';

  @override
  String get save => 'บันทึก';

  @override
  String setLabel(String number) {
    return 'เซตที่ $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps ครั้ง';
  }

  @override
  String get invalidSet =>
      'กรุณากรอกน้ำหนักที่ถูกต้องและจำนวนครั้งเป็นจำนวนเต็มที่มากกว่าศูนย์';

  @override
  String get bodyweight => 'น้ำหนักตัว';

  @override
  String get emptyBlocks =>
      'ยังไม่มีบล็อกการออกกำลังกาย\nเพิ่มบล็อก Strength เพื่อเริ่มบันทึก';

  @override
  String get history => 'ประวัติ';

  @override
  String get emptyHistory => 'ยังไม่มีบันทึกการออกกำลังกาย';

  @override
  String get editSession => 'แก้ไขเซสชัน';

  @override
  String get sessionTitle => 'ชื่อเซสชัน';

  @override
  String get sessionNotes => 'บันทึก (ไม่บังคับ)';

  @override
  String get deleteSession => 'ลบเซสชัน';

  @override
  String get confirmDeleteSession =>
      'ลบเซสชันนี้และบันทึกการออกกำลังกายทั้งหมดหรือไม่ การดำเนินการนี้ย้อนกลับไม่ได้';

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
  String get editSet => 'แก้ไขเซต';

  @override
  String get deleteSet => 'ลบเซต';

  @override
  String get confirmDeleteSet => 'ลบเซตนี้หรือไม่?';

  @override
  String get editBlock => 'แก้ไขบล็อก';

  @override
  String get deleteBlock => 'ลบบล็อก';

  @override
  String get confirmDeleteBlock =>
      'ลบบล็อกนี้ รวมถึงท่าและเซ็ตทั้งหมดหรือไม่ การลบนี้ย้อนกลับไม่ได้';

  @override
  String get editExercise => 'แก้ไขท่าออกกำลังกาย';

  @override
  String get deleteExercise => 'ลบท่าออกกำลังกาย';

  @override
  String get confirmDeleteExercise =>
      'ลบท่านี้และเซ็ตทั้งหมดหรือไม่ การลบนี้ย้อนกลับไม่ได้';

  @override
  String get progress => 'ความก้าวหน้า';

  @override
  String get todaySummary => 'สรุปวันนี้';

  @override
  String get trainingOverview => 'สรุปการฝึก';

  @override
  String get sessionsLabel => 'เซสชัน';

  @override
  String get setsLabel => 'เซต';

  @override
  String movementCount(int count) {
    return '$count ท่า';
  }

  @override
  String get movementsLabel => 'ท่า';

  @override
  String setCount(String count) {
    return '$count เซต';
  }

  @override
  String get weightedVolume => 'ปริมาณน้ำหนักรวม';

  @override
  String get volumeUnit => 'กก.·ครั้ง';

  @override
  String get bestLoadChange => 'การเปลี่ยนน้ำหนักสูงสุด';

  @override
  String get volumeChange => 'การเปลี่ยนปริมาณการฝึก';

  @override
  String get repChange => 'การเปลี่ยนจำนวนครั้ง';

  @override
  String get noProgressYet => 'บันทึกท่าเดิมอีกครั้งเพื่อเปรียบเทียบพัฒนาการ';

  @override
  String get previousWorkout => 'ก่อนหน้า';

  @override
  String get lastWorkout => 'ล่าสุด';

  @override
  String get chooseDate => 'เลือกวันที่ฝึก';

  @override
  String get allMovements => 'ทั้งหมด';

  @override
  String get customExercise => 'เพิ่มท่าที่กำหนดเอง';

  @override
  String get noMovementsFound => 'ไม่พบท่าออกกำลังกาย';

  @override
  String get noChange => 'ไม่มีการเปลี่ยนแปลง';

  @override
  String get searchMovements => 'ค้นหาท่าออกกำลังกาย';

  @override
  String get benchmarkWorkouts => 'WOD มาตรฐาน';

  @override
  String get movementTypes => 'กลุ่มท่าออกกำลังกาย';

  @override
  String get last7Days => '7 วันล่าสุด';

  @override
  String get previous7Days => '7 วันก่อนหน้า';

  @override
  String get categoryBarbell => 'บาร์เบล';

  @override
  String get categoryGymnastics => 'ยิมนาสติก';

  @override
  String get categoryDumbbellKettlebell => 'ดัมเบล/เคตเทิลเบล';

  @override
  String get categoryCardio => 'คาร์ดิโอ';

  @override
  String get categoryBodyweight => 'น้ำหนักตัว';

  @override
  String get categoryOtherEquipment => 'อุปกรณ์อื่น';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get weightUnit => 'หน่วยน้ำหนัก';

  @override
  String get weightUnitError => 'บันทึกหน่วยน้ำหนักไม่ได้';

  @override
  String get categoryBenchmarkWod => 'WOD มาตรฐาน';

  @override
  String get noRecentMovementRecords =>
      'ไม่มีบันทึกการเคลื่อนไหวในช่วง 14 วันที่ผ่านมา';

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
