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
  String get weightKg => '重量 (kg)';

  @override
  String get reps => '次数';

  @override
  String get save => '保存';

  @override
  String setLabel(int number) {
    return '第 $number 组';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps 次';
  }

  @override
  String get invalidSet => '请输入有效重量和大于零的整数次数。';

  @override
  String get bodyweight => '自重';

  @override
  String get emptyBlocks => '还没有训练区块。\n添加力量训练区块以开始记录。';
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
  String get weightKg => '重量 (kg)';

  @override
  String get reps => '次数';

  @override
  String get save => '保存';

  @override
  String setLabel(int number) {
    return '第 $number 组';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps 次';
  }

  @override
  String get invalidSet => '请输入有效重量和大于零的整数次数。';

  @override
  String get bodyweight => '自重';

  @override
  String get emptyBlocks => '还没有训练区块。\n添加力量训练区块以开始记录。';
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
  String get weightKg => '重量 (kg)';

  @override
  String get reps => '次數';

  @override
  String get save => '儲存';

  @override
  String setLabel(int number) {
    return '第 $number 組';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps 次';
  }

  @override
  String get invalidSet => '請輸入有效重量及大於零的整數次數。';

  @override
  String get bodyweight => '自體重量';

  @override
  String get emptyBlocks => '目前沒有訓練區塊。\n新增肌力訓練區塊即可開始記錄。';
}
