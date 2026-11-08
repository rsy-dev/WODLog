// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => '오늘 운동';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => '오늘 기록이 아직 없어요';

  @override
  String get emptyTodayHelp => '세션을 추가해 오늘 운동을 기록해보세요.';

  @override
  String get startWorkout => '운동 기록 시작하기';

  @override
  String get workoutLog => '운동 기록';

  @override
  String get loadWorkoutError => '운동 기록을 불러오지 못했어요.';

  @override
  String get loadBlocksError => '운동 블록을 불러오지 못했어요.';

  @override
  String get addStrengthBlock => 'Strength 블록 추가';

  @override
  String get addBlockTitle => '운동 블록 추가';

  @override
  String get blockName => '블록 이름';

  @override
  String get strength => 'Strength';

  @override
  String get add => '추가';

  @override
  String get cancel => '취소';

  @override
  String get addExercise => '종목';

  @override
  String get exerciseName => '종목 이름';

  @override
  String get exerciseHint => 'Back Squat';

  @override
  String get emptyBlockHelp => '이 블록에 종목을 추가하세요.';

  @override
  String get loadExercisesError => '종목을 불러오지 못했어요.';

  @override
  String get addSet => '세트 추가';

  @override
  String get emptyExerciseHelp => '세트를 추가해 운동을 기록하세요.';

  @override
  String get loadSetsError => '세트를 불러오지 못했어요.';

  @override
  String get weightKg => '중량 (kg)';

  @override
  String get reps => '반복 수';

  @override
  String get save => '저장';

  @override
  String setLabel(int number) {
    return '$number세트';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps회';
  }

  @override
  String get invalidSet => '올바른 중량과 0보다 큰 정수 반복 수를 입력하세요.';

  @override
  String get bodyweight => '맨몸';

  @override
  String get emptyBlocks => '아직 운동 블록이 없어요.\nStrength 블록을 추가해 운동을 기록하세요.';

  @override
  String get history => '운동 이력';

  @override
  String get emptyHistory => '아직 기록된 운동이 없어요.';

  @override
  String get editSession => '세션 수정';

  @override
  String get sessionTitle => '세션 제목';

  @override
  String get sessionNotes => '메모 (선택)';

  @override
  String get deleteSession => '세션 삭제';

  @override
  String get confirmDeleteSession => '이 세션과 모든 운동 기록을 삭제할까요? 되돌릴 수 없습니다.';

  @override
  String get wodSectionTitle => 'WOD';

  @override
  String get addWodBlock => 'WOD 추가';

  @override
  String get wodName => 'WOD 이름';

  @override
  String get addWodResult => '결과 추가';

  @override
  String get editWodResult => '결과 수정';

  @override
  String get wodResultType => '결과 유형';

  @override
  String get wodScore => '점수 또는 결과';

  @override
  String get wodNotes => '결과 메모';

  @override
  String get emptyWodBlocks => '아직 WOD가 없습니다. 추가하여 결과를 기록하세요.';

  @override
  String get emptyWodResult => '기록된 결과가 없습니다.';

  @override
  String get resultForTime => '시간 기록';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => '라운드 + 반복';

  @override
  String get resultLoad => '중량';

  @override
  String get resultOther => '기타';

  @override
  String get editSet => '세트 수정';

  @override
  String get deleteSet => '세트 삭제';

  @override
  String get confirmDeleteSet => '이 세트를 삭제할까요?';

  @override
  String get editBlock => '블록 수정';

  @override
  String get deleteBlock => '블록 삭제';

  @override
  String get confirmDeleteBlock =>
      '이 블록과 포함된 운동 및 세트를 모두 삭제할까요? 삭제 후 복구할 수 없습니다.';

  @override
  String get editExercise => '운동 수정';

  @override
  String get deleteExercise => '운동 삭제';

  @override
  String get confirmDeleteExercise =>
      '이 운동과 기록된 세트를 모두 삭제할까요? 삭제 후 복구할 수 없습니다.';
}
