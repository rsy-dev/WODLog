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

  @override
  String get history => 'Historique';

  @override
  String get emptyHistory => 'Aucun entraînement enregistré pour le moment.';

  @override
  String get editSession => 'Modifier la séance';

  @override
  String get sessionTitle => 'Titre de la séance';

  @override
  String get sessionNotes => 'Notes (facultatif)';

  @override
  String get deleteSession => 'Supprimer la séance';

  @override
  String get confirmDeleteSession =>
      'Supprimer cette séance et tous ses enregistrements ? Cette action est irréversible.';

  @override
  String get wodSectionTitle => 'WOD';

  @override
  String get addWodBlock => 'Ajouter un WOD';

  @override
  String get wodName => 'Nom du WOD';

  @override
  String get addWodResult => 'Ajouter un résultat';

  @override
  String get editWodResult => 'Modifier le résultat';

  @override
  String get wodResultType => 'Type de résultat';

  @override
  String get wodScore => 'Score ou résultat';

  @override
  String get wodNotes => 'Notes du résultat';

  @override
  String get emptyWodBlocks =>
      'Aucun WOD. Ajoutez-en un pour enregistrer un résultat.';

  @override
  String get emptyWodResult => 'Aucun résultat enregistré.';

  @override
  String get resultForTime => 'Au temps';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => 'Tours + répétitions';

  @override
  String get resultLoad => 'Charge';

  @override
  String get resultOther => 'Autre';

  @override
  String get editSet => 'Modifier la série';

  @override
  String get deleteSet => 'Supprimer la série';

  @override
  String get confirmDeleteSet => 'Supprimer cette série ?';

  @override
  String get editBlock => 'Modifier le bloc';

  @override
  String get deleteBlock => 'Supprimer le bloc';

  @override
  String get confirmDeleteBlock =>
      'Supprimer ce bloc ainsi que tous ses exercices et toutes leurs séries ? Cette action est irréversible.';

  @override
  String get editExercise => 'Modifier l’exercice';

  @override
  String get deleteExercise => 'Supprimer l’exercice';

  @override
  String get confirmDeleteExercise =>
      'Supprimer cet exercice et toutes ses séries ? Cette action est irréversible.';

  @override
  String get progress => 'Progression';

  @override
  String get todaySummary => 'Résumé du jour';

  @override
  String get trainingOverview => 'Bilan d’entraînement';

  @override
  String get sessionsLabel => 'séances';

  @override
  String get setsLabel => 'séries';

  @override
  String movementCount(int count) {
    return '$count mouvements';
  }

  @override
  String get movementsLabel => 'mouvements';

  @override
  String setCount(int count) {
    return '$count séries';
  }

  @override
  String get weightedVolume => 'Volume avec charge';

  @override
  String get volumeUnit => 'kg·répétitions';

  @override
  String get bestLoadChange => 'Évolution de la charge maximale';

  @override
  String get volumeChange => 'Évolution du volume';

  @override
  String get repChange => 'Évolution des répétitions';

  @override
  String get noProgressYet => 'Répétez un exercice pour comparer vos progrès.';

  @override
  String get previousWorkout => 'Précédent';

  @override
  String get lastWorkout => 'Dernier';

  @override
  String get chooseDate => 'Choisir la date de l’entraînement';

  @override
  String get allMovements => 'Tout';

  @override
  String get customExercise => 'Ajouter un exercice personnalisé';

  @override
  String get noMovementsFound => 'Aucun mouvement trouvé';

  @override
  String get noChange => 'Aucun changement';

  @override
  String get searchMovements => 'Rechercher des mouvements';

  @override
  String get benchmarkWorkouts => 'WOD de référence';

  @override
  String get movementTypes => 'Groupes de mouvements';

  @override
  String get last7Days => '7 derniers jours';

  @override
  String get previous7Days => '7 jours précédents';

  @override
  String get categoryBarbell => 'Barre';

  @override
  String get categoryGymnastics => 'Gymnastique';

  @override
  String get categoryDumbbellKettlebell => 'Haltère/kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Poids du corps';

  @override
  String get categoryOtherEquipment => 'Autre matériel';
}
