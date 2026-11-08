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
}
