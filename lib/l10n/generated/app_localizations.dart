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

  /// No description provided for @weightKg.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weightKg;

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
  String setLabel(int number);

  /// No description provided for @setSummary.
  ///
  /// In en, this message translates to:
  /// **'{setLabel}  {weight} kg × {reps} reps'**
  String setSummary(String setLabel, String weight, int reps);

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
