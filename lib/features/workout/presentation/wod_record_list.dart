import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../app/wodlog_theme.dart';
import '../../../core/database/app_database.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../providers/wod_providers.dart';
import '../data/crossfit_catalog.dart';
import 'wod_blocks_section.dart';

Future<void> showPastWods(
  BuildContext context,
  List<WorkoutSession> sessions,
) => showWodLogSheet<void>(
  context: context,
  title: AppLocalizations.of(context)!.pastWods,
  builder: (_) => ListView(
    padding: const EdgeInsets.all(16),
    children: [WodRecordList(sessions: sessions, repeat: true)],
  ),
);

class WodRecordList extends ConsumerWidget {
  const WodRecordList({
    required this.sessions,
    this.query = '',
    this.showEmpty = true,
    this.limit,
    this.repeat = false,
    super.key,
  });

  final List<WorkoutSession> sessions;
  final String query;
  final bool showEmpty;
  final int? limit;
  final bool repeat;

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
    final blocks = [
      for (final entry in results)
        for (final block in entry.blocks.value ?? const <WorkoutBlock>[])
          (session: entry.session, block: block, dateLabel: entry.dateLabel),
    ];
    final search = query.isEmpty
        ? null
        : ref.watch(
            _searchableWodsProvider((
              sessions: sessions.map((session) => session.id).join(','),
              query: query,
            )),
          );
    final records = blocks
        .where(
          (entry) =>
              query.isEmpty ||
              entry.session.workoutDate.contains(query) ||
              entry.dateLabel.toLowerCase().contains(query) ||
              (search?.value?.contains(entry.block.id) ?? false),
        )
        .toList();
    final loading =
        results.any((entry) => entry.blocks.isLoading) ||
        (search?.isLoading ?? false);
    final failed =
        results.any((entry) => entry.blocks.hasError) ||
        (search?.hasError ?? false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (loading) const LinearProgressIndicator(),
        if (failed) Text(l10n.loadWorkoutError),
        if (showEmpty && !failed && !loading && records.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              query.isEmpty ? l10n.emptyWodBlocks : l10n.noMatchingWorkouts,
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
              repeat: repeat,
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

final _searchableWodsProvider = FutureProvider.autoDispose.family((
  ref,
  ({String sessions, String query}) key,
) async {
  for (final id in key.sessions.split(',')) {
    if (id.isNotEmpty) ref.watch(wodBlocksForSessionProvider(id));
  }
  final repository = ref.watch(wodRepositoryProvider);
  final aliases = {
    for (final entry in CrossFitCatalog.entries)
      entry.id: entry.searchableNames,
  };
  final records = await repository.searchRecords('');
  return {
    for (final record in records)
      if ([
        record.block.title,
        record.block.notes,
        record.prescription.title,
        record.prescription.rawText,
        record.result?.notes,
        for (final movement in record.prescription.movements) ...[
          movement.name,
          ...aliases[movement.movementId] ?? const <String>[],
        ],
      ].whereType<String>().any(
        (value) => value.toLowerCase().contains(key.query),
      ))
        record.block.id,
  };
});

class _WodRecordTile extends ConsumerWidget {
  const _WodRecordTile({
    required this.session,
    required this.block,
    required this.dateLabel,
    required this.repeat,
  });

  final WorkoutSession session;
  final WorkoutBlock block;
  final String dateLabel;
  final bool repeat;

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
            TimeOfDay.fromDateTime(
              DateTime.fromMillisecondsSinceEpoch(
                score?.createdAt ?? session.createdAt,
              ),
            ).format(context),
          ].join(' · '),
        ),
        trailing: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 116),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (wodScoreLabel(context, ref, score) case final label?)
                Text(label),
              if (isPr)
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: WodLogColors.prSurface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      'PR',
                      style: TextStyle(color: WodLogColors.prText),
                    ),
                  ),
                ),
            ],
          ),
        ),
        onTap: repeat
            ? () => showWodResultEditor(context, ref, block.id, repeat: true)
            : () => showWodRecordDetail(
                context,
                blockId: block.id,
                sessionId: session.id,
                title: title,
                workoutDate: session.workoutDate,
                notes: block.notes,
              ),
      ),
    );
  }
}
