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
  String setWeight(String unit) {
    return 'Poids ($unit)';
  }

  @override
  String get reps => 'Répétitions';

  @override
  String get save => 'Enregistrer';

  @override
  String setLabel(String number) {
    return 'Série $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps répétitions';
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
  String setCount(String count) {
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

  @override
  String get settings => 'Paramètres';

  @override
  String get weightUnit => 'Unité de poids';

  @override
  String get weightUnitError => 'Impossible d’enregistrer l’unité de poids.';

  @override
  String get categoryBenchmarkWod => 'WOD de référence';

  @override
  String get noRecentMovementRecords =>
      'Aucun mouvement enregistré ces 14 derniers jours.';

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
  String weightConversionDirection(String source, String target) {
    return '$source to $target';
  }

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

  @override
  String get wodPersonalRecords => 'WOD personal records';

  @override
  String get wodNoComparableRecords =>
      'No WOD results with confirmed comparison conditions.';

  @override
  String get wodCurrentBest => 'Current best';

  @override
  String get wodRecordImprovements => 'Record improvements';

  @override
  String get wodScoreHistory => 'Score history';

  @override
  String get strengthPersonalRecords => 'Strength records';

  @override
  String get strengthEstimatedOneRepMax => 'Estimated 1RM';

  @override
  String get strengthRecordMethod =>
      'Actual: successful sets at each rep count. Estimated: Epley (2–10 reps).';

  @override
  String get strengthDailyBest => 'Heaviest weight by date';

  @override
  String get wodRecentRecords => 'Recent WODs';

  @override
  String get wodViewAll => 'View all';

  @override
  String get wodRecordAgain => 'Record again';

  @override
  String get wodNewPersonalRecord => 'New personal record';

  @override
  String get wodWorkoutStandard => 'Workout standard';

  @override
  String get wodUnconfirmedStandard => 'Unconfirmed';

  @override
  String get wodCustomStandard => 'Custom';

  @override
  String get wodMissingTimeCap => 'Enter the time cap for a capped result.';

  @override
  String get wodTimeCapSeconds => 'Time cap (seconds)';

  @override
  String get wodTotalRounds => 'Total rounds';

  @override
  String get wodDurationSeconds => 'Workout duration (seconds)';

  @override
  String get wodTotalIntervals => 'Total intervals';

  @override
  String get wodIntervalLengthSeconds => 'Interval length (seconds)';

  @override
  String get wodIntervals => 'Intervals';

  @override
  String get wodTiebreak => 'Tiebreak (min:sec)';

  @override
  String get wodUnreadLinesConfirmed =>
      'I reviewed the unread lines and corrected the prescription';

  @override
  String get wodMovementQuantities => 'Quantities by segment (/ separated)';

  @override
  String get wodMovementEquipment => 'Equipment';

  @override
  String get wodMovementStandard => 'Target height and movement standard';

  @override
  String get wodMoveUp => 'Move up';

  @override
  String get wodMoveDown => 'Move down';

  @override
  String get wodDeleteRecord => 'Delete WOD';

  @override
  String get glossaryWodMetcon =>
      'Workout of the day / metabolic conditioning.';

  @override
  String get glossaryRft => 'Time to complete the prescribed rounds.';

  @override
  String get glossaryE2Mom => 'Start the prescribed work every two minutes.';

  @override
  String get glossaryIntervals => 'Repeat prescribed work and rest intervals.';

  @override
  String get glossaryTabata =>
      'Repeat 20 seconds of work and 10 seconds of rest.';

  @override
  String get glossaryMaxLoadReps =>
      'Heaviest successful load / maximum repetitions.';

  @override
  String get glossaryDistanceCalories =>
      'Distance or calorie score recorded by the equipment.';

  @override
  String get glossaryFoundations =>
      'A prescription for athletes building foundational skills.';

  @override
  String get glossaryTimeCap => 'The prescribed workout time limit.';

  @override
  String get glossaryTiebreak =>
      'The elapsed time at a specified checkpoint used to break a tie.';

  @override
  String get glossaryChipper =>
      'Complete a series of movements in order, once each.';

  @override
  String get glossaryCoupletTriplet =>
      'A workout combining two / three movements.';

  @override
  String get glossaryLadder =>
      'Repetitions or load change in steps across sets.';

  @override
  String get glossaryBuyInCashOut =>
      'Prescribed work before / after the main workout.';

  @override
  String get glossaryUnbroken => 'Complete a set without a break.';

  @override
  String get glossaryNoRep =>
      'A repetition that does not meet the movement standard.';

  @override
  String get glossaryPr =>
      'A personal record under comparable workout conditions.';
}
