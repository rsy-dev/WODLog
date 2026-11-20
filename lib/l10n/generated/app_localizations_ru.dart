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
  String setWeight(String unit) {
    return 'Вес ($unit)';
  }

  @override
  String get reps => 'Повторения';

  @override
  String get save => 'Сохранить';

  @override
  String setLabel(String number) {
    return 'Подход $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps повт.';
  }

  @override
  String get invalidSet =>
      'Введите корректный вес и целое число повторений больше нуля.';

  @override
  String get bodyweight => 'Собственный вес';

  @override
  String get emptyBlocks =>
      'Блоков тренировок пока нет.\nДобавьте силовой блок, чтобы начать запись.';

  @override
  String get history => 'История';

  @override
  String get emptyHistory => 'Записей тренировок пока нет.';

  @override
  String get editSession => 'Изменить занятие';

  @override
  String get sessionTitle => 'Название занятия';

  @override
  String get sessionNotes => 'Заметки (необязательно)';

  @override
  String get deleteSession => 'Удалить занятие';

  @override
  String get confirmDeleteSession =>
      'Удалить это занятие и все записи тренировок? Это действие нельзя отменить.';

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
  String get editSet => 'Изменить подход';

  @override
  String get deleteSet => 'Удалить подход';

  @override
  String get confirmDeleteSet => 'Удалить этот подход?';

  @override
  String get editBlock => 'Изменить блок';

  @override
  String get deleteBlock => 'Удалить блок';

  @override
  String get confirmDeleteBlock =>
      'Удалить этот блок и все его упражнения и подходы? Это действие нельзя отменить.';

  @override
  String get editExercise => 'Изменить упражнение';

  @override
  String get deleteExercise => 'Удалить упражнение';

  @override
  String get confirmDeleteExercise =>
      'Удалить это упражнение и все его подходы? Это действие нельзя отменить.';

  @override
  String get progress => 'Прогресс';

  @override
  String get todaySummary => 'Сводка за сегодня';

  @override
  String get trainingOverview => 'Сводка тренировок';

  @override
  String get sessionsLabel => 'тренировки';

  @override
  String get setsLabel => 'подходы';

  @override
  String movementCount(int count) {
    return '$count движений';
  }

  @override
  String get movementsLabel => 'движения';

  @override
  String setCount(String count) {
    return '$count подходов';
  }

  @override
  String get weightedVolume => 'Объём с отягощением';

  @override
  String get volumeUnit => 'кг·повторения';

  @override
  String get bestLoadChange => 'Изменение максимального веса';

  @override
  String get volumeChange => 'Изменение объёма';

  @override
  String get repChange => 'Изменение повторений';

  @override
  String get noProgressYet => 'Повторите упражнение, чтобы сравнить прогресс.';

  @override
  String get previousWorkout => 'Предыдущая';

  @override
  String get lastWorkout => 'Последняя';

  @override
  String get chooseDate => 'Выбрать дату тренировки';

  @override
  String get allMovements => 'Все';

  @override
  String get customExercise => 'Добавить своё упражнение';

  @override
  String get noMovementsFound => 'Движения не найдены';

  @override
  String get noChange => 'Без изменений';

  @override
  String get searchMovements => 'Поиск движений';

  @override
  String get benchmarkWorkouts => 'Эталонные WOD';

  @override
  String get movementTypes => 'Группы движений';

  @override
  String get last7Days => 'Последние 7 дней';

  @override
  String get previous7Days => 'Предыдущие 7 дней';

  @override
  String get categoryBarbell => 'Штанга';

  @override
  String get categoryGymnastics => 'Гимнастика';

  @override
  String get categoryDumbbellKettlebell => 'Гантель/гиря';

  @override
  String get categoryCardio => 'Кардио';

  @override
  String get categoryBodyweight => 'Вес тела';

  @override
  String get categoryOtherEquipment => 'Другое оборудование';

  @override
  String get settings => 'Настройки';

  @override
  String get weightUnit => 'Единица веса';

  @override
  String get weightUnitError => 'Не удалось сохранить единицу веса.';

  @override
  String get categoryBenchmarkWod => 'Эталонные WOD';

  @override
  String get noRecentMovementRecords =>
      'За последние 14 дней нет записей о движениях.';

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
