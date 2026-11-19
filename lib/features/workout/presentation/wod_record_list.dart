import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/wodlog_sheet.dart';
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
    final results = [
      for (final session in sessions)
        (
          session: session,
          blocks: ref.watch(wodBlocksForSessionProvider(session.id)),
        ),
    ];
    final records = [
      for (final entry in results)
        for (final block in entry.blocks.value ?? const <WorkoutBlock>[])
          if ('${block.title ?? ''} ${block.notes ?? ''}'
              .toLowerCase()
              .contains(query))
            (session: entry.session, block: block),
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
        for (final (session: session, block: block) in records.take(
          limit ?? records.length,
        ))
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _WodRecordTile(session: session, block: block),
          ),
      ],
    );
  }
}

class _WodRecordTile extends ConsumerWidget {
  const _WodRecordTile({required this.session, required this.block});

  final WorkoutSession session;
  final WorkoutBlock block;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final title = block.title ?? l10n.wodSectionTitle;
    final date = DateTime.tryParse(session.workoutDate);
    final dateLabel = date == null
        ? session.workoutDate
        : DateFormat.yMMMd(Localizations.localeOf(context).toString())
              .format(date);
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
          [dateLabel, ?score?.resultText, if (isPr) 'PR'].join(' · '),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => _showDetail(context, title, dateLabel),
      ),
    );
  }

  void _showDetail(BuildContext thisContext, String title, String date) {
    final l10n = AppLocalizations.of(thisContext)!;
    showWodLogSheet<void>(
      context: thisContext,
      title: title,
      builder: (_) => Consumer(
        builder: (context, ref, _) {
          final score = ref.watch(wodResultProvider(block.id));
          final bests = ref.watch(wodPersonalBestsProvider).value ?? [];
          final isPr = bests.any(
            (group) =>
                group.improvements.any((record) => record.block.id == block.id),
          );
          final korean = l10n.localeName.startsWith('ko');
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(date),
              if (isPr) Text(korean ? '개인 기록 갱신' : 'Personal record'),
              if (block.notes case final notes?)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(notes),
                ),
              score.when(
                loading: () => const LinearProgressIndicator(),
                error: (_, _) => Text(l10n.loadWorkoutError),
                data: (result) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (result != null) ...[
                      Text(wodTypeLabel(l10n, result.resultType)),
                      Text(
                        result.resultText ?? l10n.emptyWodResult,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (result.notes case final notes?) Text(notes),
                    ] else
                      Text(l10n.emptyWodResult),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => showWodResultEditor(context, ref, block.id),
                child: Text(l10n.editWodResult),
              ),
              OutlinedButton(
                onPressed: () =>
                    showWodResultEditor(context, ref, block.id, repeat: true),
                child: Text(korean ? '다시 기록' : 'Record again'),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (thisContext.mounted) {
                    thisContext.push('/sessions/${session.id}');
                  }
                },
                child: Text(l10n.openSession),
              ),
            ],
          );
        },
      ),
    );
  }
}
