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

  @override
  String get history => 'Verlauf';

  @override
  String get emptyHistory => 'Noch keine Trainings erfasst.';

  @override
  String get editSession => 'Einheit bearbeiten';

  @override
  String get sessionTitle => 'Titel der Einheit';

  @override
  String get sessionNotes => 'Notizen (optional)';

  @override
  String get deleteSession => 'Einheit löschen';

  @override
  String get confirmDeleteSession =>
      'Diese Einheit und alle Trainingsdaten löschen? Das kann nicht rückgängig gemacht werden.';

  @override
  String get wodSectionTitle => 'WODs';

  @override
  String get addWodBlock => 'WOD hinzufügen';

  @override
  String get wodName => 'WOD-Name';

  @override
  String get addWodResult => 'Ergebnis hinzufügen';

  @override
  String get editWodResult => 'Ergebnis bearbeiten';

  @override
  String get wodResultType => 'Ergebnistyp';

  @override
  String get wodScore => 'Punktzahl oder Ergebnis';

  @override
  String get wodNotes => 'Ergebnisnotizen';

  @override
  String get emptyWodBlocks =>
      'Noch keine WODs. Füge eines hinzu, um ein Ergebnis einzutragen.';

  @override
  String get emptyWodResult => 'Noch kein Ergebnis erfasst.';

  @override
  String get resultForTime => 'Auf Zeit';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => 'Runden + Wiederholungen';

  @override
  String get resultLoad => 'Last';

  @override
  String get resultOther => 'Sonstiges';

  @override
  String get editSet => 'Satz bearbeiten';

  @override
  String get deleteSet => 'Satz löschen';

  @override
  String get confirmDeleteSet => 'Diesen Satz löschen?';

  @override
  String get editBlock => 'Block bearbeiten';

  @override
  String get deleteBlock => 'Block löschen';

  @override
  String get confirmDeleteBlock =>
      'Diesen Block sowie alle Übungen und Sätze löschen? Das kann nicht rückgängig gemacht werden.';

  @override
  String get editExercise => 'Übung bearbeiten';

  @override
  String get deleteExercise => 'Übung löschen';

  @override
  String get confirmDeleteExercise =>
      'Diese Übung und alle Sätze löschen? Das kann nicht rückgängig gemacht werden.';

  @override
  String get progress => 'Fortschritt';

  @override
  String get todaySummary => 'Heutige Übersicht';

  @override
  String get trainingOverview => 'Trainingsübersicht';

  @override
  String get sessionsLabel => 'Einheiten';

  @override
  String get setsLabel => 'Sätze';

  @override
  String movementCount(int count) {
    return '$count Bewegungen';
  }

  @override
  String get movementsLabel => 'Bewegungen';

  @override
  String setCount(int count) {
    return '$count Sätze';
  }

  @override
  String get weightedVolume => 'Gewichtetes Volumen';

  @override
  String get volumeUnit => 'kg·Wiederholungen';

  @override
  String get bestLoadChange => 'Änderung der Bestlast';

  @override
  String get volumeChange => 'Volumenänderung';

  @override
  String get repChange => 'Wiederholungsänderung';

  @override
  String get noProgressYet =>
      'Wiederhole eine Übung, um deine Entwicklung zu vergleichen.';

  @override
  String get previousWorkout => 'Vorheriges';

  @override
  String get lastWorkout => 'Zuletzt';

  @override
  String get chooseDate => 'Trainingsdatum wählen';

  @override
  String get allMovements => 'Alle';

  @override
  String get customExercise => 'Eigene Übung hinzufügen';

  @override
  String get noMovementsFound => 'Keine Bewegungen gefunden';

  @override
  String get noChange => 'Keine Änderung';

  @override
  String get searchMovements => 'Bewegungen suchen';

  @override
  String get benchmarkWorkouts => 'Benchmark-WODs';

  @override
  String get movementTypes => 'Bewegungsgruppen';

  @override
  String get last7Days => 'Letzte 7 Tage';

  @override
  String get previous7Days => 'Vorherige 7 Tage';

  @override
  String get categoryBarbell => 'Langhantel';

  @override
  String get categoryGymnastics => 'Gymnastik';

  @override
  String get categoryDumbbellKettlebell => 'Kurzhantel/Kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Körpergewicht';

  @override
  String get categoryOtherEquipment => 'Sonstige Geräte';
}
