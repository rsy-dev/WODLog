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
}
