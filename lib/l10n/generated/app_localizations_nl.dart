// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Training van vandaag';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Vandaag is er nog geen training vastgelegd';

  @override
  String get emptyTodayHelp =>
      'Maak een sessie aan om je training van vandaag vast te leggen.';

  @override
  String get startWorkout => 'Training starten';

  @override
  String get workoutLog => 'Trainingslogboek';

  @override
  String get loadWorkoutError =>
      'Trainingsgegevens konden niet worden geladen.';

  @override
  String get loadBlocksError => 'Trainingsblokken konden niet worden geladen.';

  @override
  String get addStrengthBlock => 'Krachtblok toevoegen';

  @override
  String get addBlockTitle => 'Trainingsblok toevoegen';

  @override
  String get blockName => 'Naam van het blok';

  @override
  String get strength => 'Kracht';

  @override
  String get add => 'Toevoegen';

  @override
  String get cancel => 'Annuleren';

  @override
  String get addExercise => 'Oefening';

  @override
  String get exerciseName => 'Naam van de oefening';

  @override
  String get exerciseHint => 'Back squat';

  @override
  String get emptyBlockHelp => 'Voeg een oefening toe aan dit blok.';

  @override
  String get loadExercisesError => 'Oefeningen konden niet worden geladen.';

  @override
  String get addSet => 'Set toevoegen';

  @override
  String get emptyExerciseHelp =>
      'Voeg een set toe om je training vast te leggen.';

  @override
  String get loadSetsError => 'Sets konden niet worden geladen.';

  @override
  String get weightKg => 'Gewicht (kg)';

  @override
  String get reps => 'Herhalingen';

  @override
  String get save => 'Opslaan';

  @override
  String setLabel(int number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps herhalingen';
  }

  @override
  String get invalidSet =>
      'Vul een geldig gewicht en een geheel aantal herhalingen groter dan nul in.';

  @override
  String get bodyweight => 'Lichaamsgewicht';

  @override
  String get emptyBlocks =>
      'Er zijn nog geen trainingsblokken.\nVoeg een krachtblok toe om te beginnen.';

  @override
  String get history => 'Geschiedenis';

  @override
  String get emptyHistory => 'Er zijn nog geen trainingen vastgelegd.';

  @override
  String get editSession => 'Sessie bewerken';

  @override
  String get sessionTitle => 'Sessietitel';

  @override
  String get sessionNotes => 'Notities (optioneel)';

  @override
  String get deleteSession => 'Sessie verwijderen';

  @override
  String get confirmDeleteSession =>
      'Deze sessie en alle trainingsgegevens verwijderen? Dit kan niet ongedaan worden gemaakt.';

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
  String get editSet => 'Set bewerken';

  @override
  String get deleteSet => 'Set verwijderen';

  @override
  String get confirmDeleteSet => 'Deze set verwijderen?';

  @override
  String get editBlock => 'Blok bewerken';

  @override
  String get deleteBlock => 'Blok verwijderen';

  @override
  String get confirmDeleteBlock =>
      'Dit blok en alle oefeningen en sets verwijderen? Dit kan niet ongedaan worden gemaakt.';

  @override
  String get editExercise => 'Oefening bewerken';

  @override
  String get deleteExercise => 'Oefening verwijderen';

  @override
  String get confirmDeleteExercise =>
      'Deze oefening en alle sets verwijderen? Dit kan niet ongedaan worden gemaakt.';

  @override
  String get progress => 'Voortgang';

  @override
  String get todaySummary => 'Overzicht van vandaag';

  @override
  String get trainingOverview => 'Trainingsoverzicht';

  @override
  String get sessionsLabel => 'sessies';

  @override
  String get setsLabel => 'sets';

  @override
  String movementCount(int count) {
    return '$count bewegingen';
  }

  @override
  String get movementsLabel => 'bewegingen';

  @override
  String setCount(int count) {
    return '$count sets';
  }

  @override
  String get weightedVolume => 'Gewogen volume';

  @override
  String get volumeUnit => 'kg·herhalingen';

  @override
  String get bestLoadChange => 'Verandering in hoogste gewicht';

  @override
  String get volumeChange => 'Volumeverandering';

  @override
  String get repChange => 'Verandering in herhalingen';

  @override
  String get noProgressYet =>
      'Herhaal een oefening om je voortgang te vergelijken.';

  @override
  String get previousWorkout => 'Vorige';

  @override
  String get lastWorkout => 'Laatste';

  @override
  String get chooseDate => 'Trainingsdatum kiezen';

  @override
  String get allMovements => 'Alles';

  @override
  String get customExercise => 'Eigen oefening toevoegen';

  @override
  String get noMovementsFound => 'Geen bewegingen gevonden';

  @override
  String get noChange => 'Geen verandering';

  @override
  String get searchMovements => 'Bewegingen zoeken';

  @override
  String get benchmarkWorkouts => 'Benchmark-WOD’s';

  @override
  String get movementTypes => 'Bewegingsgroepen';

  @override
  String get last7Days => 'Afgelopen 7 dagen';

  @override
  String get previous7Days => '7 dagen daarvoor';

  @override
  String get categoryBarbell => 'Halters';

  @override
  String get categoryGymnastics => 'Gymnastiek';

  @override
  String get categoryDumbbellKettlebell => 'Dumbbell/kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Lichaamsgewicht';

  @override
  String get categoryOtherEquipment => 'Overige apparatuur';
}
