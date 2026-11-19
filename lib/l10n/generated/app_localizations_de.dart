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
  String setWeight(String unit) {
    return 'Gewicht ($unit)';
  }

  @override
  String get reps => 'Wiederholungen';

  @override
  String get save => 'Speichern';

  @override
  String setLabel(String number) {
    return 'Satz $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps Wiederholungen';
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
  String setCount(String count) {
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

  @override
  String get settings => 'Einstellungen';

  @override
  String get weightUnit => 'Gewichtseinheit';

  @override
  String get weightUnitError =>
      'Die Gewichtseinheit konnte nicht gespeichert werden.';

  @override
  String get categoryBenchmarkWod => 'Benchmark-WODs';

  @override
  String get noRecentMovementRecords =>
      'Keine Bewegungsdaten für die letzten 14 Tage.';

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
}
