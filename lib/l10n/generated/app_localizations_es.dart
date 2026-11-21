// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Entrenamiento de hoy';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Hoy no hay entrenamientos registrados';

  @override
  String get emptyTodayHelp =>
      'Crea una sesión para registrar el entrenamiento de hoy.';

  @override
  String get startWorkout => 'Empezar entrenamiento';

  @override
  String get workoutLog => 'Registro de entrenamiento';

  @override
  String get loadWorkoutError => 'No se pudieron cargar los entrenamientos.';

  @override
  String get loadBlocksError => 'No se pudieron cargar los bloques.';

  @override
  String get addStrengthBlock => 'Añadir bloque de fuerza';

  @override
  String get addBlockTitle => 'Añadir bloque de entrenamiento';

  @override
  String get blockName => 'Nombre del bloque';

  @override
  String get strength => 'Fuerza';

  @override
  String get add => 'Añadir';

  @override
  String get cancel => 'Cancelar';

  @override
  String get addExercise => 'Ejercicio';

  @override
  String get exerciseName => 'Nombre del ejercicio';

  @override
  String get exerciseHint => 'Sentadilla trasera';

  @override
  String get emptyBlockHelp => 'Añade un ejercicio a este bloque.';

  @override
  String get loadExercisesError => 'No se pudieron cargar los ejercicios.';

  @override
  String get addSet => 'Añadir serie';

  @override
  String get emptyExerciseHelp =>
      'Añade una serie para registrar el entrenamiento.';

  @override
  String get loadSetsError => 'No se pudieron cargar las series.';

  @override
  String setWeight(String unit) {
    return 'Peso ($unit)';
  }

  @override
  String get reps => 'Repeticiones';

  @override
  String get save => 'Guardar';

  @override
  String setLabel(String number) {
    return 'Serie $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps repeticiones';
  }

  @override
  String get invalidSet =>
      'Introduce un peso válido y un número entero de repeticiones mayor que cero.';

  @override
  String get bodyweight => 'Peso corporal';

  @override
  String get emptyBlocks =>
      'Todavía no hay bloques.\nAñade un bloque de fuerza para empezar a registrar.';

  @override
  String get history => 'Historial';

  @override
  String get emptyHistory => 'Todavía no hay entrenamientos registrados.';

  @override
  String get editSession => 'Editar sesión';

  @override
  String get sessionTitle => 'Título de la sesión';

  @override
  String get sessionNotes => 'Notas (opcional)';

  @override
  String get deleteSession => 'Eliminar sesión';

  @override
  String get confirmDeleteSession =>
      '¿Eliminar esta sesión y todos sus registros? Esta acción no se puede deshacer.';

  @override
  String get wodSectionTitle => 'WOD';

  @override
  String get addWodBlock => 'Añadir WOD';

  @override
  String get wodName => 'Nombre del WOD';

  @override
  String get addWodResult => 'Añadir resultado';

  @override
  String get editWodResult => 'Editar resultado';

  @override
  String get wodResultType => 'Tipo de resultado';

  @override
  String get wodScore => 'Puntuación o resultado';

  @override
  String get wodNotes => 'Notas del resultado';

  @override
  String get emptyWodBlocks =>
      'Aún no hay WOD. Añade uno para registrar un resultado.';

  @override
  String get emptyWodResult => 'No hay resultados.';

  @override
  String get resultForTime => 'Por tiempo';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => 'Rondas + repeticiones';

  @override
  String get resultLoad => 'Carga';

  @override
  String get resultOther => 'Otro';

  @override
  String get editSet => 'Editar serie';

  @override
  String get deleteSet => 'Eliminar serie';

  @override
  String get confirmDeleteSet => '¿Eliminar esta serie?';

  @override
  String get editBlock => 'Editar bloque';

  @override
  String get deleteBlock => 'Eliminar bloque';

  @override
  String get confirmDeleteBlock =>
      '¿Eliminar este bloque y todos sus ejercicios y series? No se puede deshacer.';

  @override
  String get editExercise => 'Editar ejercicio';

  @override
  String get deleteExercise => 'Eliminar ejercicio';

  @override
  String get confirmDeleteExercise =>
      '¿Eliminar este ejercicio y todas sus series? No se puede deshacer.';

  @override
  String get progress => 'Progreso';

  @override
  String get todaySummary => 'Resumen de hoy';

  @override
  String get trainingOverview => 'Resumen del entrenamiento';

  @override
  String get sessionsLabel => 'sesiones';

  @override
  String get setsLabel => 'series';

  @override
  String movementCount(int count) {
    return '$count movimientos';
  }

  @override
  String get movementsLabel => 'movimientos';

  @override
  String setCount(String count) {
    return '$count series';
  }

  @override
  String get weightedVolume => 'Volumen con peso';

  @override
  String get volumeUnit => 'kg·repeticiones';

  @override
  String get bestLoadChange => 'Cambio de carga máxima';

  @override
  String get volumeChange => 'Cambio de volumen';

  @override
  String get repChange => 'Cambio de repeticiones';

  @override
  String get noProgressYet => 'Repite un ejercicio para comparar tu evolución.';

  @override
  String get previousWorkout => 'Anterior';

  @override
  String get lastWorkout => 'Último';

  @override
  String get chooseDate => 'Elegir fecha del entrenamiento';

  @override
  String get allMovements => 'Todos';

  @override
  String get customExercise => 'Añadir ejercicio personalizado';

  @override
  String get noMovementsFound => 'No se encontraron movimientos';

  @override
  String get noChange => 'Sin cambios';

  @override
  String get searchMovements => 'Buscar movimientos';

  @override
  String get benchmarkWorkouts => 'WOD de referencia';

  @override
  String get movementTypes => 'Grupos de movimientos';

  @override
  String get last7Days => 'Últimos 7 días';

  @override
  String get previous7Days => '7 días anteriores';

  @override
  String get categoryBarbell => 'Barra';

  @override
  String get categoryGymnastics => 'Gimnasia';

  @override
  String get categoryDumbbellKettlebell => 'Mancuerna/kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Peso corporal';

  @override
  String get categoryOtherEquipment => 'Otro equipo';

  @override
  String get settings => 'Ajustes';

  @override
  String get weightUnit => 'Unidad de peso';

  @override
  String get weightUnitError => 'No se pudo guardar la unidad de peso.';

  @override
  String get categoryBenchmarkWod => 'WOD de referencia';

  @override
  String get noRecentMovementRecords =>
      'No hay registros de movimientos en los últimos 14 días.';

  @override
  String get todayTab => 'Today';

  @override
  String get recordWod => 'Log a WOD';

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
  String get weightCalculator => 'Weight converter';

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
  String get wodPersonalRecords => 'WOD PR';

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

  @override
  String get todayWodTitle => 'Today\'s WOD';

  @override
  String get homeBenchmarks => 'Benchmarks';

  @override
  String get homeRepeatWod => 'Repeat a WOD';

  @override
  String get homeWodPr => 'WOD PR';

  @override
  String get recordsTab => 'Log';

  @override
  String get settingsEyebrow => 'Preferences';

  @override
  String get weightUnitDescription =>
      'Applies to workout loads, logs and stats.';

  @override
  String get resources => 'Resources';
}
