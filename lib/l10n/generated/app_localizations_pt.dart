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
  String setWeight(String unit) {
    return 'Peso ($unit)';
  }

  @override
  String get reps => 'Repetições';

  @override
  String get save => 'Salvar';

  @override
  String setLabel(String number) {
    return 'Série $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps repetições';
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
  String setCount(String count) {
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

  @override
  String get settings => 'Configurações';

  @override
  String get weightUnit => 'Unidade de peso';

  @override
  String get weightUnitError => 'Não foi possível salvar a unidade de peso.';

  @override
  String get categoryBenchmarkWod => 'WODs de referência';

  @override
  String get noRecentMovementRecords =>
      'Não há movimentos registrados nos últimos 14 dias.';

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
  String setWeight(String unit) {
    return 'Peso ($unit)';
  }

  @override
  String get reps => 'Repetições';

  @override
  String get save => 'Salvar';

  @override
  String setLabel(String number) {
    return 'Série $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps repetições';
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
  String setCount(String count) {
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

  @override
  String get settings => 'Configurações';

  @override
  String get weightUnit => 'Unidade de peso';

  @override
  String get weightUnitError => 'Não foi possível salvar a unidade de peso.';

  @override
  String get categoryBenchmarkWod => 'WODs de referência';

  @override
  String get noRecentMovementRecords =>
      'Não há movimentos registrados nos últimos 14 dias.';
}
