// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => '今日のワークアウト';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => '今日の記録はまだありません';

  @override
  String get emptyTodayHelp => 'セッションを追加して今日のワークアウトを記録しましょう。';

  @override
  String get startWorkout => '記録を開始';

  @override
  String get workoutLog => 'ワークアウト記録';

  @override
  String get loadWorkoutError => '記録を読み込めませんでした。';

  @override
  String get loadBlocksError => 'ブロックを読み込めませんでした。';

  @override
  String get addStrengthBlock => 'ストレングスブロックを追加';

  @override
  String get addBlockTitle => 'ブロックを追加';

  @override
  String get blockName => 'ブロック名';

  @override
  String get strength => 'ストレングス';

  @override
  String get add => '追加';

  @override
  String get cancel => 'キャンセル';

  @override
  String get addExercise => '種目';

  @override
  String get exerciseName => '種目名';

  @override
  String get exerciseHint => 'バックスクワット';

  @override
  String get emptyBlockHelp => 'このブロックに種目を追加してください。';

  @override
  String get loadExercisesError => '種目を読み込めませんでした。';

  @override
  String get addSet => 'セットを追加';

  @override
  String get emptyExerciseHelp => 'セットを追加して記録しましょう。';

  @override
  String get loadSetsError => 'セットを読み込めませんでした。';

  @override
  String setWeight(String unit) {
    return '重量 ($unit)';
  }

  @override
  String get reps => '回数';

  @override
  String get save => '保存';

  @override
  String setLabel(String number) {
    return '$numberセット';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps回';
  }

  @override
  String get invalidSet => '有効な重量と、0より大きい整数の回数を入力してください。';

  @override
  String get bodyweight => '自重';

  @override
  String get emptyBlocks => 'ワークアウトブロックはまだありません。\nストレングスブロックを追加して記録を始めましょう。';

  @override
  String get history => '履歴';

  @override
  String get emptyHistory => 'ワークアウトの記録はまだありません。';

  @override
  String get editSession => 'セッションを編集';

  @override
  String get sessionTitle => 'セッション名';

  @override
  String get sessionNotes => 'メモ（任意）';

  @override
  String get deleteSession => 'セッションを削除';

  @override
  String get confirmDeleteSession => 'このセッションとすべての記録を削除しますか？元に戻せません。';

  @override
  String get wodSectionTitle => 'WOD';

  @override
  String get addWodBlock => 'WODを追加';

  @override
  String get wodName => 'WOD名';

  @override
  String get addWodResult => '結果を追加';

  @override
  String get editWodResult => '結果を編集';

  @override
  String get wodResultType => '結果タイプ';

  @override
  String get wodScore => 'スコアまたは結果';

  @override
  String get wodNotes => '結果メモ';

  @override
  String get emptyWodBlocks => 'WODはまだありません。追加して結果を記録しましょう。';

  @override
  String get emptyWodResult => '結果はまだありません。';

  @override
  String get resultForTime => 'タイム計測';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => 'ラウンド＋回数';

  @override
  String get resultLoad => '重量';

  @override
  String get resultOther => 'その他';

  @override
  String get editSet => 'セットを編集';

  @override
  String get deleteSet => 'セットを削除';

  @override
  String get confirmDeleteSet => 'このセットを削除しますか？';

  @override
  String get editBlock => 'ブロックを編集';

  @override
  String get deleteBlock => 'ブロックを削除';

  @override
  String get confirmDeleteBlock => 'このブロックとすべての種目・セットを削除しますか？この操作は取り消せません。';

  @override
  String get editExercise => '種目を編集';

  @override
  String get deleteExercise => '種目を削除';

  @override
  String get confirmDeleteExercise => 'この種目とすべてのセットを削除しますか？この操作は取り消せません。';

  @override
  String get progress => '進捗';

  @override
  String get todaySummary => '今日の概要';

  @override
  String get trainingOverview => 'トレーニング概要';

  @override
  String get sessionsLabel => 'セッション';

  @override
  String get setsLabel => 'セット';

  @override
  String movementCount(int count) {
    return '$count種目';
  }

  @override
  String get movementsLabel => '種目';

  @override
  String setCount(String count) {
    return '$countセット';
  }

  @override
  String get weightedVolume => 'ウェイトボリューム';

  @override
  String get volumeUnit => 'kg·回';

  @override
  String get bestLoadChange => '最高重量の変化';

  @override
  String get volumeChange => 'ボリュームの変化';

  @override
  String get repChange => '回数の変化';

  @override
  String get noProgressYet => '同じ種目をもう一度記録すると、前回と比較できます。';

  @override
  String get previousWorkout => '前回';

  @override
  String get lastWorkout => '最新';

  @override
  String get chooseDate => 'トレーニング日を選択';

  @override
  String get allMovements => 'すべて';

  @override
  String get customExercise => '種目を追加';

  @override
  String get noMovementsFound => '種目が見つかりません';

  @override
  String get noChange => '変化なし';

  @override
  String get searchMovements => '種目を検索';

  @override
  String get benchmarkWorkouts => 'ベンチマークWOD';

  @override
  String get movementTypes => '種目グループ';

  @override
  String get last7Days => '過去7日間';

  @override
  String get previous7Days => 'その前の7日間';

  @override
  String get categoryBarbell => 'バーベル';

  @override
  String get categoryGymnastics => '体操';

  @override
  String get categoryDumbbellKettlebell => 'ダンベル／ケトルベル';

  @override
  String get categoryCardio => '有酸素運動';

  @override
  String get categoryBodyweight => '自重';

  @override
  String get categoryOtherEquipment => 'その他の器具';

  @override
  String get settings => '設定';

  @override
  String get weightUnit => '重量の単位';

  @override
  String get weightUnitError => '重量の単位を保存できませんでした。';

  @override
  String get categoryBenchmarkWod => 'ベンチマークWOD';

  @override
  String get noRecentMovementRecords => '過去14日間に種目の記録がありません。';

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
