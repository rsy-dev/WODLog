import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../app/wodlog_theme.dart';
import '../../../core/database/app_database.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../settings/display_preferences.dart';
import '../../settings/weight_unit.dart';
import 'progress_screen.dart';
import 'wod_library_sheet.dart';
import 'wod_record_list.dart';
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
    final days = {
      for (final session in recent ?? const <WorkoutSession>[])
        session.workoutDate,
    };
    final weekStart = DateUtils.addDaysToDate(today, 1 - today.weekday);
    final weeklyCount = List.generate(
      today.weekday,
      (index) => _formatDate(DateUtils.addDaysToDate(weekStart, index)),
    ).where(days.contains).length;
    final number = NumberFormat.decimalPattern(locale);

    return Scaffold(
      appBar: AppBar(title: const Text('WODLog')),
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
                        isToday ? l10n.todayWorkout : l10n.workoutLog,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.workoutDate(
                          _formatDisplayDate(_selectedDate, context),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                IconButton.filledTonal(
                  tooltip: l10n.chooseDate,
                  onPressed: _chooseDate,
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _startWorkout,
              icon: const Icon(Icons.add),
              label: Text(l10n.recordWod),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    final template = await showWodLibrary(context);
                    if (template != null && mounted) {
                      await _startWorkout(template.name);
                    }
                  },
                  child: Text(l10n.benchmarkWorkouts),
                ),
                OutlinedButton(
                  onPressed: () => context.go('/history'),
                  child: Text(l10n.pastWods),
                ),
                OutlinedButton(
                  onPressed: () => context.go('/progress'),
                  child: Text(wodPersonalRecordsLabel(l10n)),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              l10n.lastSevenDays,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Wrap(
              spacing: 4,
              children: [
                for (var offset = -6; offset <= 0; offset++)
                  _dayChip(
                    context,
                    DateUtils.addDaysToDate(today, offset),
                    days,
                    locale,
                  ),
              ],
            ),
            Text(
              [
                l10n.weeklyGoal,
                if (recent != null && goal != null)
                  '${number.format(weeklyCount)} / ${number.format(goal)}',
              ].join(' · '),
            ),
            const SizedBox(height: 16),
            if (sessions.value case final currentSessions?)
              WodRecordList(
                sessions: isToday
                    ? [
                        ...currentSessions,
                        for (final item
                            in (recent ?? const <WorkoutSession>[]).take(7))
                          if (item.workoutDate != _formatDate(today)) item,
                      ]
                    : currentSessions,
                showEmpty: false,
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
      final sessionId = await ref
          .read(workoutRepositoryProvider)
          .createSession(workoutDate: _formatDate(_selectedDate));
      if (mounted) {
        context.push(
          Uri(
            path: '/sessions/$sessionId',
            queryParameters: benchmark == null
                ? null
                : {'benchmark': benchmark},
          ).toString(),
        );
      }
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
    return ChoiceChip(
      tooltip: _formatDisplayDate(date, context),
      selected: selected,
      avatar: recorded ? const Icon(Icons.check, size: 14) : null,
      label: Text(DateFormat.d(locale).format(date)),
      onSelected: (_) => setState(() => _selectedDate = date),
    );
  }

  Future<void> _chooseDate() async {
    final today = DateUtils.dateOnly(DateTime.now());
    final selected = await showWodLogSheet<DateTime>(
      context: context,
      title: AppLocalizations.of(context)!.chooseDate,
      builder: (context) => SingleChildScrollView(
        child: CalendarDatePicker(
          initialDate: _selectedDate,
          firstDate: DateTime(today.year - 5),
          lastDate: today,
          onDateChanged: (date) => Navigator.pop(context, date),
        ),
      ),
    );
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
            Container(height: 1, color: const Color(0xFFE9EDF2)),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.bolt_rounded,
                  size: 17,
                  color: Color(0xFF3182F6),
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
