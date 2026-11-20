import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/database/app_database.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../providers/wod_providers.dart';
import 'wod_blocks_section.dart';

class WodRecordList extends ConsumerWidget {
  const WodRecordList({
    required this.sessions,
    this.query = '',
    this.showEmpty = true,
    this.limit,
    super.key,
  });

  final List<WorkoutSession> sessions;
  final String query;
  final bool showEmpty;
  final int? limit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dateFormat = DateFormat.yMMMd(
      Localizations.localeOf(context).toString(),
    );
    final results = [
      for (final session in sessions)
        (
          session: session,
          dateLabel: _recordDateLabel(session.workoutDate, dateFormat),
          blocks: ref.watch(wodBlocksForSessionProvider(session.id)),
        ),
    ];
    final records = [
      for (final entry in results)
        for (final block in entry.blocks.value ?? const <WorkoutBlock>[])
          if ('${block.title ?? ''} ${block.notes ?? ''} ${entry.session.workoutDate} ${entry.dateLabel}'
              .toLowerCase()
              .contains(query))
            (session: entry.session, block: block, dateLabel: entry.dateLabel),
    ];
    final loading = results.any((entry) => entry.blocks.isLoading);
    final failed = results.any((entry) => entry.blocks.hasError);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (loading) const LinearProgressIndicator(),
        if (failed) Text(l10n.loadWorkoutError),
        if (showEmpty && !failed && !loading && records.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              query.isEmpty ? l10n.emptyHistory : l10n.noMatchingWorkouts,
            ),
          ),
        for (final (:session, :block, :dateLabel) in records.take(
          limit ?? records.length,
        ))
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _WodRecordTile(
              session: session,
              block: block,
              dateLabel: dateLabel,
            ),
          ),
      ],
    );
  }

  String _recordDateLabel(String date, DateFormat format) {
    final parsed = DateTime.tryParse(date);
    return parsed == null ? date : format.format(parsed);
  }
}

class _WodRecordTile extends ConsumerWidget {
  const _WodRecordTile({
    required this.session,
    required this.block,
    required this.dateLabel,
  });

  final WorkoutSession session;
  final WorkoutBlock block;
  final String dateLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final title = block.title ?? l10n.wodSectionTitle;
    final score = ref.watch(wodResultProvider(block.id)).value;
    final bests = ref.watch(wodPersonalBestsProvider).value ?? [];
    final isPr = bests.any(
      (group) =>
          group.improvements.any((record) => record.block.id == block.id),
    );
    return Card(
      child: ListTile(
        leading: const Icon(Icons.fitness_center),
        title: Text(title),
        subtitle: Text(
          [
            dateLabel,
            ?wodScoreLabel(context, ref, score),
            if (isPr) 'PR',
          ].join(' · '),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => showWodRecordDetail(
          context,
          blockId: block.id,
          sessionId: session.id,
          title: title,
          date: dateLabel,
          notes: block.notes,
        ),
      ),
    );
  }
}
