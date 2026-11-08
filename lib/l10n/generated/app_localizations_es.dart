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
  String get weightKg => 'Peso (kg)';

  @override
  String get reps => 'Repeticiones';

  @override
  String get save => 'Guardar';

  @override
  String setLabel(int number) {
    return 'Serie $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps repeticiones';
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
  String setCount(int count) {
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
}
