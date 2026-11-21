import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../app/wodlog_theme.dart';
import '../../../core/database/app_database.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../settings/display_preferences.dart';
import '../../settings/weight_unit.dart';
import 'progress_screen.dart';
import 'wod_library_sheet.dart';
import 'wod_blocks_section.dart';
import '../providers/wod_providers.dart';
import 'wod_record_list.dart';
import 'workout_date_sheet.dart';
import '../data/exercise_progress_service.dart';
import '../providers/workout_providers.dart';

class TodayScreen extends ConsumerStatefulWidget {
  const TodayScreen({super.key});

  @override
  ConsumerState<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends ConsumerState<TodayScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sessions = ref.watch(
      sessionsForDateProvider(_formatDate(_selectedDate)),
    );
    final progress = ref.watch(exerciseProgressProvider);
    final locale = Localizations.localeOf(context).toString();
    final today = DateUtils.dateOnly(DateTime.now());
    final isToday = DateUtils.isSameDay(_selectedDate, today);

    final recent = ref.watch(recentSessionsProvider).value;
    final goal = ref.watch(displayPreferencesProvider).value?.weeklyGoal;
    final dates = [
      for (var offset = -6; offset <= 0; offset++)
        DateUtils.addDaysToDate(today, offset),
    ];
    final activitySessions = [
      for (final date in dates)
        ref.watch(sessionsForDateProvider(_formatDate(date))),
    ];
    final activity = [
      for (final day in activitySessions)
        for (final session in day.value ?? const <WorkoutSession>[])
          (
            date: session.workoutDate,
            blocks: ref.watch(wodBlocksForSessionProvider(session.id)),
          ),
    ];
    final activityReady =
        activitySessions.every((day) => day.hasValue) &&
        activity.every((item) => item.blocks.hasValue);
    final days = {
      for (final item in activity)
        if (item.blocks.value?.isNotEmpty ?? false) item.date,
    };
    final number = NumberFormat.decimalPattern(locale);
    final shortcutStyle = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      minimumSize: const Size(48, 48),
    );

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: WodLogColors.navy,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'W',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text('WODLog'),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            20,
            8,
            20,
            16 + MediaQuery.paddingOf(context).bottom,
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.workoutDate(
                          _formatDisplayDate(_selectedDate, context),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isToday ? '오늘의 WOD' : l10n.workoutLog,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontSize: 31),
                      ),
                    ],
                  ),
                ),
                Tooltip(
                  message: l10n.chooseDate,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: WodLogColors.surface,
                      foregroundColor: WodLogColors.navy,
                      minimumSize: const Size(48, 48),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    onPressed: _chooseDate,
                    icon: const Icon(Icons.calendar_month_outlined, size: 18),
                    label: MediaQuery.sizeOf(context).width < 360
                        ? const SizedBox.shrink()
                        : Text(l10n.chooseDate),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: WodLogColors.accent,
                        foregroundColor: Colors.white,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                      ),
                      onPressed: _startWorkout,
                      child: Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.add),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: Text(l10n.recordWod)),
                          const Icon(Icons.chevron_right, size: 24),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        const spacing = 6.0;
                        final shortcuts = <(String, VoidCallback)>[
                          (
                            l10n.benchmarkWorkouts,
                            () async {
                              final template = await showWodLibrary(context);
                              if (template != null && mounted) {
                                await _startWorkout(template.name);
                              }
                            },
                          ),
                          (
                            l10n.pastWods,
                            () => showPastWods(context, recent ?? []),
                          ),
                          (
                            wodPersonalRecordsLabel(l10n),
                            () => context.go('/progress'),
                          ),
                        ];
                        final width = (constraints.maxWidth - 2 * spacing) / 3;
                        final painter = TextPainter(
                          textDirection: Directionality.of(context),
                          textScaler: MediaQuery.textScalerOf(context),
                        );
                        final labelStyle = Theme.of(context)
                            .textTheme
                            .labelLarge;
                        final equalWidths = shortcuts.every((shortcut) {
                          painter.text = TextSpan(
                            text: shortcut.$1,
                            style: labelStyle,
                          );
                          painter.layout();
                          return painter.width + 16 <= width.floorToDouble();
                        });
                        painter.dispose();

                        return Wrap(
                          spacing: spacing,
                          runSpacing: 4,
                          children: [
                            for (final (label, onPressed) in shortcuts)
                              SizedBox(
                                width: equalWidths
                                    ? width.floorToDouble()
                                    : null,
                                child: OutlinedButton(
                                  style: shortcutStyle,
                                  onPressed: onPressed,
                                  child: Text(
                                    label,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Card(
              color: WodLogColors.blueSurface,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.lastSevenDays,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            [
                              l10n.weeklyGoal,
                              if (activityReady && goal != null)
                                '${number.format(days.length)} / ${number.format(goal)}',
                            ].join(' · '),
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        for (final date in dates)
                          Expanded(
                            child: _dayChip(context, date, days, locale),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    isToday
                        ? l10n.wodRecentRecords
                        : _formatDisplayDate(_selectedDate, context),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/history'),
                  child: Text(l10n.wodViewAll),
                ),
              ],
            ),
            if (sessions.value case final currentSessions?)
              WodRecordList(
                sessions: isToday
                    ? [
                        ...currentSessions,
                        for (final item in (recent ?? const <WorkoutSession>[]))
                          if (item.workoutDate != _formatDate(today)) item,
                      ]
                    : currentSessions,
                limit: isToday ? 3 : null,
              ),
            const SizedBox(height: 20),
            sessions.when(
              loading: () => const LinearProgressIndicator(),
              error: (error, stackTrace) => const SizedBox.shrink(),
              data: (items) => _DailySummary(
                sessionCount: items.length,
                progress: progress.value,
                date: _formatDate(_selectedDate),
                locale: locale,
              ),
            ),
            OutlinedButton.icon(
              onPressed: _startStrengthSession,
              icon: const Icon(Icons.fitness_center),
              label: Text(l10n.addStrengthBlock),
            ),
            const SizedBox(height: 22),
            ...sessions.when<List<Widget>>(
              loading: () => [const Center(child: CircularProgressIndicator())],
              error: (error, stackTrace) => [
                Text(l10n.loadWorkoutError, textAlign: TextAlign.center),
              ],
              data: (items) => [
                if (items.isEmpty) _EmptyWorkoutState(isToday: isToday),
                for (final session in items)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _TodaySessionTile(session: session),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _starting = false;

  Future<void> _startWorkout([String? benchmark]) async {
    if (_starting) return;
    _starting = true;
    try {
      await showWodResultEditor(
        context,
        ref,
        const Uuid().v4(),
        newWorkoutDate: _formatDate(_selectedDate),
        initialBenchmark: benchmark,
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.wodSaveError)),
        );
      }
    } finally {
      _starting = false;
    }
  }

  Future<void> _startStrengthSession() async {
    if (_starting) return;
    _starting = true;
    try {
      final sessionId = await ref
          .read(workoutRepositoryProvider)
          .createSession(workoutDate: _formatDate(_selectedDate));
      if (mounted) context.push('/sessions/$sessionId');
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.wodSaveError)),
        );
      }
    } finally {
      _starting = false;
    }
  }

  Widget _dayChip(
    BuildContext context,
    DateTime date,
    Set<String> dates,
    String locale,
  ) {
    final selected = DateUtils.isSameDay(date, _selectedDate);
    final recorded = dates.contains(_formatDate(date));
    return Semantics(
      selected: selected,
      child: Tooltip(
        message: _formatDisplayDate(date, context),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => setState(() => _selectedDate = date),
          child: Ink(
            decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : null,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  Text(
                    DateFormat.E(locale).format(date),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(DateFormat.d(locale).format(date)),
                  Icon(recorded ? Icons.check : Icons.remove, size: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _chooseDate() async {
    final selected = await showWorkoutDateSheet(context, _selectedDate);
    if (selected != null && mounted) {
      setState(() => _selectedDate = DateUtils.dateOnly(selected));
    }
  }

  static String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  static String _formatDisplayDate(DateTime date, BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.yMMMMEEEEd(locale).format(date);
  }
}

class _TodaySessionTile extends StatelessWidget {
  const _TodaySessionTile({required this.session});
  final WorkoutSession session;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localTime = DateTime.fromMillisecondsSinceEpoch(
      session.createdAt,
      isUtc: true,
    ).toLocal();
    return Card(
      child: ListTile(
        leading: const Icon(Icons.fitness_center_rounded),
        title: Text(session.title ?? l10n.workoutLog),
        subtitle: Text(TimeOfDay.fromDateTime(localTime).format(context)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/sessions/${session.id}'),
      ),
    );
  }
}

class _DailySummary extends ConsumerWidget {
  const _DailySummary({
    required this.sessionCount,
    required this.progress,
    required this.date,
    required this.locale,
  });

  final int sessionCount;
  final List<ExerciseProgress>? progress;
  final String date;
  final String locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(weightUnitProvider).value ?? WeightUnit.kg;
    final l10n = AppLocalizations.of(context)!;
    var movementCount = 0;
    var setCount = 0;
    double? volumeKg;
    for (final movement in progress ?? const <ExerciseProgress>[]) {
      final workouts = movement.workouts.where(
        (workout) => workout.workoutDate == date,
      );
      if (workouts.isEmpty) continue;
      movementCount++;
      for (final workout in workouts) {
        setCount += workout.setCount;
        if (workout.volumeKg case final volume?) {
          volumeKg = (volumeKg ?? 0) + volume;
        }
      }
    }
    final number = NumberFormat.decimalPattern(locale);

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.todaySummary,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: _Metric(
                    value: number.format(sessionCount),
                    label: l10n.sessionsLabel,
                    prominent: true,
                  ),
                ),
                Expanded(
                  child: _Metric(
                    value: progress == null
                        ? '—'
                        : number.format(movementCount),
                    label: l10n.movementsLabel,
                    prominent: true,
                  ),
                ),
                Expanded(
                  child: _Metric(
                    value: progress == null ? '—' : number.format(setCount),
                    label: l10n.setsLabel,
                    prominent: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(height: 1, color: WodLogColors.line),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.bolt_rounded,
                  size: 17,
                  color: WodLogColors.navy,
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    l10n.weightedVolume,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Flexible(
                  child: Text(
                    volumeKg == null
                        ? '—'
                        : '${unit.format(volumeKg, number)}·${l10n.reps}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: WodLogColors.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.value,
    required this.label,
    this.prominent = false,
  });

  final String value;
  final String label;
  final bool prominent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style:
              (prominent
                      ? Theme.of(context).textTheme.headlineSmall
                      : Theme.of(context).textTheme.titleMedium)
                  ?.copyWith(color: WodLogColors.ink),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _EmptyWorkoutState extends StatelessWidget {
  const _EmptyWorkoutState({required this.isToday});

  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.event_note_outlined,
            size: 44,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Text(
            isToday ? l10n.noRecords : l10n.emptyHistory,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          if (isToday) ...[
            const SizedBox(height: 4),
            Text(l10n.emptyTodayHelp, textAlign: TextAlign.center),
          ],
        ],
      ),
    );
  }
}
