// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Тренировка сегодня';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Сегодня тренировок пока нет';

  @override
  String get emptyTodayHelp =>
      'Создайте занятие, чтобы записать сегодняшнюю тренировку.';

  @override
  String get startWorkout => 'Начать тренировку';

  @override
  String get workoutLog => 'Журнал тренировок';

  @override
  String get loadWorkoutError => 'Не удалось загрузить записи тренировок.';

  @override
  String get loadBlocksError => 'Не удалось загрузить блоки тренировки.';

  @override
  String get addStrengthBlock => 'Добавить силовой блок';

  @override
  String get addBlockTitle => 'Добавить блок тренировки';

  @override
  String get blockName => 'Название блока';

  @override
  String get strength => 'Силовая тренировка';

  @override
  String get add => 'Добавить';

  @override
  String get cancel => 'Отмена';

  @override
  String get addExercise => 'Упражнение';

  @override
  String get exerciseName => 'Название упражнения';

  @override
  String get exerciseHint => 'Приседание со штангой';

  @override
  String get emptyBlockHelp => 'Добавьте упражнение в этот блок.';

  @override
  String get loadExercisesError => 'Не удалось загрузить упражнения.';

  @override
  String get addSet => 'Добавить подход';

  @override
  String get emptyExerciseHelp => 'Добавьте подход, чтобы записать результат.';

  @override
  String get loadSetsError => 'Не удалось загрузить подходы.';

  @override
  String get weightKg => 'Вес (кг)';

  @override
  String get reps => 'Повторения';

  @override
  String get save => 'Сохранить';

  @override
  String setLabel(int number) {
    return 'Подход $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight кг × $reps повт.';
  }

  @override
  String get invalidSet =>
      'Введите корректный вес и целое число повторений больше нуля.';

  @override
  String get bodyweight => 'Собственный вес';

  @override
  String get emptyBlocks =>
      'Блоков тренировок пока нет.\nДобавьте силовой блок, чтобы начать запись.';
}
