import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../data/crossfit_catalog.dart';
import '../data/exercise_progress_service.dart';
import '../providers/workout_providers.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final progress = ref.watch(exerciseProgressProvider);
    final locale = Localizations.localeOf(context).toString();
    final number = NumberFormat('#,##0.#', locale);
    final dateFormat = DateFormat.yMMMd(locale);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.progress)),
      body: progress.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(l10n.loadWorkoutError, textAlign: TextAlign.center),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.trending_up, size: 40),
                    const SizedBox(height: 12),
                    Text(
                      l10n.noProgressYet,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            );
          }

          final totalSessions = <String>{};
          var totalSets = 0;
          var totalReps = 0;
          for (final movement in items) {
            for (final workout in movement.workouts) {
              totalSessions.add(workout.sessionId);
              totalSets += workout.setCount;
              totalReps += workout.repCount;
            }
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                l10n.trainingOverview,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 12,
                    children: [
                      _SummaryMetric(
                        value: number.format(totalSessions.length),
                        label: l10n.sessionsLabel,
                      ),
                      _SummaryMetric(
                        value: number.format(totalSets),
                        label: l10n.setsLabel,
                      ),
                      _SummaryMetric(
                        value: number.format(totalReps),
                        label: l10n.reps,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                l10n.progress,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _MovementTypeTrends(
                progress: items,
                locale: locale,
                number: number,
              ),
              const SizedBox(height: 12),
              for (final movement in items)
                _MovementProgressCard(
                  progress: movement,
                  locale: locale,
                  number: number,
                  dateFormat: dateFormat,
                ),
            ],
          );
        },
      ),
    );
  }
}

class _MovementTypeTrends extends StatelessWidget {
  const _MovementTypeTrends({
    required this.progress,
    required this.locale,
    required this.number,
  });

  final List<ExerciseProgress> progress;
  final String locale;
  final NumberFormat number;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final today = DateUtils.dateOnly(DateTime.now());
    final currentStart = today.subtract(const Duration(days: 6));
    final previousStart = today.subtract(const Duration(days: 13));
    final groups = <CrossFitCategory, _CategoryPeriodStats>{};

    for (final movement in progress) {
      final category = CrossFitCatalog.find(movement.name)?.category;
      if (category == null || category == CrossFitCategory.benchmarkWod) {
        continue;
      }
      final group = groups.putIfAbsent(category, _CategoryPeriodStats.new);
      for (final workout in movement.workouts) {
        final parsed = DateTime.tryParse(workout.workoutDate);
        if (parsed == null) continue;
        final date = DateUtils.dateOnly(parsed);
        if (!date.isBefore(currentStart) && !date.isAfter(today)) {
          group.currentVolume += workout.volumeKg ?? 0;
          group.currentReps += workout.repCount;
          group.currentSets += workout.setCount;
        } else if (!date.isBefore(previousStart) &&
            date.isBefore(currentStart)) {
          group.previousVolume += workout.volumeKg ?? 0;
          group.previousReps += workout.repCount;
          group.previousSets += workout.setCount;
        }
      }
    }

    final visibleGroups =
        groups.entries
            .where(
              (entry) =>
                  entry.value.currentSets > 0 || entry.value.previousSets > 0,
            )
            .toList()
          ..sort(
            (a, b) => b.value.currentVolume.compareTo(a.value.currentVolume),
          );
    if (visibleGroups.isEmpty) return const SizedBox.shrink();

    String categoryLabel(CrossFitCategory category) => switch (category) {
      CrossFitCategory.barbell => l10n.categoryBarbell,
      CrossFitCategory.gymnastics => l10n.categoryGymnastics,
      CrossFitCategory.dumbbellKettlebell => l10n.categoryDumbbellKettlebell,
      CrossFitCategory.cardio => l10n.categoryCardio,
      CrossFitCategory.bodyweight => l10n.categoryBodyweight,
      CrossFitCategory.otherEquipment => l10n.categoryOtherEquipment,
      CrossFitCategory.benchmarkWod => '',
    };

    final dateFormat = DateFormat.MMMd(locale);
    final currentLabel =
        '${dateFormat.format(currentStart)} – ${dateFormat.format(today)}';
    final previousEnd = currentStart.subtract(const Duration(days: 1));
    final previousLabel =
        '${dateFormat.format(previousStart)} – ${dateFormat.format(previousEnd)}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.movementTypes,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            for (final entry in visibleGroups)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(categoryLabel(entry.key)),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 16,
                      runSpacing: 4,
                      children: [
                        _PeriodValue(
                          label: '${l10n.last7Days} ($currentLabel)',
                          value: _formatPeriod(
                            entry.value.currentVolume,
                            entry.value.currentReps,
                            l10n,
                          ),
                        ),
                        _PeriodValue(
                          label: '${l10n.previous7Days} ($previousLabel)',
                          value: _formatPeriod(
                            entry.value.previousVolume,
                            entry.value.previousReps,
                            l10n,
                          ),
                        ),
                      ],
                    ),
                    if (entry.value.previousSets > 0 &&
                        entry.value.currentSets > 0)
                      Text(
                        _formatDelta(
                          entry.value.currentVolume -
                              entry.value.previousVolume,
                          entry.value.currentReps - entry.value.previousReps,
                          l10n,
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatPeriod(double volume, int reps, AppLocalizations l10n) {
    final values = <String>[];
    if (volume > 0) values.add('${number.format(volume)} ${l10n.volumeUnit}');
    if (reps > 0) values.add('${number.format(reps)} ${l10n.reps}');
    return values.isEmpty ? '—' : values.join(' · ');
  }

  String _formatDelta(double volume, int reps, AppLocalizations l10n) {
    final values = <String>[];
    if (volume != 0) {
      values.add(
        '${volume > 0 ? '+' : ''}${number.format(volume)} ${l10n.volumeUnit}',
      );
    }
    if (reps != 0) {
      values.add('${reps > 0 ? '+' : ''}${number.format(reps)} ${l10n.reps}');
    }
    return values.isEmpty ? l10n.noChange : values.join(' · ');
  }
}

class _CategoryPeriodStats {
  double currentVolume = 0;
  double previousVolume = 0;
  int currentReps = 0;
  int previousReps = 0;
  int currentSets = 0;
  int previousSets = 0;
}

class _PeriodValue extends StatelessWidget {
  const _PeriodValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text('$label: $value', style: Theme.of(context).textTheme.bodySmall);
  }
}

class _SummaryMetric extends StatelessWidget {
  const _SummaryMetric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 82),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: Theme.of(context).textTheme.titleLarge),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _MovementProgressCard extends StatelessWidget {
  const _MovementProgressCard({
    required this.progress,
    required this.locale,
    required this.number,
    required this.dateFormat,
  });

  final ExerciseProgress progress;
  final String locale;
  final NumberFormat number;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final latest = progress.latest!;
    final previous = progress.previous;
    final latestDate = DateTime.tryParse(latest.workoutDate);
    final previousDate = previous == null
        ? null
        : DateTime.tryParse(previous.workoutDate);
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(progress.name, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 4,
              children: [
                if (latestDate != null)
                  Text('${l10n.lastWorkout}: ${dateFormat.format(latestDate)}'),
                Text(l10n.setCount(latest.setCount)),
                Text('${number.format(latest.repCount)} ${l10n.reps}'),
                if (latest.bestWeightKg != null)
                  Text('${number.format(latest.bestWeightKg)} kg'),
              ],
            ),
            if (previous != null) ...[
              const SizedBox(height: 10),
              const Divider(height: 1),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${l10n.previousWorkout}: ${previousDate == null ? previous.workoutDate : dateFormat.format(previousDate)}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  if (progress.volumeChangeKg != null)
                    _ChangeLabel(
                      value: progress.volumeChangeKg!,
                      label: l10n.volumeChange,
                      suffix: l10n.volumeUnit,
                      number: number,
                    )
                  else if (progress.repChange != null)
                    _ChangeLabel(
                      value: progress.repChange!.toDouble(),
                      label: l10n.repChange,
                      suffix: l10n.reps,
                      number: number,
                    ),
                ],
              ),
              if (progress.bestWeightChangeKg != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: _ChangeLabel(
                    value: progress.bestWeightChangeKg!,
                    label: l10n.bestLoadChange,
                    suffix: 'kg',
                    number: number,
                  ),
                ),
              if (latest.volumeKg != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '${l10n.weightedVolume}: ${number.format(latest.volumeKg)} kg·${l10n.reps}',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
            ] else ...[
              const SizedBox(height: 8),
              Text(l10n.noProgressYet, style: theme.textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}

class _ChangeLabel extends StatelessWidget {
  const _ChangeLabel({
    required this.value,
    required this.label,
    required this.suffix,
    required this.number,
  });

  final double value;
  final String label;
  final String suffix;
  final NumberFormat number;

  @override
  Widget build(BuildContext context) {
    final improved = value >= 0;
    final color = improved
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.error;
    final prefix = value > 0 ? '+' : '';
    return Text(
      '$label: $prefix${number.format(value)} $suffix',
      style: Theme.of(context).textTheme.labelLarge
          ?.copyWith(color: color, fontWeight: FontWeight.w700),
    );
  }
}
