import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fil'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'WODLog'**
  String get appTitle;

  /// No description provided for @todayWorkout.
  ///
  /// In en, this message translates to:
  /// **'Today\'s workout'**
  String get todayWorkout;

  /// No description provided for @workoutDate.
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String workoutDate(String date);

  /// No description provided for @noRecords.
  ///
  /// In en, this message translates to:
  /// **'No workout recorded today'**
  String get noRecords;

  /// No description provided for @emptyTodayHelp.
  ///
  /// In en, this message translates to:
  /// **'Start a session to log today\'s workout.'**
  String get emptyTodayHelp;

  /// No description provided for @startWorkout.
  ///
  /// In en, this message translates to:
  /// **'Start workout'**
  String get startWorkout;

  /// No description provided for @workoutLog.
  ///
  /// In en, this message translates to:
  /// **'Workout log'**
  String get workoutLog;

  /// No description provided for @loadWorkoutError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load workout records.'**
  String get loadWorkoutError;

  /// No description provided for @loadBlocksError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load workout blocks.'**
  String get loadBlocksError;

  /// No description provided for @addStrengthBlock.
  ///
  /// In en, this message translates to:
  /// **'Add strength block'**
  String get addStrengthBlock;

  /// No description provided for @addBlockTitle.
  ///
  /// In en, this message translates to:
  /// **'Add workout block'**
  String get addBlockTitle;

  /// No description provided for @blockName.
  ///
  /// In en, this message translates to:
  /// **'Block name'**
  String get blockName;

  /// No description provided for @strength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get strength;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @addExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get addExercise;

  /// No description provided for @exerciseName.
  ///
  /// In en, this message translates to:
  /// **'Exercise name'**
  String get exerciseName;

  /// No description provided for @exerciseHint.
  ///
  /// In en, this message translates to:
  /// **'Back Squat'**
  String get exerciseHint;

  /// No description provided for @emptyBlockHelp.
  ///
  /// In en, this message translates to:
  /// **'Add an exercise to this block.'**
  String get emptyBlockHelp;

  /// No description provided for @loadExercisesError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load exercises.'**
  String get loadExercisesError;

  /// No description provided for @addSet.
  ///
  /// In en, this message translates to:
  /// **'Add set'**
  String get addSet;

  /// No description provided for @emptyExerciseHelp.
  ///
  /// In en, this message translates to:
  /// **'Add a set to record your work.'**
  String get emptyExerciseHelp;

  /// No description provided for @loadSetsError.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load sets.'**
  String get loadSetsError;

  /// No description provided for @setWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight ({unit})'**
  String setWeight(String unit);

  /// No description provided for @reps.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get reps;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @setLabel.
  ///
  /// In en, this message translates to:
  /// **'Set {number}'**
  String setLabel(String number);

  /// No description provided for @setSummary.
  ///
  /// In en, this message translates to:
  /// **'{setLabel}  {weight} × {reps} reps'**
  String setSummary(String setLabel, String weight, String reps);

  /// No description provided for @invalidSet.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid weight and a whole number of reps greater than zero.'**
  String get invalidSet;

  /// No description provided for @bodyweight.
  ///
  /// In en, this message translates to:
  /// **'Bodyweight'**
  String get bodyweight;

  /// No description provided for @emptyBlocks.
  ///
  /// In en, this message translates to:
  /// **'No workout blocks yet.\nAdd a Strength block to start logging.'**
  String get emptyBlocks;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @emptyHistory.
  ///
  /// In en, this message translates to:
  /// **'No workouts recorded yet.'**
  String get emptyHistory;

  /// No description provided for @editSession.
  ///
  /// In en, this message translates to:
  /// **'Edit session'**
  String get editSession;

  /// No description provided for @sessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Session title'**
  String get sessionTitle;

  /// No description provided for @sessionNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get sessionNotes;

  /// No description provided for @deleteSession.
  ///
  /// In en, this message translates to:
  /// **'Delete session'**
  String get deleteSession;

  /// No description provided for @confirmDeleteSession.
  ///
  /// In en, this message translates to:
  /// **'Delete this session and all of its workout records? This cannot be undone.'**
  String get confirmDeleteSession;

  /// No description provided for @wodSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'WODs'**
  String get wodSectionTitle;

  /// No description provided for @addWodBlock.
  ///
  /// In en, this message translates to:
  /// **'Add WOD'**
  String get addWodBlock;

  /// No description provided for @wodName.
  ///
  /// In en, this message translates to:
  /// **'WOD name'**
  String get wodName;

  /// No description provided for @addWodResult.
  ///
  /// In en, this message translates to:
  /// **'Add result'**
  String get addWodResult;

  /// No description provided for @editWodResult.
  ///
  /// In en, this message translates to:
  /// **'Edit result'**
  String get editWodResult;

  /// No description provided for @wodResultType.
  ///
  /// In en, this message translates to:
  /// **'Result type'**
  String get wodResultType;

  /// No description provided for @wodScore.
  ///
  /// In en, this message translates to:
  /// **'Score or result'**
  String get wodScore;

  /// No description provided for @wodNotes.
  ///
  /// In en, this message translates to:
  /// **'Result notes'**
  String get wodNotes;

  /// No description provided for @emptyWodBlocks.
  ///
  /// In en, this message translates to:
  /// **'No WODs yet. Add one to log a result.'**
  String get emptyWodBlocks;

  /// No description provided for @emptyWodResult.
  ///
  /// In en, this message translates to:
  /// **'No result recorded.'**
  String get emptyWodResult;

  /// No description provided for @resultForTime.
  ///
  /// In en, this message translates to:
  /// **'For time'**
  String get resultForTime;

  /// No description provided for @resultAmrap.
  ///
  /// In en, this message translates to:
  /// **'AMRAP'**
  String get resultAmrap;

  /// No description provided for @resultEmom.
  ///
  /// In en, this message translates to:
  /// **'EMOM'**
  String get resultEmom;

  /// No description provided for @resultRoundsReps.
  ///
  /// In en, this message translates to:
  /// **'Rounds + reps'**
  String get resultRoundsReps;

  /// No description provided for @resultLoad.
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get resultLoad;

  /// No description provided for @resultOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get resultOther;

  /// No description provided for @editSet.
  ///
  /// In en, this message translates to:
  /// **'Edit set'**
  String get editSet;

  /// No description provided for @deleteSet.
  ///
  /// In en, this message translates to:
  /// **'Delete set'**
  String get deleteSet;

  /// No description provided for @confirmDeleteSet.
  ///
  /// In en, this message translates to:
  /// **'Delete this set?'**
  String get confirmDeleteSet;

  /// No description provided for @editBlock.
  ///
  /// In en, this message translates to:
  /// **'Edit block'**
  String get editBlock;

  /// No description provided for @deleteBlock.
  ///
  /// In en, this message translates to:
  /// **'Delete block'**
  String get deleteBlock;

  /// No description provided for @confirmDeleteBlock.
  ///
  /// In en, this message translates to:
  /// **'Delete this block and all its exercises and sets? This cannot be undone.'**
  String get confirmDeleteBlock;

  /// No description provided for @editExercise.
  ///
  /// In en, this message translates to:
  /// **'Edit exercise'**
  String get editExercise;

  /// No description provided for @deleteExercise.
  ///
  /// In en, this message translates to:
  /// **'Delete exercise'**
  String get deleteExercise;

  /// No description provided for @confirmDeleteExercise.
  ///
  /// In en, this message translates to:
  /// **'Delete this exercise and all its sets? This cannot be undone.'**
  String get confirmDeleteExercise;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @todaySummary.
  ///
  /// In en, this message translates to:
  /// **'Today at a glance'**
  String get todaySummary;

  /// No description provided for @trainingOverview.
  ///
  /// In en, this message translates to:
  /// **'Training overview'**
  String get trainingOverview;

  /// No description provided for @sessionsLabel.
  ///
  /// In en, this message translates to:
  /// **'sessions'**
  String get sessionsLabel;

  /// No description provided for @setsLabel.
  ///
  /// In en, this message translates to:
  /// **'sets'**
  String get setsLabel;

  /// No description provided for @movementCount.
  ///
  /// In en, this message translates to:
  /// **'{count} movements'**
  String movementCount(int count);

  /// No description provided for @movementsLabel.
  ///
  /// In en, this message translates to:
  /// **'movements'**
  String get movementsLabel;

  /// No description provided for @setCount.
  ///
  /// In en, this message translates to:
  /// **'{count} sets'**
  String setCount(String count);

  /// No description provided for @weightedVolume.
  ///
  /// In en, this message translates to:
  /// **'Weighted volume'**
  String get weightedVolume;

  /// No description provided for @volumeUnit.
  ///
  /// In en, this message translates to:
  /// **'kg·reps'**
  String get volumeUnit;

  /// No description provided for @bestLoadChange.
  ///
  /// In en, this message translates to:
  /// **'Best load change'**
  String get bestLoadChange;

  /// No description provided for @volumeChange.
  ///
  /// In en, this message translates to:
  /// **'Volume change'**
  String get volumeChange;

  /// No description provided for @repChange.
  ///
  /// In en, this message translates to:
  /// **'Rep change'**
  String get repChange;

  /// No description provided for @noProgressYet.
  ///
  /// In en, this message translates to:
  /// **'Repeat an exercise to see how your record changes.'**
  String get noProgressYet;

  /// No description provided for @previousWorkout.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previousWorkout;

  /// No description provided for @lastWorkout.
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get lastWorkout;

  /// No description provided for @chooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose workout date'**
  String get chooseDate;

  /// No description provided for @allMovements.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allMovements;

  /// No description provided for @customExercise.
  ///
  /// In en, this message translates to:
  /// **'Add a custom exercise'**
  String get customExercise;

  /// No description provided for @noMovementsFound.
  ///
  /// In en, this message translates to:
  /// **'No movements found'**
  String get noMovementsFound;

  /// No description provided for @noChange.
  ///
  /// In en, this message translates to:
  /// **'No change'**
  String get noChange;

  /// No description provided for @searchMovements.
  ///
  /// In en, this message translates to:
  /// **'Search movements'**
  String get searchMovements;

  /// No description provided for @benchmarkWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Benchmark WODs'**
  String get benchmarkWorkouts;

  /// No description provided for @movementTypes.
  ///
  /// In en, this message translates to:
  /// **'Similar movement types'**
  String get movementTypes;

  /// No description provided for @last7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get last7Days;

  /// No description provided for @previous7Days.
  ///
  /// In en, this message translates to:
  /// **'Previous 7 days'**
  String get previous7Days;

  /// No description provided for @categoryBarbell.
  ///
  /// In en, this message translates to:
  /// **'Barbell'**
  String get categoryBarbell;

  /// No description provided for @categoryGymnastics.
  ///
  /// In en, this message translates to:
  /// **'Gymnastics'**
  String get categoryGymnastics;

  /// No description provided for @categoryDumbbellKettlebell.
  ///
  /// In en, this message translates to:
  /// **'Dumbbell & kettlebell'**
  String get categoryDumbbellKettlebell;

  /// No description provided for @categoryCardio.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get categoryCardio;

  /// No description provided for @categoryBodyweight.
  ///
  /// In en, this message translates to:
  /// **'Bodyweight'**
  String get categoryBodyweight;

  /// No description provided for @categoryOtherEquipment.
  ///
  /// In en, this message translates to:
  /// **'Other equipment'**
  String get categoryOtherEquipment;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @weightUnit.
  ///
  /// In en, this message translates to:
  /// **'Weight unit'**
  String get weightUnit;

  /// No description provided for @weightUnitError.
  ///
  /// In en, this message translates to:
  /// **'Could not save the weight unit.'**
  String get weightUnitError;

  /// No description provided for @categoryBenchmarkWod.
  ///
  /// In en, this message translates to:
  /// **'Benchmark WODs'**
  String get categoryBenchmarkWod;

  /// No description provided for @noRecentMovementRecords.
  ///
  /// In en, this message translates to:
  /// **'No movement records in the last 14 days.'**
  String get noRecentMovementRecords;

  /// No description provided for @todayTab.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayTab;

  /// No description provided for @recordWod.
  ///
  /// In en, this message translates to:
  /// **'Record WOD'**
  String get recordWod;

  /// No description provided for @languageSetting.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSetting;

  /// No description provided for @deviceLanguage.
  ///
  /// In en, this message translates to:
  /// **'Device language'**
  String get deviceLanguage;

  /// No description provided for @weeklyGoal.
  ///
  /// In en, this message translates to:
  /// **'Weekly goal'**
  String get weeklyGoal;

  /// No description provided for @weightCalculator.
  ///
  /// In en, this message translates to:
  /// **'Weight calculator'**
  String get weightCalculator;

  /// No description provided for @movementLibrary.
  ///
  /// In en, this message translates to:
  /// **'Movement library'**
  String get movementLibrary;

  /// No description provided for @glossary.
  ///
  /// In en, this message translates to:
  /// **'Glossary'**
  String get glossary;

  /// No description provided for @lastSevenDays.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get lastSevenDays;

  /// No description provided for @pastWods.
  ///
  /// In en, this message translates to:
  /// **'Past WODs'**
  String get pastWods;

  /// No description provided for @strengthSessions.
  ///
  /// In en, this message translates to:
  /// **'Strength sessions'**
  String get strengthSessions;

  /// No description provided for @chooseBenchmark.
  ///
  /// In en, this message translates to:
  /// **'Choose a benchmark'**
  String get chooseBenchmark;

  /// No description provided for @searchWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Search workouts'**
  String get searchWorkouts;

  /// No description provided for @noMatchingWorkouts.
  ///
  /// In en, this message translates to:
  /// **'No matching workouts'**
  String get noMatchingWorkouts;

  /// No description provided for @settingsSaveError.
  ///
  /// In en, this message translates to:
  /// **'Could not save the setting. Try again.'**
  String get settingsSaveError;

  /// No description provided for @openSession.
  ///
  /// In en, this message translates to:
  /// **'Open session'**
  String get openSession;

  /// No description provided for @reviewWodText.
  ///
  /// In en, this message translates to:
  /// **'Review WOD text'**
  String get reviewWodText;

  /// No description provided for @wodSourceText.
  ///
  /// In en, this message translates to:
  /// **'Workout text'**
  String get wodSourceText;

  /// No description provided for @unreadWodLines.
  ///
  /// In en, this message translates to:
  /// **'Lines to review'**
  String get unreadWodLines;

  /// No description provided for @wodPrescription.
  ///
  /// In en, this message translates to:
  /// **'Prescription'**
  String get wodPrescription;

  /// No description provided for @closeSheet.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeSheet;

  /// No description provided for @glossaryAmrap.
  ///
  /// In en, this message translates to:
  /// **'Complete as many rounds or reps as possible in the time limit.'**
  String get glossaryAmrap;

  /// No description provided for @glossaryEmom.
  ///
  /// In en, this message translates to:
  /// **'Start the prescribed work at the start of each minute.'**
  String get glossaryEmom;

  /// No description provided for @glossaryForTime.
  ///
  /// In en, this message translates to:
  /// **'Record completion time or completed reps at the cap.'**
  String get glossaryForTime;

  /// No description provided for @glossaryRx.
  ///
  /// In en, this message translates to:
  /// **'Perform the workout as prescribed.'**
  String get glossaryRx;

  /// No description provided for @glossaryScaled.
  ///
  /// In en, this message translates to:
  /// **'Adjust the load, movement, or volume.'**
  String get glossaryScaled;

  /// No description provided for @wodSaveError.
  ///
  /// In en, this message translates to:
  /// **'Could not save the WOD result. Try again.'**
  String get wodSaveError;

  /// No description provided for @applyWodSource.
  ///
  /// In en, this message translates to:
  /// **'Apply to notes'**
  String get applyWodSource;

  /// No description provided for @statsTab.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get statsTab;

  /// No description provided for @wodFinished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get wodFinished;

  /// No description provided for @wodCapped.
  ///
  /// In en, this message translates to:
  /// **'Time cap'**
  String get wodCapped;

  /// No description provided for @wodStopped.
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get wodStopped;

  /// No description provided for @wodEnding.
  ///
  /// In en, this message translates to:
  /// **'Finish status'**
  String get wodEnding;

  /// No description provided for @wodFinishTime.
  ///
  /// In en, this message translates to:
  /// **'Finish time (min:sec)'**
  String get wodFinishTime;

  /// No description provided for @wodCompletedReps.
  ///
  /// In en, this message translates to:
  /// **'Reps completed at the cap'**
  String get wodCompletedReps;

  /// No description provided for @wodCompletedRounds.
  ///
  /// In en, this message translates to:
  /// **'Completed rounds'**
  String get wodCompletedRounds;

  /// No description provided for @wodCompletedIntervals.
  ///
  /// In en, this message translates to:
  /// **'Completed intervals'**
  String get wodCompletedIntervals;

  /// No description provided for @wodExtraReps.
  ///
  /// In en, this message translates to:
  /// **'Extra reps'**
  String get wodExtraReps;

  /// No description provided for @wodEnterNewScore.
  ///
  /// In en, this message translates to:
  /// **'Enter a new score'**
  String get wodEnterNewScore;

  /// No description provided for @wodInvalidScore.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid result for this workout type.'**
  String get wodInvalidScore;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fil',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'th',
    'tr',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
