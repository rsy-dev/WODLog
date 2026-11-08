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
  String get weightKg => '重量 (kg)';

  @override
  String get reps => '回数';

  @override
  String get save => '保存';

  @override
  String setLabel(int number) {
    return '$numberセット';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps回';
  }

  @override
  String get invalidSet => '有効な重量と、0より大きい整数の回数を入力してください。';

  @override
  String get bodyweight => '自重';

  @override
  String get emptyBlocks => 'ワークアウトブロックはまだありません。\nストレングスブロックを追加して記録を始めましょう。';
}
