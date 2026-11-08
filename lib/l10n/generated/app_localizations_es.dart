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
}
