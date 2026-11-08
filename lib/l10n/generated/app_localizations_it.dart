// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Allenamento di oggi';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Nessun allenamento registrato oggi';

  @override
  String get emptyTodayHelp =>
      'Crea una sessione per registrare l\'allenamento di oggi.';

  @override
  String get startWorkout => 'Inizia allenamento';

  @override
  String get workoutLog => 'Diario di allenamento';

  @override
  String get loadWorkoutError => 'Impossibile caricare gli allenamenti.';

  @override
  String get loadBlocksError => 'Impossibile caricare i blocchi.';

  @override
  String get addStrengthBlock => 'Aggiungi blocco forza';

  @override
  String get addBlockTitle => 'Aggiungi blocco di allenamento';

  @override
  String get blockName => 'Nome del blocco';

  @override
  String get strength => 'Forza';

  @override
  String get add => 'Aggiungi';

  @override
  String get cancel => 'Annulla';

  @override
  String get addExercise => 'Esercizio';

  @override
  String get exerciseName => 'Nome dell\'esercizio';

  @override
  String get exerciseHint => 'Squat con bilanciere';

  @override
  String get emptyBlockHelp => 'Aggiungi un esercizio a questo blocco.';

  @override
  String get loadExercisesError => 'Impossibile caricare gli esercizi.';

  @override
  String get addSet => 'Aggiungi serie';

  @override
  String get emptyExerciseHelp =>
      'Aggiungi una serie per registrare l\'allenamento.';

  @override
  String get loadSetsError => 'Impossibile caricare le serie.';

  @override
  String get weightKg => 'Peso (kg)';

  @override
  String get reps => 'Ripetizioni';

  @override
  String get save => 'Salva';

  @override
  String setLabel(int number) {
    return 'Serie $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps ripetizioni';
  }

  @override
  String get invalidSet =>
      'Inserisci un peso valido e un numero intero di ripetizioni maggiore di zero.';

  @override
  String get bodyweight => 'Peso corporeo';

  @override
  String get emptyBlocks =>
      'Non ci sono ancora blocchi.\nAggiungi un blocco forza per iniziare.';

  @override
  String get history => 'Cronologia';

  @override
  String get emptyHistory => 'Nessun allenamento registrato.';

  @override
  String get editSession => 'Modifica sessione';

  @override
  String get sessionTitle => 'Titolo della sessione';

  @override
  String get sessionNotes => 'Note (facoltative)';

  @override
  String get deleteSession => 'Elimina sessione';

  @override
  String get confirmDeleteSession =>
      'Eliminare questa sessione e tutti i suoi allenamenti? L’azione non può essere annullata.';

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
  String get editSet => 'Modifica serie';

  @override
  String get deleteSet => 'Elimina serie';

  @override
  String get confirmDeleteSet => 'Eliminare questa serie?';

  @override
  String get editBlock => 'Modifica blocco';

  @override
  String get deleteBlock => 'Elimina blocco';

  @override
  String get confirmDeleteBlock =>
      'Eliminare questo blocco e tutti i suoi esercizi e set? L’operazione non può essere annullata.';

  @override
  String get editExercise => 'Modifica esercizio';

  @override
  String get deleteExercise => 'Elimina esercizio';

  @override
  String get confirmDeleteExercise =>
      'Eliminare questo esercizio e tutti i suoi set? L’operazione non può essere annullata.';
}
