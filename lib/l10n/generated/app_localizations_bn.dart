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

  @override
  String get history => 'ইতিহাস';

  @override
  String get emptyHistory => 'এখনও কোনো ওয়ার্কআউট রেকর্ড নেই।';

  @override
  String get editSession => 'সেশন সম্পাদনা';

  @override
  String get sessionTitle => 'সেশনের শিরোনাম';

  @override
  String get sessionNotes => 'নোট (ঐচ্ছিক)';

  @override
  String get deleteSession => 'সেশন মুছুন';

  @override
  String get confirmDeleteSession =>
      'এই সেশন এবং এর সব ওয়ার্কআউট রেকর্ড মুছবেন? এটি ফিরিয়ে আনা যাবে না।';

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
  String get editSet => 'সেট সম্পাদনা করুন';

  @override
  String get deleteSet => 'সেট মুছুন';

  @override
  String get confirmDeleteSet => 'এই সেটটি মুছবেন?';

  @override
  String get editBlock => 'ব্লক সম্পাদনা';

  @override
  String get deleteBlock => 'ব্লক মুছুন';

  @override
  String get confirmDeleteBlock =>
      'এই ব্লক, এর সব ব্যায়াম ও সেট মুছে ফেলবেন? এটি ফিরিয়ে আনা যাবে না।';

  @override
  String get editExercise => 'ব্যায়াম সম্পাদনা';

  @override
  String get deleteExercise => 'ব্যায়াম মুছুন';

  @override
  String get confirmDeleteExercise =>
      'এই ব্যায়াম ও এর সব সেট মুছে ফেলবেন? এটি ফিরিয়ে আনা যাবে না।';

  @override
  String get progress => 'অগ্রগতি';

  @override
  String get todaySummary => 'আজকের সারাংশ';

  @override
  String get trainingOverview => 'প্রশিক্ষণের সারাংশ';

  @override
  String get sessionsLabel => 'সেশন';

  @override
  String get setsLabel => 'সেট';

  @override
  String movementCount(int count) {
    return '$countটি মুভমেন্ট';
  }

  @override
  String get movementsLabel => 'মুভমেন্ট';

  @override
  String setCount(int count) {
    return '$countটি সেট';
  }

  @override
  String get weightedVolume => 'ওজনসহ মোট ভলিউম';

  @override
  String get volumeUnit => 'কেজি·রেপ';

  @override
  String get bestLoadChange => 'সর্বোচ্চ ওজনের পরিবর্তন';

  @override
  String get volumeChange => 'ভলিউমের পরিবর্তন';

  @override
  String get repChange => 'রেপের পরিবর্তন';

  @override
  String get noProgressYet =>
      'একই ব্যায়াম আবার করলে আগের রেকর্ডের সঙ্গে তুলনা দেখতে পাবেন।';

  @override
  String get previousWorkout => 'আগের';

  @override
  String get lastWorkout => 'সর্বশেষ';

  @override
  String get chooseDate => 'ওয়ার্কআউটের তারিখ বেছে নিন';

  @override
  String get allMovements => 'সব';

  @override
  String get customExercise => 'নিজের ব্যায়াম যোগ করুন';

  @override
  String get noMovementsFound => 'কোনো মুভমেন্ট পাওয়া যায়নি';

  @override
  String get noChange => 'কোনো পরিবর্তন নেই';

  @override
  String get searchMovements => 'মুভমেন্ট খুঁজুন';

  @override
  String get benchmarkWorkouts => 'বেঞ্চমার্ক WOD';

  @override
  String get movementTypes => 'মুভমেন্টের ধরন';

  @override
  String get last7Days => 'গত ৭ দিন';

  @override
  String get previous7Days => 'তার আগের ৭ দিন';

  @override
  String get categoryBarbell => 'বারবেল';

  @override
  String get categoryGymnastics => 'জিমন্যাস্টিকস';

  @override
  String get categoryDumbbellKettlebell => 'ডাম্বেল/কেটলবেল';

  @override
  String get categoryCardio => 'কার্ডিও';

  @override
  String get categoryBodyweight => 'শরীরের ওজন';

  @override
  String get categoryOtherEquipment => 'অন্যান্য সরঞ্জাম';
}
