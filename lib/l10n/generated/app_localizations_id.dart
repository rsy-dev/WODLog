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
  String get weightKg => 'Beban (kg)';

  @override
  String get reps => 'Repetisi';

  @override
  String get save => 'Simpan';

  @override
  String setLabel(int number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps repetisi';
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
  String setCount(int count) {
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
}
