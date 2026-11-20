import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import 'package:wodlog/app/app.dart';
import 'package:wodlog/app/wodlog_theme.dart';
import 'package:wodlog/features/settings/display_preferences.dart';
import 'package:wodlog/core/database/app_database.dart';
import 'package:wodlog/features/settings/settings_screen.dart';
import 'package:wodlog/features/settings/weight_unit.dart';
import 'package:wodlog/features/workout/data/exercise_progress_service.dart';
import 'package:wodlog/features/workout/data/wod_repository.dart';
import 'package:wodlog/features/workout/data/wod_prescription.dart';
import 'package:wodlog/features/workout/presentation/localized_decimal.dart';
import 'package:wodlog/features/workout/presentation/progress_screen.dart';
import 'package:wodlog/features/workout/presentation/today_screen.dart';
import 'package:wodlog/features/workout/presentation/workout_history_screen.dart';
import 'package:wodlog/features/workout/presentation/workout_session_screen.dart';
import 'package:wodlog/features/workout/providers/wod_providers.dart';
import 'package:wodlog/features/workout/providers/workout_providers.dart';
import 'package:wodlog/l10n/generated/app_localizations.dart';

void main() {
  test('converts pounds at the UI boundary and validates local decimals', () {
    expect(WeightUnit.lb.toKg(100), closeTo(45.359237, 1e-9));
    expect(WeightUnit.lb.fromKg(45.359237), closeTo(100, 1e-9));
    final german = NumberFormat('0.###', 'de');
    expect(parseLocalizedDecimal('12,5', german), 12.5);
    expect(parseLocalizedDecimal('12.5', german), isNull);
    expect(parseLocalizedDecimal('12,5 lb', german), isNull);
    expect(parseLocalizedDecimal('-12,5', german), isNull);
    final arabic = NumberFormat('0.###', 'ar');
    expect(parseLocalizedDecimal(arabic.format(12.5), arabic), 12.5);
    expect(parseLocalizedDecimal('12.5', arabic), 12.5);
    expect(parseLocalizedDecimal('১২.৫', NumberFormat('0.###', 'bn')), 12.5);
  });

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('workout screens fit a narrow phone in $locale', (
      tester,
    ) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(320, 640);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final l10n = lookupAppLocalizations(locale);
      final isRtl = const {'ar', 'ur'}.contains(locale.languageCode);
      final number = NumberFormat.decimalPattern(locale.toString());
      final displayedWeight = '\u2066${number.format(100.125)}\u00a0lb\u2069';

      final wodWriter = _RetryWodWriter();
      Future<void> show(Widget screen) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              weightUnitProvider.overrideWith(_PoundsPreference.new),
              wodRepositoryProvider.overrideWithValue(wodWriter),
              if (locale.languageCode == 'en')
                wodPersonalBestsProvider.overrideWith(
                  (ref) => Stream.value([
                    (best: _personalBest, improvements: [_personalBest]),
                  ]),
                ),
              displayPreferencesProvider.overrideWith(
                _TestDisplayPreference.new,
              ),
              sessionsForDateProvider.overrideWith(
                (ref, date) => Stream.value([_session]),
              ),
              recentSessionsProvider.overrideWith(
                (ref) => Stream.value([_session]),
              ),
              exerciseProgressProvider.overrideWith(
                (ref) => Stream.value([_progress]),
              ),
              workoutSessionProvider.overrideWith(
                (ref, id) => Stream.value(_session),
              ),
              blocksForSessionProvider.overrideWith(
                (ref, id) => Stream.value([_strength]),
              ),
              exercisesForBlockProvider.overrideWith(
                (ref, id) => Stream.value([_exercise]),
              ),
              setsForExerciseProvider.overrideWith(
                (ref, id) => Stream.value([_set]),
              ),
              wodBlocksForSessionProvider.overrideWith(
                (ref, id) => Stream.value([_wod]),
              ),
              wodResultProvider.overrideWith(
                (ref, id) =>
                    Stream.value(id == _wod.id ? _result : wodWriter.created),
              ),
            ],
            child: MaterialApp(
              theme: WodLogTheme.light,
              locale: locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              builder: (context, child) => MediaQuery.withClampedTextScaling(
                minScaleFactor: 1.3,
                maxScaleFactor: 1.3,
                child: child!,
              ),
              home: screen,
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }

      await show(const TodayScreen());
      expect(find.text(l10n.recordWod), findsOneWidget);
      final date = DateFormat.yMMMMEEEEd(locale.toString())
          .format(DateTime.now());
      expect(find.text(l10n.workoutDate(date)), findsOneWidget);
      if (locale.languageCode == 'en') {
        expect(find.text('${l10n.weeklyGoal} · 1 / 3'), findsOneWidget);
        await tester.tap(find.text(l10n.recordWod));
        await tester.pumpAndSettle();
        expect(
          find.widgetWithText(TextFormField, l10n.wodName),
          findsOneWidget,
        );
        await tester.tap(find.byTooltip(l10n.closeSheet));
        await tester.pumpAndSettle();
      }
      final todayVolume = find.text(
        '\u2066${number.format(500.625)}\u00a0lb\u2069·${l10n.reps}',
      );
      await tester.scrollUntilVisible(todayVolume, 120);
      expect(todayVolume, findsOneWidget);

      await show(const WorkoutHistoryScreen());
      final scoreLabel = find.text('07:45');
      await tester.scrollUntilVisible(
        scoreLabel,
        100,
        scrollable: find.byType(Scrollable).first,
      );
      final scoreContext = tester.element(scoreLabel);
      expect(
        Directionality.of(scoreContext),
        isRtl ? TextDirection.rtl : TextDirection.ltr,
      );
      final leading = tester.getCenter(find.byIcon(Icons.fitness_center));
      final trailing = tester.getCenter(scoreLabel);
      expect(leading.dx > trailing.dx, isRtl);

      await show(const ProgressScreen());
      await tester.scrollUntilVisible(find.text('Back Squat'), 120);
      await tester.scrollUntilVisible(find.text(displayedWeight), 120);
      expect(find.text(displayedWeight), findsOneWidget);
      expect(tester.takeException(), isNull);

      await show(const SettingsScreen());
      expect(find.text(l10n.weightUnit), findsOneWidget);

      await show(const WorkoutSessionScreen(sessionId: 'session'));
      expect(find.textContaining('07:45'), findsOneWidget);
      await tester.scrollUntilVisible(find.byType(InputChip), 120);
      await tester.pumpAndSettle();
      expect(
        (tester.widget<InputChip>(find.byType(InputChip)).label as Text).data,
        contains(displayedWeight),
      );
      await tester.tap(find.byType(InputChip));
      await tester.pumpAndSettle();
      expect(find.text(l10n.setWeight('lb')), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.tap(find.text(l10n.cancel));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      if (locale.languageCode == 'en') {
        final addWod = find.byTooltip(l10n.addWodBlock);
        await tester.scrollUntilVisible(addWod, -100);
        await tester.tap(addWod);
        await tester.pumpAndSettle();
        await tester.enterText(
          find.widgetWithText(TextFormField, l10n.wodName),
          'Saved workout',
        );
        await tester.tap(find.widgetWithText(OutlinedButton, l10n.addExercise));
        await tester.pumpAndSettle();
        await tester.enterText(
          find.widgetWithText(TextField, l10n.searchMovements),
          '더블언더',
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Double-Unders'));
        await tester.pumpAndSettle();
        expect(find.text('Double-Unders'), findsOneWidget);
        await tester.tap(find.byType(DropdownButtonFormField<String>));
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.resultLoad).last);
        await tester.pumpAndSettle();
        await tester.enterText(
          find.widgetWithText(TextFormField, l10n.setWeight('lb')),
          '100.125',
        );
        FocusManager.instance.primaryFocus?.unfocus();
        await tester.pumpAndSettle();
        final saveNew = find.widgetWithText(FilledButton, l10n.save);
        final editorScroll = find
            .descendant(
              of: find.byType(ListView).last,
              matching: find.byType(Scrollable),
            )
            .first;
        await tester.scrollUntilVisible(saveNew, 100, scrollable: editorScroll);
        await tester.drag(editorScroll, const Offset(0, -200));
        await tester.pumpAndSettle();
        await tester.tap(saveNew);
        await tester.pumpAndSettle();
        expect(find.text('Saved workout'), findsWidgets);
        expect(find.text(displayedWeight), findsOneWidget);
        expect(
          find.widgetWithText(FilledButton, l10n.editWodResult),
          findsOneWidget,
        );
        await tester.tap(find.byTooltip(l10n.closeSheet));
        await tester.pumpAndSettle();

        await show(const WorkoutHistoryScreen());
        final search = find.widgetWithText(TextField, l10n.searchWorkouts);
        await tester.enterText(search, 'thruster');
        await tester.pumpAndSettle();
        expect(find.text('Fran'), findsOneWidget);
        await tester.enterText(search, '1900-01-01');
        await tester.pumpAndSettle();
        expect(find.text('Fran'), findsNothing);
        await tester.enterText(search, _session.workoutDate);
        await tester.pumpAndSettle();
        expect(find.text('Fran'), findsOneWidget);
        await tester.enterText(
          search,
          DateFormat.yMMMd(locale.toString())
              .format(DateTime.parse(_session.workoutDate)),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Fran'));
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.editWodResult));
        await tester.pumpAndSettle();
        final resultType = find.byType(DropdownButtonFormField<String>);
        await tester.tap(resultType);
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.resultEmom).last);
        await tester.pumpAndSettle();
        final intervals = find.widgetWithText(
          TextFormField,
          l10n.wodCompletedIntervals,
        );
        final intervalInput = find.descendant(
          of: intervals,
          matching: find.byType(EditableText),
        );
        expect(tester.widget<EditableText>(intervalInput).controller.text, '');
        await tester.tap(resultType);
        await tester.pumpAndSettle();
        await tester.tap(find.text(l10n.resultForTime).last);
        await tester.pumpAndSettle();
        final time = find.widgetWithText(TextFormField, l10n.wodFinishTime);
        await tester.enterText(time, '12:42');
        final save = find.widgetWithText(FilledButton, l10n.save);
        await tester.scrollUntilVisible(save, 100, scrollable: editorScroll);
        await tester.drag(editorScroll, const Offset(0, -200));
        await tester.pumpAndSettle();
        await tester.tap(save);
        await tester.pumpAndSettle();
        expect(find.text(l10n.wodSaveError), findsOneWidget);
        await tester.scrollUntilVisible(time, -100, scrollable: editorScroll);
        expect(find.text('12:42'), findsOneWidget);
        await tester.scrollUntilVisible(save, 100, scrollable: editorScroll);
        await tester.drag(editorScroll, const Offset(0, -200));
        await tester.pumpAndSettle();
        await tester.tap(save);
        await tester.pumpAndSettle();
        expect(wodWriter.scores, ['12:42', '12:42']);
        await tester.tap(find.byTooltip(l10n.closeSheet));
        await tester.pumpAndSettle();
      }
      if (locale.languageCode == 'en') {
        await show(const WodLogApp());
        await tester.tap(
          find.widgetWithText(OutlinedButton, 'WOD personal records'),
        );
        await tester.pumpAndSettle();
        expect(find.text('Current best · rx · 07:45'), findsOneWidget);
        await tester.tap(find.text('Fran'));
        await tester.pumpAndSettle();
        expect(find.text('Score history'), findsOneWidget);
        expect(find.text('08:20'), findsOneWidget);
        await tester.tap(find.text('07:45').first);
        await tester.pumpAndSettle();
        expect(find.text(l10n.openSession), findsOneWidget);
        await tester.tap(find.byTooltip(l10n.closeSheet));
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.receipt_long_outlined));
        await tester.pumpAndSettle();
        expect(find.text(l10n.searchWorkouts), findsOneWidget);
        await tester.tap(find.byIcon(Icons.settings_outlined));
        await tester.pumpAndSettle();
        expect(find.text(l10n.languageSetting), findsOneWidget);
        expect(tester.takeException(), isNull);
      }
    });
  }
}

const WodRecord _personalBest = (
  block: _wod,
  prescription: WodPrescription(
    title: 'Fran',
    version: WodVersion.rx,
    structure: WodStructure.forTime,
    scoreKind: WodScoreKind.time,
    movements: [
      WodMovementPrescription(
        name: 'Thruster',
        movementId: 'thruster',
        quantities: [21, 15, 9],
      ),
    ],
  ),
  result: WodResult(
    id: 'result',
    blockId: 'wod',
    resultType: 'time',
    resultText: '07:45',
    outcome: 'completed',
    durationMs: 465000,
    createdAt: 0,
    updatedAt: 0,
  ),

  outcome: WodOutcome.completed,
);

class _RetryWodWriter implements WodRepository {
  final scores = <String>[];

  WodResult? created;

  @override
  Future<int> nextWodSortOrder(String sessionId) async => 2;

  @override
  Future<String> saveConfirmed({
    required String attemptId,
    required String sessionId,
    required int sortOrder,
    required WodPrescription prescription,
    required WodAttemptScore score,
  }) async {
    expect(sessionId, _session.id);
    expect(prescription.title, 'Saved workout');
    expect(prescription.movements.single.movementId, 'double_unders');
    expect(score.value, closeTo(100.125 * 0.45359237, 1e-9));
    created = WodResult(
      id: attemptId,
      blockId: attemptId,
      resultType: prescription.scoreKind.name,
      outcome: score.outcome.name,
      scoreValue: score.value,
      resultText: score.text,
      createdAt: 0,
      updatedAt: 0,
    );
    return attemptId;
  }

  @override
  Stream<List<WodRecord>> watchCompletedRecords() => Stream.value([
    _personalBest,
    (
      block: _wod,
      prescription: _personalBest.prescription,
      result: const WodResult(
        id: 'slower',
        blockId: 'wod',
        resultType: 'time',
        resultText: '08:20',
        outcome: 'completed',
        durationMs: 500000,
        createdAt: 1,
        updatedAt: 1,
      ),
      outcome: WodOutcome.completed,
    ),
  ]);

  @override
  Future<List<WodRecord>> searchRecords(
    String text, {
    String? sessionId,
  }) async => [_personalBest];

  @override
  Future<WodRecord?> getRecord(String attemptId) async => (
    block: _wod,
    prescription: const WodPrescription(title: 'Fran'),
    result: _result,
    outcome: WodOutcome.unknown,
  );

  @override
  Future<void> saveStructuredResult({
    required String blockId,
    required WodPrescription prescription,
    required WodAttemptScore score,
  }) async {
    expect(score.elapsedMs, 762000);
    scores.add(score.text!);
    if (scores.length == 1) throw StateError('Write failed');
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _TestDisplayPreference extends DisplayPreferenceNotifier {
  @override
  Future<DisplayPreferences> build() async => (locale: null, weeklyGoal: 3);
}

class _PoundsPreference extends WeightUnitPreference {
  @override
  Future<WeightUnit> build() async => WeightUnit.lb;
}

final _session = WorkoutSession(
  id: 'session',
  workoutDate: DateFormat('yyyy-MM-dd', 'en').format(DateTime.now()),
  title: 'Strength and conditioning',
  createdAt: DateTime.now().millisecondsSinceEpoch,
  updatedAt: DateTime.now().millisecondsSinceEpoch,
);

const _strength = WorkoutBlock(
  id: 'strength',
  sessionId: 'session',
  type: 'strength',
  title: 'Strength',
  sortOrder: 0,
);
const _wod = WorkoutBlock(
  id: 'wod',
  sessionId: 'session',
  type: 'wod',
  title: 'Fran',
  sortOrder: 1,
);
const _result = WodResult(
  id: 'result',
  blockId: 'wod',
  resultType: 'for_time',
  resultText: '07:45',
  createdAt: 0,
  updatedAt: 0,
);
const _exercise = WorkoutExercise(
  id: 'exercise',
  blockId: 'strength',
  displayName: 'Back Squat',
  sortOrder: 0,
);
const _set = PerformedSet(
  id: 'set',
  workoutExerciseId: 'exercise',
  setNumber: 1,
  weightKg: 100.125 * 0.45359237,
  reps: 5,
  isSuccessful: true,
  createdAt: 0,
  updatedAt: 0,
);
final _progress = ExerciseProgress(
  normalizedName: 'back squat',
  name: 'Back Squat',
  workouts: [
    const ExerciseWorkoutSnapshot(
      sessionId: 'previous',
      workoutDate: '2025-01-01',
      sessionTitle: null,
      createdAt: 0,
      setCount: 2,
      repCount: 6,
      volumeKg: 240,
      bestWeightKg: 40,
    ),
    ExerciseWorkoutSnapshot(
      sessionId: 'session',
      workoutDate: _session.workoutDate,
      sessionTitle: _session.title,
      createdAt: _session.createdAt,
      setCount: 1,
      repCount: 5,
      volumeKg: _set.weightKg! * _set.reps!,
      bestWeightKg: _set.weightKg,
    ),
  ],
);
