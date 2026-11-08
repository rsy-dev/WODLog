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
  String get weightKg => 'Mức tạ (kg)';

  @override
  String get reps => 'Số lần lặp';

  @override
  String get save => 'Lưu';

  @override
  String setLabel(int number) {
    return 'Hiệp $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps lần';
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
  String setCount(int count) {
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
}
