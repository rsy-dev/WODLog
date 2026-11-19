import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../settings/weight_unit.dart';
import '../data/crossfit_catalog.dart';
import 'movement_category_label.dart';
import '../data/exercise_progress_service.dart';
import '../providers/workout_providers.dart';
import '../providers/wod_providers.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final progress = ref.watch(exerciseProgressProvider);
    final wodBests = ref.watch(wodPersonalBestsProvider).value ?? [];
    final korean = l10n.localeName.startsWith('ko');
    final unit = ref.watch(weightUnitProvider).value ?? WeightUnit.kg;
    final locale = Localizations.localeOf(context).toString();
    final number = NumberFormat.decimalPattern(locale);
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
          if (items.isEmpty && wodBests.isEmpty) {
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
            padding: EdgeInsets.fromLTRB(
              20,
              12,
              20,
              28 + MediaQuery.paddingOf(context).bottom,
            ),
            children: [
              if (wodBests.isNotEmpty) ...[
                Text(
                  korean ? 'WOD 개인 기록' : 'WOD personal records',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                for (final group in wodBests)
                  Card(
                    child: ExpansionTile(
                      title: Text(group.best.prescription.title),
                      subtitle: Text(
                        [
                          group.best.prescription.version.name,
                          group.best.result!.resultText ?? '',
                        ].join(' · '),
                      ),
                      children: [
                        for (final attempt in group.improvements.reversed)
                          ListTile(
                            title: Text(attempt.result!.resultText ?? ''),
                            subtitle: Text(
                              dateFormat.format(
                                DateTime.fromMillisecondsSinceEpoch(
                                  attempt.result!.createdAt,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                const SizedBox(height: 24),
              ],
              Text(
                l10n.trainingOverview,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              _MovementTypeTrends(
                progress: items,
                unit: unit,
                locale: locale,
                number: number,
              ),
              const SizedBox(height: 12),
              for (final movement in items)
                _MovementProgressCard(
                  progress: movement,
                  unit: unit,
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
    required this.unit,
    required this.locale,
    required this.number,
  });

  final List<ExerciseProgress> progress;
  final WeightUnit unit;
  final String locale;
  final NumberFormat number;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final today = DateUtils.dateOnly(DateTime.now());
    final currentStart = DateUtils.addDaysToDate(today, -6);
    final previousStart = DateUtils.addDaysToDate(today, -13);
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
          if (workout.volumeKg case final volume?) {
            group.currentVolume = (group.currentVolume ?? 0) + volume;
          }
          group.currentReps += workout.repCount;
          group.currentSets += workout.setCount;
        } else if (!date.isBefore(previousStart) &&
            date.isBefore(currentStart)) {
          if (workout.volumeKg case final volume?) {
            group.previousVolume = (group.previousVolume ?? 0) + volume;
          }
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
            (a, b) => (b.value.currentVolume ?? 0).compareTo(
              a.value.currentVolume ?? 0,
            ),
          );

    final dateFormat = DateFormat.MMMd(locale);
    final currentLabel =
        '${dateFormat.format(currentStart)} – ${dateFormat.format(today)}';
    final previousEnd = DateUtils.addDaysToDate(currentStart, -1);
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
            if (visibleGroups.isEmpty) Text(l10n.noRecentMovementRecords),
            for (final entry in visibleGroups)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movementCategoryLabel(l10n, entry.key)),
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
                          switch ((
                            entry.value.currentVolume,
                            entry.value.previousVolume,
                          )) {
                            (final current?, final previous?) =>
                              current - previous,
                            _ => null,
                          },
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

  String _formatPeriod(double? volume, int reps, AppLocalizations l10n) {
    final values = <String>[];
    if (volume != null) {
      values.add('${unit.format(volume, number)}·${l10n.reps}');
    }
    if (reps > 0) values.add('${number.format(reps)} ${l10n.reps}');
    return values.isEmpty ? '—' : values.join(' · ');
  }

  String _formatDelta(double? volume, int reps, AppLocalizations l10n) {
    final values = <String>[];
    if (volume != null && volume != 0) {
      values.add(
        '${volume > 0 ? '+' : ''}${unit.format(volume, number)}·${l10n.reps}',
      );
    }
    if (reps != 0) {
      values.add('${reps > 0 ? '+' : ''}${number.format(reps)} ${l10n.reps}');
    }
    return values.isEmpty ? l10n.noChange : values.join(' · ');
  }
}

class _CategoryPeriodStats {
  double? currentVolume;
  double? previousVolume;
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
    required this.unit,
    required this.number,
    required this.dateFormat,
  });

  final ExerciseProgress progress;
  final WeightUnit unit;
  final NumberFormat number;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final latest = progress.latest!;
    final previous = progress.previous;
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(progress.name, style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            _snapshot(latest, l10n.lastWorkout, l10n),
            if (previous != null) ...[
              const Divider(height: 24),
              _snapshot(previous, l10n.previousWorkout, l10n),
              const SizedBox(height: 10),
              Wrap(
                spacing: 16,
                runSpacing: 4,
                children: [
                  if (progress.bestWeightChangeKg case final change?)
                    Text('${l10n.bestLoadChange}  ${_signedWeight(change)}'),
                  if (progress.repChange case final change?)
                    Text(
                      '${l10n.repChange}  ${_sign(change)}${number.format(change)} ${l10n.reps}',
                    ),
                  if (progress.volumeChangeKg case final change?)
                    Text(
                      '${l10n.volumeChange}  ${_signedWeight(change)}·${l10n.reps}',
                    ),
                ],
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

  Widget _snapshot(
    ExerciseWorkoutSnapshot workout,
    String label,
    AppLocalizations l10n,
  ) {
    final date = DateTime.tryParse(workout.workoutDate);
    final dateLabel = date == null
        ? workout.workoutDate
        : dateFormat.format(date);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label  $dateLabel'),
        Wrap(
          spacing: 12,
          runSpacing: 4,
          children: [
            Text(l10n.setCount(number.format(workout.setCount))),
            Text('${number.format(workout.repCount)} ${l10n.reps}'),
            if (workout.bestWeightKg case final kg?)
              Text(unit.format(kg, number)),
            if (workout.volumeKg case final kg?)
              Text(
                '${l10n.weightedVolume}  ${unit.format(kg, number)}·${l10n.reps}',
              ),
          ],
        ),
      ],
    );
  }

  String _sign(num value) => value > 0 ? '+' : '';

  String _signedWeight(double kg) => '${_sign(kg)}${unit.format(kg, number)}';
}
