// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Bài tập hôm nay';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Hôm nay chưa có bài tập nào được ghi lại';

  @override
  String get emptyTodayHelp => 'Tạo một buổi tập để ghi lại bài tập hôm nay.';

  @override
  String get startWorkout => 'Bắt đầu tập';

  @override
  String get workoutLog => 'Nhật ký tập luyện';

  @override
  String get loadWorkoutError => 'Không thể tải nhật ký tập luyện.';

  @override
  String get loadBlocksError => 'Không thể tải các phần tập luyện.';

  @override
  String get addStrengthBlock => 'Thêm phần sức mạnh';

  @override
  String get addBlockTitle => 'Thêm phần tập luyện';

  @override
  String get blockName => 'Tên phần tập';

  @override
  String get strength => 'Sức mạnh';

  @override
  String get add => 'Thêm';

  @override
  String get cancel => 'Hủy';

  @override
  String get addExercise => 'Bài tập';

  @override
  String get exerciseName => 'Tên bài tập';

  @override
  String get exerciseHint => 'Squat với tạ đòn';

  @override
  String get emptyBlockHelp => 'Thêm bài tập vào phần này.';

  @override
  String get loadExercisesError => 'Không thể tải các bài tập.';

  @override
  String get addSet => 'Thêm hiệp';

  @override
  String get emptyExerciseHelp => 'Thêm một hiệp để ghi lại kết quả.';

  @override
  String get loadSetsError => 'Không thể tải các hiệp tập.';

  @override
  String setWeight(String unit) {
    return 'Mức tạ ($unit)';
  }

  @override
  String get reps => 'Số lần lặp';

  @override
  String get save => 'Lưu';

  @override
  String setLabel(String number) {
    return 'Hiệp $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps lần';
  }

  @override
  String get invalidSet =>
      'Hãy nhập mức tạ hợp lệ và số lần lặp nguyên lớn hơn không.';

  @override
  String get bodyweight => 'Trọng lượng cơ thể';

  @override
  String get emptyBlocks =>
      'Chưa có phần tập luyện.\nThêm phần sức mạnh để bắt đầu ghi lại.';

  @override
  String get history => 'Lịch sử';

  @override
  String get emptyHistory => 'Chưa có bài tập nào được ghi lại.';

  @override
  String get editSession => 'Chỉnh sửa buổi tập';

  @override
  String get sessionTitle => 'Tên buổi tập';

  @override
  String get sessionNotes => 'Ghi chú (không bắt buộc)';

  @override
  String get deleteSession => 'Xóa buổi tập';

  @override
  String get confirmDeleteSession =>
      'Xóa buổi tập này và toàn bộ nhật ký? Không thể hoàn tác thao tác này.';

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
  String get editSet => 'Sửa hiệp';

  @override
  String get deleteSet => 'Xóa hiệp';

  @override
  String get confirmDeleteSet => 'Xóa hiệp này?';

  @override
  String get editBlock => 'Sửa khối';

  @override
  String get deleteBlock => 'Xóa khối';

  @override
  String get confirmDeleteBlock =>
      'Xóa khối này cùng tất cả bài tập và hiệp? Bạn không thể hoàn tác.';

  @override
  String get editExercise => 'Sửa bài tập';

  @override
  String get deleteExercise => 'Xóa bài tập';

  @override
  String get confirmDeleteExercise =>
      'Xóa bài tập này cùng tất cả hiệp? Bạn không thể hoàn tác.';

  @override
  String get progress => 'Tiến độ';

  @override
  String get todaySummary => 'Tóm tắt hôm nay';

  @override
  String get trainingOverview => 'Tổng quan luyện tập';

  @override
  String get sessionsLabel => 'buổi';

  @override
  String get setsLabel => 'hiệp';

  @override
  String movementCount(int count) {
    return '$count động tác';
  }

  @override
  String get movementsLabel => 'động tác';

  @override
  String setCount(String count) {
    return '$count hiệp';
  }

  @override
  String get weightedVolume => 'Tổng khối lượng có tạ';

  @override
  String get volumeUnit => 'kg·lần';

  @override
  String get bestLoadChange => 'Thay đổi mức tạ cao nhất';

  @override
  String get volumeChange => 'Thay đổi khối lượng';

  @override
  String get repChange => 'Thay đổi số lần';

  @override
  String get noProgressYet => 'Lặp lại bài tập để so sánh tiến độ.';

  @override
  String get previousWorkout => 'Trước';

  @override
  String get lastWorkout => 'Gần nhất';

  @override
  String get chooseDate => 'Chọn ngày tập';

  @override
  String get allMovements => 'Tất cả';

  @override
  String get customExercise => 'Thêm bài tập tùy chỉnh';

  @override
  String get noMovementsFound => 'Không tìm thấy động tác';

  @override
  String get noChange => 'Không thay đổi';

  @override
  String get searchMovements => 'Tìm động tác';

  @override
  String get benchmarkWorkouts => 'WOD chuẩn';

  @override
  String get movementTypes => 'Nhóm động tác';

  @override
  String get last7Days => '7 ngày gần nhất';

  @override
  String get previous7Days => '7 ngày trước đó';

  @override
  String get categoryBarbell => 'Đòn tạ';

  @override
  String get categoryGymnastics => 'Thể dục dụng cụ';

  @override
  String get categoryDumbbellKettlebell => 'Tạ đơn/ấm tạ';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Trọng lượng cơ thể';

  @override
  String get categoryOtherEquipment => 'Thiết bị khác';

  @override
  String get settings => 'Cài đặt';

  @override
  String get weightUnit => 'Đơn vị khối lượng';

  @override
  String get weightUnitError => 'Không thể lưu đơn vị khối lượng.';

  @override
  String get categoryBenchmarkWod => 'WOD chuẩn';

  @override
  String get noRecentMovementRecords =>
      'Không có bản ghi động tác trong 14 ngày qua.';

  @override
  String get todayTab => 'Today';

  @override
  String get recordWod => 'Log a WOD';

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
  String get weightCalculator => 'Weight converter';

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
  String get wodPersonalRecords => 'WOD PR';

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

  @override
  String get todayWodTitle => 'Today\'s WOD';

  @override
  String get homeBenchmarks => 'Benchmarks';

  @override
  String get homeRepeatWod => 'Repeat a WOD';

  @override
  String get homeWodPr => 'WOD PR';

  @override
  String get recordsTab => 'Log';

  @override
  String get settingsEyebrow => 'Preferences';

  @override
  String get weightUnitDescription =>
      'Applies to workout loads, logs and stats.';

  @override
  String get resources => 'Resources';
}
