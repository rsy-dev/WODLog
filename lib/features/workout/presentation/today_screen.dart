import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../l10n/generated/app_localizations.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('WODLog'),
        actions: [
          IconButton(
            tooltip: l10n.progress,
            onPressed: () => context.push('/progress'),
            icon: const Icon(Icons.trending_up),
          ),
          IconButton(
            tooltip: l10n.history,
            onPressed: () => context.push('/history'),
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.todayWorkout,
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
              sessions.when(
                loading: () => const LinearProgressIndicator(),
                error: (error, stackTrace) => const SizedBox.shrink(),
                data: (items) => _DailySummary(
                  sessionCount: items.length,
                  movements: _dailyMovementStats(
                    progress.asData?.value ?? const [],
                    _formatDate(_selectedDate),
                  ),
                  locale: locale,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: sessions.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(
                    child: Text(
                      l10n.loadWorkoutError,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  data: (items) => items.isEmpty
                      ? _EmptyWorkoutState(isToday: isToday)
                      : ListView.separated(
                          itemCount: items.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final session = items[index];
                            final localCreatedAt =
                                DateTime.fromMillisecondsSinceEpoch(
                                  session.createdAt,
                                  isUtc: true,
                                ).toLocal();
                            return Card(
                              child: ListTile(
                                onTap: () =>
                                    context.push('/sessions/${session.id}'),
                                leading: const Icon(Icons.fitness_center),
                                title: Text(session.title ?? l10n.workoutLog),
                                subtitle: Text(
                                  TimeOfDay.fromDateTime(localCreatedAt)
                                      .format(context),
                                ),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                            );
                          },
                        ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () async {
                    final sessionId = await ref
                        .read(workoutRepositoryProvider)
                        .createSession(workoutDate: _formatDate(_selectedDate));
                    if (context.mounted) {
                      context.push('/sessions/$sessionId');
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: Text(l10n.startWorkout),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _chooseDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now(),
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

List<_MovementDayStats> _dailyMovementStats(
  List<ExerciseProgress> progress,
  String date,
) {
  return [
    for (final movement in progress)
      for (final workout in movement.workouts)
        if (workout.workoutDate == date)
          _MovementDayStats(
            name: movement.name,
            setCount: workout.setCount,
            repCount: workout.repCount,
            volumeKg: workout.volumeKg ?? 0,
          ),
  ];
}

class _MovementDayStats {
  const _MovementDayStats({
    required this.name,
    required this.setCount,
    required this.repCount,
    required this.volumeKg,
  });

  final String name;
  final int setCount;
  final int repCount;
  final double volumeKg;
}

class _DailySummary extends StatelessWidget {
  const _DailySummary({
    required this.sessionCount,
    required this.movements,
    required this.locale,
  });

  final int sessionCount;
  final List<_MovementDayStats> movements;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final setCount = movements.fold<int>(0, (sum, item) => sum + item.setCount);
    final volumeKg = movements.fold<double>(
      0,
      (sum, item) => sum + item.volumeKg,
    );
    final number = NumberFormat('#,##0.#', locale);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.todaySummary,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 20,
              runSpacing: 12,
              children: [
                _Metric(value: '$sessionCount', label: l10n.sessionsLabel),
                _Metric(
                  value: '${movements.length}',
                  label: l10n.movementsLabel,
                ),
                _Metric(value: '$setCount', label: l10n.setsLabel),
                _Metric(
                  value: '${number.format(volumeKg)} kg',
                  label: l10n.weightedVolume,
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
  const _Metric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 68),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: Theme.of(context).textTheme.titleMedium),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
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
