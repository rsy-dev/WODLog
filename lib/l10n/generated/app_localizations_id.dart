// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Latihan hari ini';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Belum ada latihan yang dicatat hari ini';

  @override
  String get emptyTodayHelp => 'Buat sesi untuk mencatat latihan hari ini.';

  @override
  String get startWorkout => 'Mulai latihan';

  @override
  String get workoutLog => 'Catatan latihan';

  @override
  String get loadWorkoutError => 'Catatan latihan tidak dapat dimuat.';

  @override
  String get loadBlocksError => 'Blok latihan tidak dapat dimuat.';

  @override
  String get addStrengthBlock => 'Tambah blok strength';

  @override
  String get addBlockTitle => 'Tambah blok latihan';

  @override
  String get blockName => 'Nama blok';

  @override
  String get strength => 'Strength';

  @override
  String get add => 'Tambah';

  @override
  String get cancel => 'Batal';

  @override
  String get addExercise => 'Gerakan';

  @override
  String get exerciseName => 'Nama gerakan';

  @override
  String get exerciseHint => 'Back Squat';

  @override
  String get emptyBlockHelp => 'Tambahkan gerakan ke blok ini.';

  @override
  String get loadExercisesError => 'Gerakan tidak dapat dimuat.';

  @override
  String get addSet => 'Tambah set';

  @override
  String get emptyExerciseHelp => 'Tambahkan set untuk mencatat latihan.';

  @override
  String get loadSetsError => 'Set tidak dapat dimuat.';

  @override
  String setWeight(String unit) {
    return 'Beban ($unit)';
  }

  @override
  String get reps => 'Repetisi';

  @override
  String get save => 'Simpan';

  @override
  String setLabel(String number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps repetisi';
  }

  @override
  String get invalidSet =>
      'Masukkan beban yang valid dan jumlah repetisi bilangan bulat lebih dari nol.';

  @override
  String get bodyweight => 'Berat badan';

  @override
  String get emptyBlocks =>
      'Belum ada blok latihan.\nTambahkan blok strength untuk mulai mencatat.';

  @override
  String get history => 'Riwayat';

  @override
  String get emptyHistory => 'Belum ada latihan yang dicatat.';

  @override
  String get editSession => 'Edit sesi';

  @override
  String get sessionTitle => 'Judul sesi';

  @override
  String get sessionNotes => 'Catatan (opsional)';

  @override
  String get deleteSession => 'Hapus sesi';

  @override
  String get confirmDeleteSession =>
      'Hapus sesi ini dan semua catatan latihannya? Tindakan ini tidak dapat dibatalkan.';

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
  String get editSet => 'Edit set';

  @override
  String get deleteSet => 'Hapus set';

  @override
  String get confirmDeleteSet => 'Hapus set ini?';

  @override
  String get editBlock => 'Edit blok';

  @override
  String get deleteBlock => 'Hapus blok';

  @override
  String get confirmDeleteBlock =>
      'Hapus blok ini beserta semua latihan dan set-nya? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get editExercise => 'Edit latihan';

  @override
  String get deleteExercise => 'Hapus latihan';

  @override
  String get confirmDeleteExercise =>
      'Hapus latihan ini beserta semua set-nya? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get progress => 'Progres';

  @override
  String get todaySummary => 'Ringkasan hari ini';

  @override
  String get trainingOverview => 'Ringkasan latihan';

  @override
  String get sessionsLabel => 'sesi';

  @override
  String get setsLabel => 'set';

  @override
  String movementCount(int count) {
    return '$count gerakan';
  }

  @override
  String get movementsLabel => 'gerakan';

  @override
  String setCount(String count) {
    return '$count set';
  }

  @override
  String get weightedVolume => 'Volume berbeban';

  @override
  String get volumeUnit => 'kg·repetisi';

  @override
  String get bestLoadChange => 'Perubahan beban terbaik';

  @override
  String get volumeChange => 'Perubahan volume';

  @override
  String get repChange => 'Perubahan repetisi';

  @override
  String get noProgressYet => 'Ulangi latihan untuk membandingkan progres.';

  @override
  String get previousWorkout => 'Sebelumnya';

  @override
  String get lastWorkout => 'Terbaru';

  @override
  String get chooseDate => 'Pilih tanggal latihan';

  @override
  String get allMovements => 'Semua';

  @override
  String get customExercise => 'Tambah latihan khusus';

  @override
  String get noMovementsFound => 'Gerakan tidak ditemukan';

  @override
  String get noChange => 'Tidak ada perubahan';

  @override
  String get searchMovements => 'Cari gerakan';

  @override
  String get benchmarkWorkouts => 'WOD tolok ukur';

  @override
  String get movementTypes => 'Kelompok gerakan';

  @override
  String get last7Days => '7 hari terakhir';

  @override
  String get previous7Days => '7 hari sebelumnya';

  @override
  String get categoryBarbell => 'Barbel';

  @override
  String get categoryGymnastics => 'Gimnastik';

  @override
  String get categoryDumbbellKettlebell => 'Dumbel/Kettlebell';

  @override
  String get categoryCardio => 'Kardio';

  @override
  String get categoryBodyweight => 'Berat badan';

  @override
  String get categoryOtherEquipment => 'Peralatan lain';

  @override
  String get settings => 'Pengaturan';

  @override
  String get weightUnit => 'Satuan beban';

  @override
  String get weightUnitError => 'Satuan beban tidak dapat disimpan.';

  @override
  String get categoryBenchmarkWod => 'WOD tolok ukur';

  @override
  String get noRecentMovementRecords =>
      'Tidak ada catatan gerakan dalam 14 hari terakhir.';

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
