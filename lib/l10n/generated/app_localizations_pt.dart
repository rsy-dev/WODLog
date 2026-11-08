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
}
