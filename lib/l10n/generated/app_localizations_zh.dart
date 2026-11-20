// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => '今日训练';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => '今天还没有训练记录';

  @override
  String get emptyTodayHelp => '创建训练课程，记录今天的训练。';

  @override
  String get startWorkout => '开始训练';

  @override
  String get workoutLog => '训练记录';

  @override
  String get loadWorkoutError => '无法加载训练记录。';

  @override
  String get loadBlocksError => '无法加载训练区块。';

  @override
  String get addStrengthBlock => '添加力量训练区块';

  @override
  String get addBlockTitle => '添加训练区块';

  @override
  String get blockName => '区块名称';

  @override
  String get strength => '力量训练';

  @override
  String get add => '添加';

  @override
  String get cancel => '取消';

  @override
  String get addExercise => '动作';

  @override
  String get exerciseName => '动作名称';

  @override
  String get exerciseHint => '杠铃深蹲';

  @override
  String get emptyBlockHelp => '向此区块添加一个动作。';

  @override
  String get loadExercisesError => '无法加载动作。';

  @override
  String get addSet => '添加组数';

  @override
  String get emptyExerciseHelp => '添加一组训练记录。';

  @override
  String get loadSetsError => '无法加载训练组。';

  @override
  String setWeight(String unit) {
    return '重量 ($unit)';
  }

  @override
  String get reps => '次数';

  @override
  String get save => '保存';

  @override
  String setLabel(String number) {
    return '第 $number 组';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps 次';
  }

  @override
  String get invalidSet => '请输入有效重量和大于零的整数次数。';

  @override
  String get bodyweight => '自重';

  @override
  String get emptyBlocks => '还没有训练区块。\n添加力量训练区块以开始记录。';

  @override
  String get history => '历史记录';

  @override
  String get emptyHistory => '尚无训练记录。';

  @override
  String get editSession => '编辑训练';

  @override
  String get sessionTitle => '训练名称';

  @override
  String get sessionNotes => '备注（选填）';

  @override
  String get deleteSession => '删除训练';

  @override
  String get confirmDeleteSession => '确定删除此训练及其所有记录吗？此操作无法撤销。';

  @override
  String get wodSectionTitle => 'WOD';

  @override
  String get addWodBlock => '添加 WOD';

  @override
  String get wodName => 'WOD 名称';

  @override
  String get addWodResult => '添加结果';

  @override
  String get editWodResult => '编辑结果';

  @override
  String get wodResultType => '结果类型';

  @override
  String get wodScore => '分数或结果';

  @override
  String get wodNotes => '结果备注';

  @override
  String get emptyWodBlocks => '暂无 WOD。添加一个以记录结果。';

  @override
  String get emptyWodResult => '尚无结果记录。';

  @override
  String get resultForTime => '计时完成';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => '轮数 + 次数';

  @override
  String get resultLoad => '负重';

  @override
  String get resultOther => '其他';

  @override
  String get editSet => '编辑组';

  @override
  String get deleteSet => '删除组';

  @override
  String get confirmDeleteSet => '删除这个训练组吗？';

  @override
  String get editBlock => '编辑训练组';

  @override
  String get deleteBlock => '删除训练组';

  @override
  String get confirmDeleteBlock => '删除此训练组及其中所有动作和组数？此操作无法撤销。';

  @override
  String get editExercise => '编辑动作';

  @override
  String get deleteExercise => '删除动作';

  @override
  String get confirmDeleteExercise => '删除此动作及其所有组数？此操作无法撤销。';

  @override
  String get progress => '进度';

  @override
  String get todaySummary => '今日概览';

  @override
  String get trainingOverview => '训练概览';

  @override
  String get sessionsLabel => '训练';

  @override
  String get setsLabel => '组';

  @override
  String movementCount(int count) {
    return '$count 个动作';
  }

  @override
  String get movementsLabel => '动作';

  @override
  String setCount(String count) {
    return '$count 组';
  }

  @override
  String get weightedVolume => '负重训练总量';

  @override
  String get volumeUnit => '公斤·次';

  @override
  String get bestLoadChange => '最大重量变化';

  @override
  String get volumeChange => '训练量变化';

  @override
  String get repChange => '次数变化';

  @override
  String get noProgressYet => '再次记录同一动作即可比较进步。';

  @override
  String get previousWorkout => '上次';

  @override
  String get lastWorkout => '最近';

  @override
  String get chooseDate => '选择训练日期';

  @override
  String get allMovements => '全部';

  @override
  String get customExercise => '添加自定义动作';

  @override
  String get noMovementsFound => '未找到动作';

  @override
  String get noChange => '无变化';

  @override
  String get searchMovements => '搜索动作';

  @override
  String get benchmarkWorkouts => '基准 WOD';

  @override
  String get movementTypes => '动作类别';

  @override
  String get last7Days => '最近 7 天';

  @override
  String get previous7Days => '之前 7 天';

  @override
  String get categoryBarbell => '杠铃';

  @override
  String get categoryGymnastics => '体操';

  @override
  String get categoryDumbbellKettlebell => '哑铃/壶铃';

  @override
  String get categoryCardio => '有氧';

  @override
  String get categoryBodyweight => '自重';

  @override
  String get categoryOtherEquipment => '其他器械';

  @override
  String get settings => '设置';

  @override
  String get weightUnit => '重量单位';

  @override
  String get weightUnitError => '无法保存重量单位。';

  @override
  String get categoryBenchmarkWod => '基准 WOD';

  @override
  String get noRecentMovementRecords => '过去 14 天没有动作记录。';

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

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => '今日训练';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => '今天还没有训练记录';

  @override
  String get emptyTodayHelp => '创建训练课程，记录今天的训练。';

  @override
  String get startWorkout => '开始训练';

  @override
  String get workoutLog => '训练记录';

  @override
  String get loadWorkoutError => '无法加载训练记录。';

  @override
  String get loadBlocksError => '无法加载训练区块。';

  @override
  String get addStrengthBlock => '添加力量训练区块';

  @override
  String get addBlockTitle => '添加训练区块';

  @override
  String get blockName => '区块名称';

  @override
  String get strength => '力量训练';

  @override
  String get add => '添加';

  @override
  String get cancel => '取消';

  @override
  String get addExercise => '动作';

  @override
  String get exerciseName => '动作名称';

  @override
  String get exerciseHint => '杠铃深蹲';

  @override
  String get emptyBlockHelp => '向此区块添加一个动作。';

  @override
  String get loadExercisesError => '无法加载动作。';

  @override
  String get addSet => '添加组数';

  @override
  String get emptyExerciseHelp => '添加一组训练记录。';

  @override
  String get loadSetsError => '无法加载训练组。';

  @override
  String setWeight(String unit) {
    return '重量 ($unit)';
  }

  @override
  String get reps => '次数';

  @override
  String get save => '保存';

  @override
  String setLabel(String number) {
    return '第 $number 组';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps 次';
  }

  @override
  String get invalidSet => '请输入有效重量和大于零的整数次数。';

  @override
  String get bodyweight => '自重';

  @override
  String get emptyBlocks => '还没有训练区块。\n添加力量训练区块以开始记录。';

  @override
  String get history => '历史记录';

  @override
  String get emptyHistory => '尚无训练记录。';

  @override
  String get editSession => '编辑训练';

  @override
  String get sessionTitle => '训练名称';

  @override
  String get sessionNotes => '备注（选填）';

  @override
  String get deleteSession => '删除训练';

  @override
  String get confirmDeleteSession => '确定删除此训练及其所有记录吗？此操作无法撤销。';

  @override
  String get wodSectionTitle => 'WOD';

  @override
  String get addWodBlock => '添加 WOD';

  @override
  String get wodName => 'WOD 名称';

  @override
  String get addWodResult => '添加结果';

  @override
  String get editWodResult => '编辑结果';

  @override
  String get wodResultType => '结果类型';

  @override
  String get wodScore => '分数或结果';

  @override
  String get wodNotes => '结果备注';

  @override
  String get emptyWodBlocks => '暂无 WOD。添加一个以记录结果。';

  @override
  String get emptyWodResult => '尚无结果记录。';

  @override
  String get resultForTime => '计时完成';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => '轮数 + 次数';

  @override
  String get resultLoad => '负重';

  @override
  String get resultOther => '其他';

  @override
  String get editSet => '编辑组';

  @override
  String get deleteSet => '删除组';

  @override
  String get confirmDeleteSet => '删除这个训练组吗？';

  @override
  String get editBlock => '编辑训练组';

  @override
  String get deleteBlock => '删除训练组';

  @override
  String get confirmDeleteBlock => '删除此训练组及其中所有动作和组数？此操作无法撤销。';

  @override
  String get editExercise => '编辑动作';

  @override
  String get deleteExercise => '删除动作';

  @override
  String get confirmDeleteExercise => '删除此动作及其所有组数？此操作无法撤销。';

  @override
  String get progress => '进度';

  @override
  String get todaySummary => '今日概览';

  @override
  String get trainingOverview => '训练概览';

  @override
  String get sessionsLabel => '训练';

  @override
  String get setsLabel => '组';

  @override
  String movementCount(int count) {
    return '$count 个动作';
  }

  @override
  String get movementsLabel => '动作';

  @override
  String setCount(String count) {
    return '$count 组';
  }

  @override
  String get weightedVolume => '负重训练总量';

  @override
  String get volumeUnit => '公斤·次';

  @override
  String get bestLoadChange => '最大重量变化';

  @override
  String get volumeChange => '训练量变化';

  @override
  String get repChange => '次数变化';

  @override
  String get noProgressYet => '再次记录同一动作即可比较进步。';

  @override
  String get previousWorkout => '上次';

  @override
  String get lastWorkout => '最近';

  @override
  String get chooseDate => '选择训练日期';

  @override
  String get allMovements => '全部';

  @override
  String get customExercise => '添加自定义动作';

  @override
  String get noMovementsFound => '未找到动作';

  @override
  String get noChange => '无变化';

  @override
  String get searchMovements => '搜索动作';

  @override
  String get benchmarkWorkouts => '基准 WOD';

  @override
  String get movementTypes => '动作类别';

  @override
  String get last7Days => '最近 7 天';

  @override
  String get previous7Days => '之前 7 天';

  @override
  String get categoryBarbell => '杠铃';

  @override
  String get categoryGymnastics => '体操';

  @override
  String get categoryDumbbellKettlebell => '哑铃/壶铃';

  @override
  String get categoryCardio => '有氧';

  @override
  String get categoryBodyweight => '自重';

  @override
  String get categoryOtherEquipment => '其他器械';

  @override
  String get settings => '设置';

  @override
  String get weightUnit => '重量单位';

  @override
  String get weightUnitError => '无法保存重量单位。';

  @override
  String get categoryBenchmarkWod => '基准 WOD';

  @override
  String get noRecentMovementRecords => '过去 14 天没有动作记录。';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => '今日訓練';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => '今天還沒有訓練紀錄';

  @override
  String get emptyTodayHelp => '建立訓練課表，記錄今天的訓練。';

  @override
  String get startWorkout => '開始訓練';

  @override
  String get workoutLog => '訓練紀錄';

  @override
  String get loadWorkoutError => '無法載入訓練紀錄。';

  @override
  String get loadBlocksError => '無法載入訓練區塊。';

  @override
  String get addStrengthBlock => '新增肌力訓練區塊';

  @override
  String get addBlockTitle => '新增訓練區塊';

  @override
  String get blockName => '區塊名稱';

  @override
  String get strength => '肌力訓練';

  @override
  String get add => '新增';

  @override
  String get cancel => '取消';

  @override
  String get addExercise => '動作';

  @override
  String get exerciseName => '動作名稱';

  @override
  String get exerciseHint => '槓鈴深蹲';

  @override
  String get emptyBlockHelp => '在此區塊新增動作。';

  @override
  String get loadExercisesError => '無法載入動作。';

  @override
  String get addSet => '新增組數';

  @override
  String get emptyExerciseHelp => '新增一組訓練紀錄。';

  @override
  String get loadSetsError => '無法載入訓練組。';

  @override
  String setWeight(String unit) {
    return '重量 ($unit)';
  }

  @override
  String get reps => '次數';

  @override
  String get save => '儲存';

  @override
  String setLabel(String number) {
    return '第 $number 組';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps 次';
  }

  @override
  String get invalidSet => '請輸入有效重量及大於零的整數次數。';

  @override
  String get bodyweight => '自體重量';

  @override
  String get emptyBlocks => '目前沒有訓練區塊。\n新增肌力訓練區塊即可開始記錄。';

  @override
  String get history => '訓練記錄';

  @override
  String get emptyHistory => '目前沒有訓練紀錄。';

  @override
  String get editSession => '編輯訓練';

  @override
  String get sessionTitle => '訓練名稱';

  @override
  String get sessionNotes => '備註（選填）';

  @override
  String get deleteSession => '刪除訓練';

  @override
  String get confirmDeleteSession => '確定要刪除此訓練及所有紀錄嗎？此操作無法復原。';

  @override
  String get wodSectionTitle => 'WOD';

  @override
  String get addWodBlock => '新增 WOD';

  @override
  String get wodName => 'WOD 名稱';

  @override
  String get addWodResult => '新增結果';

  @override
  String get editWodResult => '編輯結果';

  @override
  String get wodResultType => '結果類型';

  @override
  String get wodScore => '分數或結果';

  @override
  String get wodNotes => '結果備註';

  @override
  String get emptyWodBlocks => '尚無 WOD。新增一個以記錄結果。';

  @override
  String get emptyWodResult => '尚無結果紀錄。';

  @override
  String get resultForTime => '計時完成';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => '回合 + 次數';

  @override
  String get resultLoad => '負重';

  @override
  String get resultOther => '其他';

  @override
  String get editSet => '編輯組';

  @override
  String get deleteSet => '刪除組';

  @override
  String get confirmDeleteSet => '要刪除這個訓練組嗎？';

  @override
  String get editBlock => '編輯訓練組';

  @override
  String get deleteBlock => '刪除訓練組';

  @override
  String get confirmDeleteBlock => '刪除此訓練組及其中所有動作和組數？此操作無法復原。';

  @override
  String get editExercise => '編輯動作';

  @override
  String get deleteExercise => '刪除動作';

  @override
  String get confirmDeleteExercise => '刪除此動作及其所有組數？此操作無法復原。';

  @override
  String get progress => '進度';

  @override
  String get todaySummary => '今日概覽';

  @override
  String get trainingOverview => '訓練概覽';

  @override
  String get sessionsLabel => '訓練';

  @override
  String get setsLabel => '組';

  @override
  String movementCount(int count) {
    return '$count 個動作';
  }

  @override
  String get movementsLabel => '動作';

  @override
  String setCount(String count) {
    return '$count 組';
  }

  @override
  String get weightedVolume => '負重訓練總量';

  @override
  String get volumeUnit => '公斤·次';

  @override
  String get bestLoadChange => '最大重量變化';

  @override
  String get volumeChange => '訓練量變化';

  @override
  String get repChange => '次數變化';

  @override
  String get noProgressYet => '再次記錄同一動作即可比較進步。';

  @override
  String get previousWorkout => '上次';

  @override
  String get lastWorkout => '最近';

  @override
  String get chooseDate => '選擇訓練日期';

  @override
  String get allMovements => '全部';

  @override
  String get customExercise => '新增自訂動作';

  @override
  String get noMovementsFound => '找不到動作';

  @override
  String get noChange => '沒有變化';

  @override
  String get searchMovements => '搜尋動作';

  @override
  String get benchmarkWorkouts => '基準 WOD';

  @override
  String get movementTypes => '動作類別';

  @override
  String get last7Days => '最近 7 天';

  @override
  String get previous7Days => '之前 7 天';

  @override
  String get categoryBarbell => '槓鈴';

  @override
  String get categoryGymnastics => '體操';

  @override
  String get categoryDumbbellKettlebell => '啞鈴/壺鈴';

  @override
  String get categoryCardio => '有氧';

  @override
  String get categoryBodyweight => '自重';

  @override
  String get categoryOtherEquipment => '其他器材';

  @override
  String get settings => '設定';

  @override
  String get weightUnit => '重量單位';

  @override
  String get weightUnitError => '無法儲存重量單位。';

  @override
  String get categoryBenchmarkWod => '基準 WOD';

  @override
  String get noRecentMovementRecords => '過去 14 天沒有動作紀錄。';
}
