// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'WODLog';

  @override
  String get todayWorkout => 'Bugünkü antrenman';

  @override
  String workoutDate(String date) {
    return '$date';
  }

  @override
  String get noRecords => 'Bugün henüz antrenman kaydı yok';

  @override
  String get emptyTodayHelp =>
      'Bugünkü antrenmanı kaydetmek için bir oturum oluşturun.';

  @override
  String get startWorkout => 'Antrenmana başla';

  @override
  String get workoutLog => 'Antrenman kaydı';

  @override
  String get loadWorkoutError => 'Antrenman kayıtları yüklenemedi.';

  @override
  String get loadBlocksError => 'Antrenman blokları yüklenemedi.';

  @override
  String get addStrengthBlock => 'Kuvvet bloğu ekle';

  @override
  String get addBlockTitle => 'Antrenman bloğu ekle';

  @override
  String get blockName => 'Blok adı';

  @override
  String get strength => 'Kuvvet';

  @override
  String get add => 'Ekle';

  @override
  String get cancel => 'İptal';

  @override
  String get addExercise => 'Egzersiz';

  @override
  String get exerciseName => 'Egzersiz adı';

  @override
  String get exerciseHint => 'Back Squat';

  @override
  String get emptyBlockHelp => 'Bu bloğa bir egzersiz ekleyin.';

  @override
  String get loadExercisesError => 'Egzersizler yüklenemedi.';

  @override
  String get addSet => 'Set ekle';

  @override
  String get emptyExerciseHelp =>
      'Antrenmanınızı kaydetmek için bir set ekleyin.';

  @override
  String get loadSetsError => 'Setler yüklenemedi.';

  @override
  String setWeight(String unit) {
    return 'Ağırlık ($unit)';
  }

  @override
  String get reps => 'Tekrar';

  @override
  String get save => 'Kaydet';

  @override
  String setLabel(String number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, String reps) {
    return '$setLabel  $weight × $reps tekrar';
  }

  @override
  String get invalidSet =>
      'Geçerli bir ağırlık ve sıfırdan büyük tam sayı tekrar girin.';

  @override
  String get bodyweight => 'Vücut ağırlığı';

  @override
  String get emptyBlocks =>
      'Henüz antrenman bloğu yok.\nKayda başlamak için bir kuvvet bloğu ekleyin.';

  @override
  String get history => 'Geçmiş';

  @override
  String get emptyHistory => 'Henüz antrenman kaydı yok.';

  @override
  String get editSession => 'Oturumu düzenle';

  @override
  String get sessionTitle => 'Oturum başlığı';

  @override
  String get sessionNotes => 'Notlar (isteğe bağlı)';

  @override
  String get deleteSession => 'Oturumu sil';

  @override
  String get confirmDeleteSession =>
      'Bu oturum ve tüm antrenman kayıtları silinsin mi? Bu işlem geri alınamaz.';

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
  String get editSet => 'Seti düzenle';

  @override
  String get deleteSet => 'Seti sil';

  @override
  String get confirmDeleteSet => 'Bu set silinsin mi?';

  @override
  String get editBlock => 'Bloğu düzenle';

  @override
  String get deleteBlock => 'Bloğu sil';

  @override
  String get confirmDeleteBlock =>
      'Bu bloğu ve tüm hareketlerini ve setlerini silmek istiyor musunuz? Bu işlem geri alınamaz.';

  @override
  String get editExercise => 'Hareketi düzenle';

  @override
  String get deleteExercise => 'Hareketi sil';

  @override
  String get confirmDeleteExercise =>
      'Bu hareketi ve tüm setlerini silmek istiyor musunuz? Bu işlem geri alınamaz.';

  @override
  String get progress => 'İlerleme';

  @override
  String get todaySummary => 'Bugünün özeti';

  @override
  String get trainingOverview => 'Antrenman özeti';

  @override
  String get sessionsLabel => 'antrenman';

  @override
  String get setsLabel => 'set';

  @override
  String movementCount(int count) {
    return '$count hareket';
  }

  @override
  String get movementsLabel => 'hareket';

  @override
  String setCount(String count) {
    return '$count set';
  }

  @override
  String get weightedVolume => 'Ağırlıklı hacim';

  @override
  String get volumeUnit => 'kg·tekrar';

  @override
  String get bestLoadChange => 'En yüksek yük değişimi';

  @override
  String get volumeChange => 'Hacim değişimi';

  @override
  String get repChange => 'Tekrar değişimi';

  @override
  String get noProgressYet =>
      'İlerlemeni karşılaştırmak için aynı hareketi tekrar kaydet.';

  @override
  String get previousWorkout => 'Önceki';

  @override
  String get lastWorkout => 'Son';

  @override
  String get chooseDate => 'Antrenman tarihini seç';

  @override
  String get allMovements => 'Tümü';

  @override
  String get customExercise => 'Özel hareket ekle';

  @override
  String get noMovementsFound => 'Hareket bulunamadı';

  @override
  String get noChange => 'Değişiklik yok';

  @override
  String get searchMovements => 'Hareket ara';

  @override
  String get benchmarkWorkouts => 'Kıyaslama WOD’ları';

  @override
  String get movementTypes => 'Hareket grupları';

  @override
  String get last7Days => 'Son 7 gün';

  @override
  String get previous7Days => 'Önceki 7 gün';

  @override
  String get categoryBarbell => 'Barbell';

  @override
  String get categoryGymnastics => 'Jimnastik';

  @override
  String get categoryDumbbellKettlebell => 'Dambıl/Kettlebell';

  @override
  String get categoryCardio => 'Kardiyo';

  @override
  String get categoryBodyweight => 'Vücut ağırlığı';

  @override
  String get categoryOtherEquipment => 'Diğer ekipman';

  @override
  String get settings => 'Ayarlar';

  @override
  String get weightUnit => 'Ağırlık birimi';

  @override
  String get weightUnitError => 'Ağırlık birimi kaydedilemedi.';

  @override
  String get categoryBenchmarkWod => 'Referans WOD’lar';

  @override
  String get noRecentMovementRecords => 'Son 14 günde hareket kaydı yok.';

  @override
  String get todayTab => 'Today';

  @override
  String get recordWod => 'Record WOD';

  @override
  String get languageSetting => 'Language';

  @override
  String get deviceLanguage => 'Device language';

  @override
  String get weeklyGoal => 'Weekly goal';

  @override
  String get weightCalculator => 'Weight calculator';

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
  String get wodPersonalRecords => 'WOD personal records';

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
}
