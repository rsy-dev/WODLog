import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../settings/weight_unit.dart';
import '../data/crossfit_catalog.dart';
import '../data/wod_comparison.dart';
import '../data/wod_repository.dart';
import 'movement_category_label.dart';
import 'wod_blocks_section.dart';
import '../data/exercise_progress_service.dart';
import '../providers/workout_providers.dart';
import '../providers/wod_providers.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final progress = ref.watch(exerciseProgressProvider);
    final records = ref.watch(_wodAttemptsProvider);
    final unit = ref.watch(weightUnitProvider).value ?? WeightUnit.kg;
    final locale = Localizations.localeOf(context).toString();
    final number = NumberFormat.decimalPattern(locale);
    final dateFormat = DateFormat.yMMMd(locale);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.statsTab)),
      body: progress.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(l10n.loadWorkoutError, textAlign: TextAlign.center),
          ),
        ),
        data: (items) {
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
              Text(
                wodPersonalRecordsLabel(l10n),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              records.when(
                loading: () => const LinearProgressIndicator(),
                error: (_, _) => Text(l10n.loadWorkoutError),
                data: (records) {
                  final groups = wodPersonalBests(records);
                  final attemptsByKey = <String, List<WodRecord>>{};
                  for (final record in records) {
                    final key = wodComparisonKey(record);
                    if (key != null) {
                      (attemptsByKey[key] ??= []).add(record);
                    }
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (groups.isEmpty)
                        Text(l10n.wodNoComparableRecords)
                      else
                        for (final group in groups)
                          _WodPersonalRecordCard(
                            group: group,
                            attempts:
                                attemptsByKey[wodComparisonKey(group.best)]!,
                            dateFormat: dateFormat,
                          ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.wodScoreHistory,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      if (records.isEmpty)
                        Text(l10n.emptyWodBlocks)
                      else
                        for (final record in records.reversed.take(10))
                          _WodHistoryTile(
                            record: record,
                            dateFormat: dateFormat,
                          ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              if (items.isEmpty)
                Text(l10n.noProgressYet)
              else ...[
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
            ],
          );
        },
      ),
    );
  }
}

class _WodHistoryTile extends ConsumerWidget {
  const _WodHistoryTile({required this.record, required this.dateFormat});

  final WodRecord record;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutDate = ref
        .watch(workoutSessionProvider(record.block.sessionId))
        .value
        ?.workoutDate;
    final parsed = DateTime.tryParse(workoutDate ?? '');
    final dateLabel = parsed == null ? workoutDate : dateFormat.format(parsed);
    final score = wodScoreLabel(context, ref, record.result);
    return Card(
      child: ListTile(
        title: Text(record.prescription.title),
        subtitle: Text([?dateLabel, ?score].join(' · ')),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => showWodRecordDetail(
          context,
          blockId: record.block.id,
          sessionId: record.block.sessionId,
          title: record.prescription.title,
          notes: record.block.notes,
          workoutDate: workoutDate,
        ),
      ),
    );
  }
}

String wodPersonalRecordsLabel(AppLocalizations l10n) =>
    l10n.wodPersonalRecords;

final _wodAttemptsProvider = StreamProvider.autoDispose(
  (ref) => ref.watch(wodRepositoryProvider).watchCompletedRecords(),
);

class _WodPersonalRecordCard extends ConsumerWidget {
  const _WodPersonalRecordCard({
    required this.group,
    required this.attempts,
    required this.dateFormat,
  });

  final WodPersonalBest group;
  final List<WodRecord> attempts;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final best = group.best;
    return Card(
      child: ExpansionTile(
        title: Text(best.prescription.title),
        subtitle: Text(
          [
            l10n.wodCurrentBest,
            wodVersionLabel(l10n, best.prescription.version),
            ?wodScoreLabel(context, ref, best.result),
          ].join(' · '),
        ),
        children: [
          _attemptTile(context, ref, best),
          if (group.improvements.isNotEmpty) ...[
            ListTile(title: Text(l10n.wodRecordImprovements)),
            for (final attempt in group.improvements.reversed)
              _attemptTile(context, ref, attempt),
          ],
          ListTile(title: Text(l10n.wodScoreHistory)),
          for (final attempt in attempts.reversed)
            _attemptTile(context, ref, attempt),
        ],
      ),
    );
  }

  Widget _attemptTile(BuildContext context, WidgetRef ref, WodRecord attempt) {
    final l10n = AppLocalizations.of(context)!;
    final workoutDate = ref
        .watch(workoutSessionProvider(attempt.block.sessionId))
        .value
        ?.workoutDate;
    final date = DateTime.tryParse(workoutDate ?? '');
    final dateLabel = date == null ? workoutDate : dateFormat.format(date);
    return ListTile(
      title: Text(wodScoreLabel(context, ref, attempt.result) ?? ''),
      subtitle: Text(
        [
          ?dateLabel,
          wodVersionLabel(l10n, attempt.prescription.version),
        ].join(' · '),
      ),
      onTap: () => showWodRecordDetail(
        context,
        blockId: attempt.block.id,
        sessionId: attempt.block.sessionId,
        title: attempt.prescription.title,
        notes: attempt.block.notes,
        workoutDate: workoutDate,
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
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Text(l10n.strengthPersonalRecords),
              children: [
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    for (final reps in [1, 3, 5])
                      _strengthRecord(
                        context,
                        '${number.format(reps)}RM',
                        progress.actualRepMaxKg(reps),
                        (workout) => workout.actualRepMaxesKg[reps],
                      ),
                    _strengthRecord(
                      context,
                      l10n.strengthEstimatedOneRepMax,
                      progress.estimatedOneRepMaxKg,
                      (workout) => workout.estimatedOneRepMaxKg,
                    ),
                  ],
                ),
                ListTile(title: Text(l10n.strengthRecordMethod)),
                ListTile(title: Text(l10n.strengthDailyBest)),
                if (progress.dailyBestWeightKg.isEmpty)
                  Text(l10n.noProgressYet),
                for (final entry
                    in progress.dailyBestWeightKg.entries.toList().reversed)
                  ListTile(
                    title: Text(_dateLabel(entry.key)),
                    trailing: Text(_weightOrEmpty(entry.value)),
                  ),
              ],
            ),
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

  Widget _strengthRecord(
    BuildContext context,
    String label,
    double? weight,
    double? Function(ExerciseWorkoutSnapshot) readWeight,
  ) {
    final metric = _SummaryMetric(label: label, value: _weightOrEmpty(weight));
    if (weight == null) return metric;
    final source = progress.workouts.reversed.firstWhere(
      (workout) => readWeight(workout) == weight,
    );
    return TextButton(
      onPressed: () => context.push('/sessions/${source.sessionId}'),
      child: metric,
    );
  }

  String _weightOrEmpty(double? weight) =>
      weight == null ? '—' : unit.format(weight, number);

  String _dateLabel(String value) {
    final date = DateTime.tryParse(value);
    return date == null ? value : dateFormat.format(date);
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
