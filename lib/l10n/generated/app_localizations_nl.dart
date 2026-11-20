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
  String setWeight(String unit) {
    return 'Gewicht ($unit)';
  }

  @override
  String get reps => 'Herhalingen';

  @override
  String get save => 'Opslaan';

  @override
  String setLabel(String number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps herhalingen';
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
  String setCount(String count) {
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

  @override
  String get settings => 'Instellingen';

  @override
  String get weightUnit => 'Gewichtseenheid';

  @override
  String get weightUnitError =>
      'De gewichtseenheid kon niet worden opgeslagen.';

  @override
  String get categoryBenchmarkWod => 'Benchmark-WOD’s';

  @override
  String get noRecentMovementRecords =>
      'Geen bewegingen geregistreerd in de afgelopen 14 dagen.';

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
