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
  String get weightKg => 'Ağırlık (kg)';

  @override
  String get reps => 'Tekrar';

  @override
  String get save => 'Kaydet';

  @override
  String setLabel(int number) {
    return 'Set $number';
  }

  @override
  String setSummary(String setLabel, String weight, int reps) {
    return '$setLabel  $weight kg × $reps tekrar';
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
}
