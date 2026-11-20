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
  String get addStrengthBlock => '근력 블록 추가';

  @override
  String get addBlockTitle => '운동 블록 추가';

  @override
  String get blockName => '블록 이름';

  @override
  String get strength => '근력';

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
  String setWeight(String unit) {
    return '중량 ($unit)';
  }

  @override
  String get reps => '반복 수';

  @override
  String get save => '저장';

  @override
  String setLabel(String number) {
    return '$number세트';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps회';
  }

  @override
  String get invalidSet => '올바른 중량과 0보다 큰 정수 반복 수를 입력하세요.';

  @override
  String get bodyweight => '맨몸';

  @override
  String get emptyBlocks => '아직 운동 블록이 없어요.\n근력 블록을 추가해 운동을 기록하세요.';

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

  @override
  String get progress => '운동 향상';

  @override
  String get todaySummary => '오늘 운동 요약';

  @override
  String get trainingOverview => '전체 운동 요약';

  @override
  String get sessionsLabel => '세션';

  @override
  String get setsLabel => '세트';

  @override
  String movementCount(int count) {
    return '운동 $count개';
  }

  @override
  String get movementsLabel => '운동';

  @override
  String setCount(String count) {
    return '세트 $count개';
  }

  @override
  String get weightedVolume => '중량 볼륨';

  @override
  String get volumeUnit => 'kg·회';

  @override
  String get bestLoadChange => '최고 중량 변화';

  @override
  String get volumeChange => '볼륨 변화';

  @override
  String get repChange => '반복 수 변화';

  @override
  String get noProgressYet => '같은 운동을 다시 기록하면 이전 기록과 비교할 수 있어요.';

  @override
  String get previousWorkout => '이전';

  @override
  String get lastWorkout => '최근';

  @override
  String get chooseDate => '운동 날짜 선택';

  @override
  String get allMovements => '전체';

  @override
  String get customExercise => '새 운동 직접 입력';

  @override
  String get noMovementsFound => '운동을 찾지 못했어요';

  @override
  String get noChange => '변화 없음';

  @override
  String get searchMovements => '운동 검색';

  @override
  String get benchmarkWorkouts => '벤치마크';

  @override
  String get movementTypes => '유사한 움직임 그룹';

  @override
  String get last7Days => '최근 7일';

  @override
  String get previous7Days => '이전 7일';

  @override
  String get categoryBarbell => '바벨';

  @override
  String get categoryGymnastics => '체조 동작';

  @override
  String get categoryDumbbellKettlebell => '덤벨·케틀벨';

  @override
  String get categoryCardio => '유산소';

  @override
  String get categoryBodyweight => '맨몸';

  @override
  String get categoryOtherEquipment => '기타 장비';

  @override
  String get settings => '설정';

  @override
  String get weightUnit => '중량 단위';

  @override
  String get weightUnitError => '중량 단위를 저장하지 못했어요.';

  @override
  String get categoryBenchmarkWod => '벤치마크 WOD';

  @override
  String get noRecentMovementRecords => '최근 14일 동안 기록한 동작이 없어요.';

  @override
  String get todayTab => '오늘';

  @override
  String get recordWod => 'WOD 기록하기';

  @override
  String get languageSetting => '언어';

  @override
  String get deviceLanguage => '기기 언어';

  @override
  String get weeklyGoal => '주간 목표';

  @override
  String get weightCalculator => '중량 계산기';

  @override
  String get movementLibrary => '동작 목록';

  @override
  String get glossary => '용어집';

  @override
  String get lastSevenDays => '최근 7일';

  @override
  String get pastWods => '지난 WOD';

  @override
  String get strengthSessions => '근력 세션';

  @override
  String get chooseBenchmark => '벤치마크 선택';

  @override
  String get searchWorkouts => '운동 검색';

  @override
  String get noMatchingWorkouts => '검색 결과가 없어요.';

  @override
  String get settingsSaveError => '설정을 저장하지 못했어요. 다시 시도해 주세요.';

  @override
  String get openSession => '세션 열기';

  @override
  String get reviewWodText => 'WOD 원문 검토';

  @override
  String get wodSourceText => 'WOD 원문';

  @override
  String get unreadWodLines => '검토가 필요한 줄';

  @override
  String get wodPrescription => '운동 처방';

  @override
  String get closeSheet => '닫기';

  @override
  String get glossaryAmrap => '제한시간 안에 가능한 많은 라운드 또는 반복을 완료합니다.';

  @override
  String get glossaryEmom => '매분 시작할 때 정해진 동작을 수행합니다.';

  @override
  String get glossaryForTime => '완주 시간 또는 타임캡까지 완료한 반복을 기록합니다.';

  @override
  String get glossaryRx => '처방된 기준대로 운동합니다.';

  @override
  String get glossaryScaled => '중량, 동작 또는 운동량을 조정합니다.';

  @override
  String get wodSaveError => 'WOD 결과를 저장하지 못했어요. 다시 시도해 주세요.';

  @override
  String get applyWodSource => '메모에 반영';

  @override
  String get statsTab => '통계';

  @override
  String get wodFinished => '완주';

  @override
  String get wodCapped => '타임캡';

  @override
  String get wodStopped => '중단';

  @override
  String get wodEnding => '종료 상태';

  @override
  String get wodFinishTime => '완주 시간 (분:초)';

  @override
  String get wodCompletedReps => '타임캡까지 완료한 반복';

  @override
  String get wodCompletedRounds => '완료 라운드';

  @override
  String get wodCompletedIntervals => '완료한 인터벌';

  @override
  String get wodExtraReps => '추가 반복';

  @override
  String get wodEnterNewScore => '새 점수 입력';

  @override
  String get wodInvalidScore => '운동 유형에 맞는 결과를 입력해 주세요.';

  @override
  String get wodPersonalRecords => 'WOD PR';

  @override
  String get wodNoComparableRecords => '비교 조건이 확인된 WOD 기록이 없습니다.';

  @override
  String get wodCurrentBest => '현재 최고';

  @override
  String get wodRecordImprovements => '갱신 이력';

  @override
  String get wodScoreHistory => '점수 추이';

  @override
  String get strengthPersonalRecords => '근력 개인 기록';

  @override
  String get strengthEstimatedOneRepMax => '추정 1RM';

  @override
  String get strengthRecordMethod =>
      '실측은 해당 반복 수의 성공 세트 · 추정은 Epley 공식 (2–10회)';

  @override
  String get strengthDailyBest => '날짜별 최고 중량';

  @override
  String get wodRecentRecords => '최근 WOD';

  @override
  String get wodViewAll => '전체 보기';

  @override
  String get wodRecordAgain => '다시 기록';

  @override
  String get wodNewPersonalRecord => '개인 기록 갱신';

  @override
  String get wodWorkoutStandard => '수행 기준';

  @override
  String get wodUnconfirmedStandard => '미확인';

  @override
  String get wodCustomStandard => '직접 설정';

  @override
  String get wodTimeCapSeconds => '타임캡 (초)';

  @override
  String get wodTotalRounds => '전체 라운드';

  @override
  String get wodDurationSeconds => '처방 시간 (초)';

  @override
  String get wodTotalIntervals => '전체 구간 수';

  @override
  String get wodIntervalLengthSeconds => '구간 길이 (초)';

  @override
  String get wodIntervals => '구간';

  @override
  String get wodTiebreak => '타이브레이크 (분:초)';

  @override
  String get wodUnreadLinesConfirmed => '미해석 내용을 검토하고 처방을 수정했습니다';

  @override
  String get wodMovementQuantities => '구간별 수량 (/로 구분)';

  @override
  String get wodMovementEquipment => '장비';

  @override
  String get wodMovementStandard => '타깃 높이 및 수행 기준';

  @override
  String get wodMoveUp => '위로 이동';

  @override
  String get wodMoveDown => '아래로 이동';

  @override
  String get wodDeleteRecord => 'WOD 삭제';

  @override
  String get glossaryWodMetcon => '오늘의 운동 / 대사 컨디셔닝 운동';

  @override
  String get glossaryRft => '정해진 라운드를 끝낼 때까지 걸린 시간';

  @override
  String get glossaryE2Mom => '2분마다 지정된 운동 시작';

  @override
  String get glossaryIntervals => '수행과 휴식을 정해진 구간마다 반복';

  @override
  String get glossaryTabata => '20초 운동과 10초 휴식을 반복';

  @override
  String get glossaryMaxLoadReps => '성공한 최대 중량 / 최대 반복 수';

  @override
  String get glossaryDistanceCalories => '장비에 표시된 거리 또는 칼로리 점수';

  @override
  String get glossaryFoundations => '기초 단계에 맞춘 처방';

  @override
  String get glossaryTimeCap => '운동에 주어진 제한 시간';

  @override
  String get glossaryTiebreak => '동점일 때 비교하는 지정 구간의 완료 시간';

  @override
  String get glossaryChipper => '여러 동작을 정해진 순서로 한 번씩 수행';

  @override
  String get glossaryCoupletTriplet => '두 가지 / 세 가지 동작을 묶은 운동';

  @override
  String get glossaryLadder => '세트마다 반복 수나 중량이 단계적으로 바뀌는 방식';

  @override
  String get glossaryBuyInCashOut => '본 운동 전 / 후에 수행할 과제';

  @override
  String get glossaryUnbroken => '쉬거나 장비를 내려놓지 않고 한 세트 완료';

  @override
  String get glossaryNoRep => '수행 기준을 충족하지 못해 집계하지 않는 반복';

  @override
  String get glossaryPr => '비교 가능한 조건에서 세운 개인 최고 기록';
}
