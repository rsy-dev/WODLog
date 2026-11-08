// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Workout ngayong araw';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Wala pang workout na naitala ngayong araw';

  @override
  String get emptyTodayHelp =>
      'Gumawa ng session para maitala ang workout ngayong araw.';

  @override
  String get startWorkout => 'Simulan ang workout';

  @override
  String get workoutLog => 'Workout log';

  @override
  String get loadWorkoutError => 'Hindi ma-load ang mga workout record.';

  @override
  String get loadBlocksError => 'Hindi ma-load ang mga workout block.';

  @override
  String get addStrengthBlock => 'Magdagdag ng strength block';

  @override
  String get addBlockTitle => 'Magdagdag ng workout block';

  @override
  String get blockName => 'Pangalan ng block';

  @override
  String get strength => 'Strength';

  @override
  String get add => 'Idagdag';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get addExercise => 'Ehersisyo';

  @override
  String get exerciseName => 'Pangalan ng ehersisyo';

  @override
  String get exerciseHint => 'Back Squat';

  @override
  String get emptyBlockHelp => 'Magdagdag ng ehersisyo sa block na ito.';

  @override
  String get loadExercisesError => 'Hindi ma-load ang mga ehersisyo.';

  @override
  String get addSet => 'Magdagdag ng set';

  @override
  String get emptyExerciseHelp =>
      'Magdagdag ng set para maitala ang iyong workout.';

  @override
  String get loadSetsError => 'Hindi ma-load ang mga set.';

  @override
  String get weightKg => 'Bigat (kg)';

  @override
  String get reps => 'Mga ulit';

  @override
  String get save => 'I-save';

  @override
  String setLabel(int number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps ulit';
  }

  @override
  String get invalidSet =>
      'Maglagay ng wastong bigat at buong bilang ng mga ulit na higit sa zero.';

  @override
  String get bodyweight => 'Bigat ng katawan';

  @override
  String get emptyBlocks =>
      'Wala pang workout block.\nMagdagdag ng strength block para magsimulang magtala.';
}
