// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'আজকের ওয়ার্কআউট';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'আজকের কোনো ওয়ার্কআউট রেকর্ড নেই';

  @override
  String get emptyTodayHelp => 'আজকের ওয়ার্কআউট লিখতে একটি সেশন তৈরি করুন।';

  @override
  String get startWorkout => 'ওয়ার্কআউট শুরু করুন';

  @override
  String get workoutLog => 'ওয়ার্কআউট লগ';

  @override
  String get loadWorkoutError => 'ওয়ার্কআউট রেকর্ড লোড করা যায়নি।';

  @override
  String get loadBlocksError => 'ওয়ার্কআউট ব্লক লোড করা যায়নি।';

  @override
  String get addStrengthBlock => 'স্ট্রেংথ ব্লক যোগ করুন';

  @override
  String get addBlockTitle => 'ওয়ার্কআউট ব্লক যোগ করুন';

  @override
  String get blockName => 'ব্লকের নাম';

  @override
  String get strength => 'স্ট্রেংথ';

  @override
  String get add => 'যোগ করুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get addExercise => 'ব্যায়াম';

  @override
  String get exerciseName => 'ব্যায়ামের নাম';

  @override
  String get exerciseHint => 'ব্যাক স্কোয়াট';

  @override
  String get emptyBlockHelp => 'এই ব্লকে একটি ব্যায়াম যোগ করুন।';

  @override
  String get loadExercisesError => 'ব্যায়াম লোড করা যায়নি।';

  @override
  String get addSet => 'সেট যোগ করুন';

  @override
  String get emptyExerciseHelp => 'আপনার অনুশীলন লিখতে একটি সেট যোগ করুন।';

  @override
  String get loadSetsError => 'সেট লোড করা যায়নি।';

  @override
  String get weightKg => 'ওজন (কেজি)';

  @override
  String get reps => 'পুনরাবৃত্তি';

  @override
  String get save => 'সংরক্ষণ';

  @override
  String setLabel(int number) {
    return 'সেট $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight কেজি × $reps বার';
  }

  @override
  String get invalidSet =>
      'সঠিক ওজন এবং শূন্যের বেশি পূর্ণসংখ্যা পুনরাবৃত্তি লিখুন।';

  @override
  String get bodyweight => 'শরীরের ওজন';

  @override
  String get emptyBlocks =>
      'এখনও কোনো ওয়ার্কআউট ব্লক নেই।\nশুরু করতে একটি স্ট্রেংথ ব্লক যোগ করুন।';
}
