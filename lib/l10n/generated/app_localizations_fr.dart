// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Entraînement du jour';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Aucun entraînement enregistré aujourd’hui';

  @override
  String get emptyTodayHelp =>
      'Créez une séance pour noter l’entraînement du jour.';

  @override
  String get startWorkout => 'Commencer l’entraînement';

  @override
  String get workoutLog => 'Journal d’entraînement';

  @override
  String get loadWorkoutError => 'Impossible de charger les entraînements.';

  @override
  String get loadBlocksError => 'Impossible de charger les blocs.';

  @override
  String get addStrengthBlock => 'Ajouter un bloc de force';

  @override
  String get addBlockTitle => 'Ajouter un bloc d’entraînement';

  @override
  String get blockName => 'Nom du bloc';

  @override
  String get strength => 'Force';

  @override
  String get add => 'Ajouter';

  @override
  String get cancel => 'Annuler';

  @override
  String get addExercise => 'Exercice';

  @override
  String get exerciseName => 'Nom de l’exercice';

  @override
  String get exerciseHint => 'Squat arrière';

  @override
  String get emptyBlockHelp => 'Ajoutez un exercice à ce bloc.';

  @override
  String get loadExercisesError => 'Impossible de charger les exercices.';

  @override
  String get addSet => 'Ajouter une série';

  @override
  String get emptyExerciseHelp => 'Ajoutez une série pour noter votre séance.';

  @override
  String get loadSetsError => 'Impossible de charger les séries.';

  @override
  String get weightKg => 'Poids (kg)';

  @override
  String get reps => 'Répétitions';

  @override
  String get save => 'Enregistrer';

  @override
  String setLabel(int number) {
    return 'Série $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps répétitions';
  }

  @override
  String get invalidSet =>
      'Saisissez un poids valide et un nombre entier de répétitions supérieur à zéro.';

  @override
  String get bodyweight => 'Poids du corps';

  @override
  String get emptyBlocks =>
      'Aucun bloc pour le moment.\nAjoutez un bloc de force pour commencer.';
}
