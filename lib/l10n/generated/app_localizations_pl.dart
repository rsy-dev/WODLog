// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Dzisiejszy trening';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Brak treningów zapisanych dzisiaj';

  @override
  String get emptyTodayHelp => 'Utwórz sesję, aby zapisać dzisiejszy trening.';

  @override
  String get startWorkout => 'Rozpocznij trening';

  @override
  String get workoutLog => 'Dziennik treningów';

  @override
  String get loadWorkoutError => 'Nie udało się wczytać treningów.';

  @override
  String get loadBlocksError => 'Nie udało się wczytać bloków treningowych.';

  @override
  String get addStrengthBlock => 'Dodaj blok siłowy';

  @override
  String get addBlockTitle => 'Dodaj blok treningowy';

  @override
  String get blockName => 'Nazwa bloku';

  @override
  String get strength => 'Siła';

  @override
  String get add => 'Dodaj';

  @override
  String get cancel => 'Anuluj';

  @override
  String get addExercise => 'Ćwiczenie';

  @override
  String get exerciseName => 'Nazwa ćwiczenia';

  @override
  String get exerciseHint => 'Przysiad ze sztangą';

  @override
  String get emptyBlockHelp => 'Dodaj ćwiczenie do tego bloku.';

  @override
  String get loadExercisesError => 'Nie udało się wczytać ćwiczeń.';

  @override
  String get addSet => 'Dodaj serię';

  @override
  String get emptyExerciseHelp => 'Dodaj serię, aby zapisać trening.';

  @override
  String get loadSetsError => 'Nie udało się wczytać serii.';

  @override
  String setWeight(String unit) {
    return 'Ciężar ($unit)';
  }

  @override
  String get reps => 'Powtórzenia';

  @override
  String get save => 'Zapisz';

  @override
  String setLabel(String number) {
    return 'Seria $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps powt.';
  }

  @override
  String get invalidSet =>
      'Wpisz prawidłowy ciężar i całkowitą liczbę powtórzeń większą od zera.';

  @override
  String get bodyweight => 'Masa ciała';

  @override
  String get emptyBlocks =>
      'Nie ma jeszcze bloków treningowych.\nDodaj blok siłowy, aby rozpocząć.';

  @override
  String get history => 'Historia';

  @override
  String get emptyHistory => 'Nie zapisano jeszcze żadnych treningów.';

  @override
  String get editSession => 'Edytuj sesję';

  @override
  String get sessionTitle => 'Tytuł sesji';

  @override
  String get sessionNotes => 'Notatki (opcjonalnie)';

  @override
  String get deleteSession => 'Usuń sesję';

  @override
  String get confirmDeleteSession =>
      'Usunąć tę sesję i wszystkie jej zapisy treningowe? Tej czynności nie można cofnąć.';

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
  String get editSet => 'Edytuj serię';

  @override
  String get deleteSet => 'Usuń serię';

  @override
  String get confirmDeleteSet => 'Usunąć tę serię?';

  @override
  String get editBlock => 'Edytuj blok';

  @override
  String get deleteBlock => 'Usuń blok';

  @override
  String get confirmDeleteBlock =>
      'Usunąć ten blok oraz wszystkie ćwiczenia i serie? Tej czynności nie można cofnąć.';

  @override
  String get editExercise => 'Edytuj ćwiczenie';

  @override
  String get deleteExercise => 'Usuń ćwiczenie';

  @override
  String get confirmDeleteExercise =>
      'Usunąć to ćwiczenie i wszystkie jego serie? Tej czynności nie można cofnąć.';

  @override
  String get progress => 'Postępy';

  @override
  String get todaySummary => 'Podsumowanie dnia';

  @override
  String get trainingOverview => 'Podsumowanie treningów';

  @override
  String get sessionsLabel => 'sesje';

  @override
  String get setsLabel => 'serie';

  @override
  String movementCount(int count) {
    return '$count ruchów';
  }

  @override
  String get movementsLabel => 'ruchy';

  @override
  String setCount(String count) {
    return '$count serii';
  }

  @override
  String get weightedVolume => 'Objętość z obciążeniem';

  @override
  String get volumeUnit => 'kg·powtórzenia';

  @override
  String get bestLoadChange => 'Zmiana najlepszego ciężaru';

  @override
  String get volumeChange => 'Zmiana objętości';

  @override
  String get repChange => 'Zmiana liczby powtórzeń';

  @override
  String get noProgressYet => 'Powtórz ćwiczenie, aby porównać postępy.';

  @override
  String get previousWorkout => 'Poprzedni';

  @override
  String get lastWorkout => 'Ostatni';

  @override
  String get chooseDate => 'Wybierz datę treningu';

  @override
  String get allMovements => 'Wszystkie';

  @override
  String get customExercise => 'Dodaj własne ćwiczenie';

  @override
  String get noMovementsFound => 'Nie znaleziono ruchów';

  @override
  String get noChange => 'Bez zmian';

  @override
  String get searchMovements => 'Szukaj ruchów';

  @override
  String get benchmarkWorkouts => 'WOD-y wzorcowe';

  @override
  String get movementTypes => 'Grupy ruchów';

  @override
  String get last7Days => 'Ostatnie 7 dni';

  @override
  String get previous7Days => 'Poprzednie 7 dni';

  @override
  String get categoryBarbell => 'Sztanga';

  @override
  String get categoryGymnastics => 'Gimnastyka';

  @override
  String get categoryDumbbellKettlebell => 'Hantla/kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Masa ciała';

  @override
  String get categoryOtherEquipment => 'Inny sprzęt';

  @override
  String get settings => 'Ustawienia';

  @override
  String get weightUnit => 'Jednostka ciężaru';

  @override
  String get weightUnitError => 'Nie udało się zapisać jednostki ciężaru.';

  @override
  String get categoryBenchmarkWod => 'WOD referencyjne';

  @override
  String get noRecentMovementRecords =>
      'Brak zapisów ruchu z ostatnich 14 dni.';

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
