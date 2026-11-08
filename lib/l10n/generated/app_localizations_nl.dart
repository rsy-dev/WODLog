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
}
