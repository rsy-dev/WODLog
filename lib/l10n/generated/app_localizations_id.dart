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
}
