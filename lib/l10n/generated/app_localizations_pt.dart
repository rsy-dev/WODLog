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
}
