// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Heutiges Training';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Für heute ist kein Training erfasst';

  @override
  String get emptyTodayHelp =>
      'Erstelle eine Einheit, um dein Training zu erfassen.';

  @override
  String get startWorkout => 'Training starten';

  @override
  String get workoutLog => 'Trainingsprotokoll';

  @override
  String get loadWorkoutError => 'Trainingsdaten konnten nicht geladen werden.';

  @override
  String get loadBlocksError => 'Trainingsblöcke konnten nicht geladen werden.';

  @override
  String get addStrengthBlock => 'Kraftblock hinzufügen';

  @override
  String get addBlockTitle => 'Trainingsblock hinzufügen';

  @override
  String get blockName => 'Name des Blocks';

  @override
  String get strength => 'Kraft';

  @override
  String get add => 'Hinzufügen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get addExercise => 'Übung';

  @override
  String get exerciseName => 'Name der Übung';

  @override
  String get exerciseHint => 'Kniebeuge';

  @override
  String get emptyBlockHelp => 'Füge diesem Block eine Übung hinzu.';

  @override
  String get loadExercisesError => 'Übungen konnten nicht geladen werden.';

  @override
  String get addSet => 'Satz hinzufügen';

  @override
  String get emptyExerciseHelp =>
      'Füge einen Satz hinzu, um dein Training zu erfassen.';

  @override
  String get loadSetsError => 'Sätze konnten nicht geladen werden.';

  @override
  String get weightKg => 'Gewicht (kg)';

  @override
  String get reps => 'Wiederholungen';

  @override
  String get save => 'Speichern';

  @override
  String setLabel(int number) {
    return 'Satz $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps Wiederholungen';
  }

  @override
  String get invalidSet =>
      'Gib ein gültiges Gewicht und eine ganze Wiederholungszahl größer als null ein.';

  @override
  String get bodyweight => 'Körpergewicht';

  @override
  String get emptyBlocks =>
      'Noch keine Trainingsblöcke.\nFüge einen Kraftblock hinzu, um zu beginnen.';
}
