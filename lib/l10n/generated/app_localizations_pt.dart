// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Treino de hoje';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Nenhum treino registrado hoje';

  @override
  String get emptyTodayHelp =>
      'Crie uma sessão para registrar o treino de hoje.';

  @override
  String get startWorkout => 'Iniciar treino';

  @override
  String get workoutLog => 'Registro de treino';

  @override
  String get loadWorkoutError => 'Não foi possível carregar os treinos.';

  @override
  String get loadBlocksError => 'Não foi possível carregar os blocos.';

  @override
  String get addStrengthBlock => 'Adicionar bloco de força';

  @override
  String get addBlockTitle => 'Adicionar bloco de treino';

  @override
  String get blockName => 'Nome do bloco';

  @override
  String get strength => 'Força';

  @override
  String get add => 'Adicionar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get addExercise => 'Exercício';

  @override
  String get exerciseName => 'Nome do exercício';

  @override
  String get exerciseHint => 'Agachamento livre';

  @override
  String get emptyBlockHelp => 'Adicione um exercício a este bloco.';

  @override
  String get loadExercisesError => 'Não foi possível carregar os exercícios.';

  @override
  String get addSet => 'Adicionar série';

  @override
  String get emptyExerciseHelp => 'Adicione uma série para registrar o treino.';

  @override
  String get loadSetsError => 'Não foi possível carregar as séries.';

  @override
  String get weightKg => 'Peso (kg)';

  @override
  String get reps => 'Repetições';

  @override
  String get save => 'Salvar';

  @override
  String setLabel(int number) {
    return 'Série $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps repetições';
  }

  @override
  String get invalidSet =>
      'Informe um peso válido e um número inteiro de repetições maior que zero.';

  @override
  String get bodyweight => 'Peso corporal';

  @override
  String get emptyBlocks =>
      'Ainda não há blocos de treino.\nAdicione um bloco de força para começar.';

  @override
  String get history => 'Histórico';

  @override
  String get emptyHistory => 'Ainda não há treinos registrados.';

  @override
  String get editSession => 'Editar sessão';

  @override
  String get sessionTitle => 'Título da sessão';

  @override
  String get sessionNotes => 'Notas (opcional)';

  @override
  String get deleteSession => 'Excluir sessão';

  @override
  String get confirmDeleteSession =>
      'Excluir esta sessão e todos os registros de treino? Esta ação não pode ser desfeita.';

  @override
  String get wodSectionTitle => 'WODs';

  @override
  String get addWodBlock => 'Adicionar WOD';

  @override
  String get wodName => 'Nome do WOD';

  @override
  String get addWodResult => 'Adicionar resultado';

  @override
  String get editWodResult => 'Editar resultado';

  @override
  String get wodResultType => 'Tipo de resultado';

  @override
  String get wodScore => 'Pontuação ou resultado';

  @override
  String get wodNotes => 'Notas do resultado';

  @override
  String get emptyWodBlocks =>
      'Ainda não há WODs. Adicione um para registrar um resultado.';

  @override
  String get emptyWodResult => 'Nenhum resultado registrado.';

  @override
  String get resultForTime => 'Por tempo';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => 'Rounds + repetições';

  @override
  String get resultLoad => 'Carga';

  @override
  String get resultOther => 'Outro';

  @override
  String get editSet => 'Editar série';

  @override
  String get deleteSet => 'Excluir série';

  @override
  String get confirmDeleteSet => 'Excluir esta série?';

  @override
  String get editBlock => 'Editar bloco';

  @override
  String get deleteBlock => 'Excluir bloco';

  @override
  String get confirmDeleteBlock =>
      'Excluir este bloco e todos os exercícios e séries? Não é possível desfazer.';

  @override
  String get editExercise => 'Editar exercício';

  @override
  String get deleteExercise => 'Excluir exercício';

  @override
  String get confirmDeleteExercise =>
      'Excluir este exercício e todas as séries? Não é possível desfazer.';

  @override
  String get progress => 'Progresso';

  @override
  String get todaySummary => 'Resumo de hoje';

  @override
  String get trainingOverview => 'Resumo do treino';

  @override
  String get sessionsLabel => 'sessões';

  @override
  String get setsLabel => 'séries';

  @override
  String movementCount(int count) {
    return '$count movimentos';
  }

  @override
  String get movementsLabel => 'movimentos';

  @override
  String setCount(int count) {
    return '$count séries';
  }

  @override
  String get weightedVolume => 'Volume com carga';

  @override
  String get volumeUnit => 'kg·repetições';

  @override
  String get bestLoadChange => 'Variação da carga máxima';

  @override
  String get volumeChange => 'Variação do volume';

  @override
  String get repChange => 'Variação das repetições';

  @override
  String get noProgressYet =>
      'Repita um exercício para comparar seu progresso.';

  @override
  String get previousWorkout => 'Anterior';

  @override
  String get lastWorkout => 'Mais recente';

  @override
  String get chooseDate => 'Escolher data do treino';

  @override
  String get allMovements => 'Todos';

  @override
  String get customExercise => 'Adicionar exercício personalizado';

  @override
  String get noMovementsFound => 'Nenhum movimento encontrado';

  @override
  String get noChange => 'Sem alterações';

  @override
  String get searchMovements => 'Buscar movimentos';

  @override
  String get benchmarkWorkouts => 'WODs de referência';

  @override
  String get movementTypes => 'Grupos de movimentos';

  @override
  String get last7Days => 'Últimos 7 dias';

  @override
  String get previous7Days => '7 dias anteriores';

  @override
  String get categoryBarbell => 'Barra';

  @override
  String get categoryGymnastics => 'Ginástica';

  @override
  String get categoryDumbbellKettlebell => 'Halter/kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Peso corporal';

  @override
  String get categoryOtherEquipment => 'Outro equipamento';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Treino de hoje';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Nenhum treino registrado hoje';

  @override
  String get emptyTodayHelp =>
      'Crie uma sessão para registrar o treino de hoje.';

  @override
  String get startWorkout => 'Iniciar treino';

  @override
  String get workoutLog => 'Registro de treino';

  @override
  String get loadWorkoutError => 'Não foi possível carregar os treinos.';

  @override
  String get loadBlocksError => 'Não foi possível carregar os blocos.';

  @override
  String get addStrengthBlock => 'Adicionar bloco de força';

  @override
  String get addBlockTitle => 'Adicionar bloco de treino';

  @override
  String get blockName => 'Nome do bloco';

  @override
  String get strength => 'Força';

  @override
  String get add => 'Adicionar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get addExercise => 'Exercício';

  @override
  String get exerciseName => 'Nome do exercício';

  @override
  String get exerciseHint => 'Agachamento livre';

  @override
  String get emptyBlockHelp => 'Adicione um exercício a este bloco.';

  @override
  String get loadExercisesError => 'Não foi possível carregar os exercícios.';

  @override
  String get addSet => 'Adicionar série';

  @override
  String get emptyExerciseHelp => 'Adicione uma série para registrar o treino.';

  @override
  String get loadSetsError => 'Não foi possível carregar as séries.';

  @override
  String get weightKg => 'Peso (kg)';

  @override
  String get reps => 'Repetições';

  @override
  String get save => 'Salvar';

  @override
  String setLabel(int number) {
    return 'Série $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps repetições';
  }

  @override
  String get invalidSet =>
      'Informe um peso válido e um número inteiro de repetições maior que zero.';

  @override
  String get bodyweight => 'Peso corporal';

  @override
  String get emptyBlocks =>
      'Ainda não há blocos de treino.\nAdicione um bloco de força para começar.';

  @override
  String get history => 'Histórico';

  @override
  String get emptyHistory => 'Ainda não há treinos registrados.';

  @override
  String get editSession => 'Editar sessão';

  @override
  String get sessionTitle => 'Título da sessão';

  @override
  String get sessionNotes => 'Notas (opcional)';

  @override
  String get deleteSession => 'Excluir sessão';

  @override
  String get confirmDeleteSession =>
      'Excluir esta sessão e todos os registros de treino? Esta ação não pode ser desfeita.';

  @override
  String get wodSectionTitle => 'WODs';

  @override
  String get addWodBlock => 'Adicionar WOD';

  @override
  String get wodName => 'Nome do WOD';

  @override
  String get addWodResult => 'Adicionar resultado';

  @override
  String get editWodResult => 'Editar resultado';

  @override
  String get wodResultType => 'Tipo de resultado';

  @override
  String get wodScore => 'Pontuação ou resultado';

  @override
  String get wodNotes => 'Notas do resultado';

  @override
  String get emptyWodBlocks =>
      'Ainda não há WODs. Adicione um para registrar um resultado.';

  @override
  String get emptyWodResult => 'Nenhum resultado registrado.';

  @override
  String get resultForTime => 'Por tempo';

  @override
  String get resultAmrap => 'AMRAP';

  @override
  String get resultEmom => 'EMOM';

  @override
  String get resultRoundsReps => 'Rounds + repetições';

  @override
  String get resultLoad => 'Carga';

  @override
  String get resultOther => 'Outro';

  @override
  String get editSet => 'Editar série';

  @override
  String get deleteSet => 'Excluir série';

  @override
  String get confirmDeleteSet => 'Excluir esta série?';

  @override
  String get editBlock => 'Editar bloco';

  @override
  String get deleteBlock => 'Excluir bloco';

  @override
  String get confirmDeleteBlock =>
      'Excluir este bloco e todos os exercícios e séries? Não é possível desfazer.';

  @override
  String get editExercise => 'Editar exercício';

  @override
  String get deleteExercise => 'Excluir exercício';

  @override
  String get confirmDeleteExercise =>
      'Excluir este exercício e todas as séries? Não é possível desfazer.';

  @override
  String get progress => 'Progresso';

  @override
  String get todaySummary => 'Resumo de hoje';

  @override
  String get trainingOverview => 'Resumo do treino';

  @override
  String get sessionsLabel => 'sessões';

  @override
  String get setsLabel => 'séries';

  @override
  String movementCount(int count) {
    return '$count movimentos';
  }

  @override
  String get movementsLabel => 'movimentos';

  @override
  String setCount(int count) {
    return '$count séries';
  }

  @override
  String get weightedVolume => 'Volume com carga';

  @override
  String get volumeUnit => 'kg·repetições';

  @override
  String get bestLoadChange => 'Variação da carga máxima';

  @override
  String get volumeChange => 'Variação do volume';

  @override
  String get repChange => 'Variação das repetições';

  @override
  String get noProgressYet =>
      'Repita um exercício para comparar seu progresso.';

  @override
  String get previousWorkout => 'Anterior';

  @override
  String get lastWorkout => 'Mais recente';

  @override
  String get chooseDate => 'Escolher data do treino';

  @override
  String get allMovements => 'Todos';

  @override
  String get customExercise => 'Adicionar exercício personalizado';

  @override
  String get noMovementsFound => 'Nenhum movimento encontrado';

  @override
  String get noChange => 'Sem alterações';

  @override
  String get searchMovements => 'Buscar movimentos';

  @override
  String get benchmarkWorkouts => 'WODs de referência';

  @override
  String get movementTypes => 'Grupos de movimentos';

  @override
  String get last7Days => 'Últimos 7 dias';

  @override
  String get previous7Days => '7 dias anteriores';

  @override
  String get categoryBarbell => 'Barra';

  @override
  String get categoryGymnastics => 'Ginástica';

  @override
  String get categoryDumbbellKettlebell => 'Halter/kettlebell';

  @override
  String get categoryCardio => 'Cardio';

  @override
  String get categoryBodyweight => 'Peso corporal';

  @override
  String get categoryOtherEquipment => 'Outro equipamento';
}
