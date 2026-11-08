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
  String get weightKg => 'Ciężar (kg)';

  @override
  String get reps => 'Powtórzenia';

  @override
  String get save => 'Zapisz';

  @override
  String setLabel(int number) {
    return 'Seria $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps powt.';
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
  String setCount(int count) {
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
}
