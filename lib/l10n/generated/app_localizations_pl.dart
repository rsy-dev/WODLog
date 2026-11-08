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
}
