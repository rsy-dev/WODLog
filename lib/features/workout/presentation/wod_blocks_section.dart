import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;

import '../../../app/wodlog_sheet.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../settings/weight_unit.dart';
import '../data/named_wod_catalog.dart';
import 'localized_decimal.dart';
import '../providers/workout_providers.dart';
import '../providers/wod_providers.dart';
import 'wod_library_sheet.dart';
import 'wod_source_review_sheet.dart';
import 'workout_dialog.dart';

class WodBlocksSection extends ConsumerWidget {
  const WodBlocksSection({
    super.key,
    required this.sessionId,
    this.initialBenchmark,
  });

  final String sessionId;
  final String? initialBenchmark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final blocks = ref.watch(wodBlocksForSessionProvider(sessionId));
    return blocks.when(
      loading: () => const LinearProgressIndicator(),
      error: (error, stack) => Text(l10n.loadBlocksError),
      data: (items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (items.isNotEmpty)
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.wodSectionTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                IconButton(
                  tooltip: l10n.addWodBlock,
                  onPressed: () => _addBlock(context, ref),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          if (items.isEmpty)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: () => _addBlock(context, ref),
                icon: const Icon(Icons.add),
                label: Text(initialBenchmark ?? l10n.addWodBlock),
              ),
            )
          else
            for (final block in items)
              _WodBlockTile(
                blockId: block.id,
                title: block.title ?? l10n.wodSectionTitle,
                notes: block.notes,
                labelFor: (type) => wodTypeLabel(l10n, type),
                onEdit: () => showWodResultEditor(context, ref, block.id),
              ),
        ],
      ),
    );
  }

  Future<void> _addBlock(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController(text: initialBenchmark);
    final title = await showWorkoutDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        title: Text(l10n.addWodBlock),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: l10n.wodName),
          textCapitalization: TextCapitalization.sentences,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final template = await showWodLibrary(context);
              if (template != null && context.mounted) {
                controller.text = template.name;
              }
            },
            child: Text(l10n.chooseBenchmark),
          ),
          FilledButton(
            onPressed: () {
              final name = controller.text.trim();
              if (name.isNotEmpty) Navigator.pop(context, name);
            },
            child: Text(l10n.add),
          ),
        ],
      ),
    );
    controller.dispose();
    if (!context.mounted || title == null) return;
    final count =
        ref.read(blocksForSessionProvider(sessionId)).asData?.value.length ?? 0;
    final repository = ref.read(wodRepositoryProvider);
    final template = NamedWodCatalog.find(title);
    if (template != null) {
      await repository.createNamedWod(
        sessionId: sessionId,
        template: template,
        sortOrder: count,
      );
    } else {
      await repository.createWodBlock(
        sessionId: sessionId,
        title: title,
        sortOrder: count,
      );
    }
  }
}

const _types = <String>[
  'for_time',
  'amrap',
  'emom',
  'rounds_reps',
  'load',
  'other',
];

String wodTypeLabel(AppLocalizations l10n, String type) => switch (type) {
  'for_time' => l10n.resultForTime,
  'amrap' => l10n.resultAmrap,
  'emom' => l10n.resultEmom,
  'rounds_reps' => l10n.resultRoundsReps,
  'load' => l10n.resultLoad,
  _ => l10n.resultOther,
};

Future<void> showWodResultEditor(
  BuildContext context,
  WidgetRef ref,
  String blockId,
) async {
  final repository = ref.read(wodRepositoryProvider);
  final l10n = AppLocalizations.of(context)!;
  final number = NumberFormat.decimalPattern(
    Localizations.localeOf(context).toString(),
  );
  final unit = ref.read(weightUnitProvider).value ?? WeightUnit.kg;
  final result = await ref.read(wodResultProvider(blockId).future);
  if (!context.mounted) return;
  final originalType = result?.resultType;
  final availableTypes = [
    ..._types,
    if (originalType != null && !_types.contains(originalType)) originalType,
  ];
  var type = originalType ?? _types.first;
  var score = result?.resultText ?? '';
  final hasPreviousScore = score.trim().isNotEmpty;
  var usePreviousScore = hasPreviousScore;
  var secondScore = '';
  var ending = _WodEnding.finished;
  var invalid = false;

  String? validatedScore() {
    if (usePreviousScore || type == 'other' || !_types.contains(type)) {
      return score.trim().isEmpty ? null : score.trim();
    }
    int? whole(String text) {
      final value = parseLocalizedDecimal(text, number);
      return value != null && value <= 2147483647 && value == value.truncate()
          ? value.toInt()
          : null;
    }

    if (type == 'for_time' && ending == _WodEnding.stopped) return 'DNF';
    if (type == 'for_time' && ending == _WodEnding.finished) {
      final parts = score.trim().split(':');
      if (parts.length != 2) return null;
      final minutes = whole(parts.first);
      final seconds = whole(parts.last);
      if (minutes == null ||
          seconds == null ||
          seconds >= 60 ||
          (minutes == 0 && seconds == 0)) {
        return null;
      }
      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    }
    if (type == 'load') {
      final value = parseLocalizedDecimal(score, number);
      return value != null && value > 0 ? '$value ${unit.name}' : null;
    }
    final first = whole(score);
    if (first == null) return null;
    if (type == 'for_time') return 'CAP · $first reps';
    if (type == 'emom') return '$first intervals';
    final second = whole(secondScore);
    return second == null ? null : '$first + $second';
  }

  var notes = result?.notes ?? '';
  var notesRevision = 0;
  final appliedSources = <String>{};
  var saving = false;
  var failed = false;
  await showWodLogSheet<void>(
    context: context,
    title: result == null ? l10n.addWodResult : l10n.editWodResult,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<String>(
            initialValue: type,
            isExpanded: true,
            decoration: InputDecoration(labelText: l10n.wodResultType),
            items: [
              for (final item in availableTypes)
                DropdownMenuItem(
                  value: item,
                  child: Text(wodTypeLabel(l10n, item)),
                ),
            ],
            onChanged: saving
                ? null
                : (value) => setState(() {
                    if (value == null || type == value) return;
                    type = value;
                    ending = _WodEnding.finished;
                    invalid = false;
                    usePreviousScore = false;
                    score = '';
                    secondScore = '';
                  }),
          ),
          const SizedBox(height: 12),
          if (type == 'for_time' && !usePreviousScore)
            DropdownButtonFormField<_WodEnding>(
              initialValue: ending,
              items: [
                DropdownMenuItem(
                  value: _WodEnding.finished,
                  child: Text(l10n.wodFinished),
                ),
                DropdownMenuItem(
                  value: _WodEnding.capped,
                  child: Text(l10n.wodCapped),
                ),
                DropdownMenuItem(
                  value: _WodEnding.stopped,
                  child: Text(l10n.wodStopped),
                ),
              ],
              decoration: InputDecoration(labelText: l10n.wodEnding),
              onChanged: saving
                  ? null
                  : (value) => setState(() {
                      if (value == null || value == ending) return;
                      ending = value;
                      score = '';
                      invalid = false;
                    }),
            ),
          if (usePreviousScore ||
              type != 'for_time' ||
              ending != _WodEnding.stopped)
            TextFormField(
              key: ValueKey((type, ending, usePreviousScore)),
              initialValue: score,
              enabled: !saving,
              keyboardType: switch ((type, usePreviousScore, ending)) {
                (_, true, _) ||
                ('other', _, _) ||
                ('for_time', _, _WodEnding.finished) => TextInputType.text,
                ('load', _, _) => const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                _ when _types.contains(type) => TextInputType.number,
                _ => TextInputType.text,
              },
              decoration: InputDecoration(
                labelText: usePreviousScore
                    ? l10n.wodScore
                    : switch (type) {
                        'for_time' when ending == _WodEnding.finished =>
                          l10n.wodFinishTime,
                        'for_time' => l10n.wodCompletedReps,
                        'amrap' || 'rounds_reps' => l10n.wodCompletedRounds,
                        'emom' => l10n.wodCompletedIntervals,
                        'load' => l10n.setWeight(unit.name),
                        _ => l10n.wodScore,
                      },
              ),
              onChanged: (value) => score = value,
            ),
          if (!usePreviousScore && (type == 'amrap' || type == 'rounds_reps'))
            TextFormField(
              key: ValueKey(type),
              initialValue: secondScore,
              enabled: !saving,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: l10n.wodExtraReps),
              onChanged: (value) => secondScore = value,
            ),
          if (usePreviousScore)
            TextButton(
              onPressed: saving
                  ? null
                  : () => setState(() {
                      usePreviousScore = false;
                      score = '';
                      invalid = false;
                    }),
              child: Text(l10n.wodEnterNewScore),
            ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: saving
                ? null
                : () async {
                    final source = await showWodSourceReview(context);
                    if (!context.mounted ||
                        source == null ||
                        notes.contains(source) ||
                        !appliedSources.add(source)) {
                      return;
                    }
                    setState(() {
                      notes = [
                        if (notes.trim().isNotEmpty) notes.trim(),
                        source,
                      ].join('\n\n');
                      notesRevision++;
                    });
                  },
            child: Text(l10n.reviewWodText),
          ),
          TextFormField(
            key: ValueKey(notesRevision),
            initialValue: notes,
            enabled: !saving,
            decoration: InputDecoration(labelText: l10n.wodNotes),
            maxLines: 3,
            onChanged: (value) => notes = value,
          ),
          const SizedBox(height: 12),
          if (invalid) Text(l10n.wodInvalidScore),
          if (failed) Text(l10n.wodSaveError),
          FilledButton(
            onPressed: saving
                ? null
                : () async {
                    final confirmedScore = validatedScore();
                    if (confirmedScore == null) {
                      setState(() => invalid = true);
                      return;
                    }
                    setState(() {
                      invalid = false;
                      saving = true;
                      failed = false;
                    });
                    try {
                      await repository.saveResult(
                        blockId: blockId,
                        resultType: type,
                        resultText: confirmedScore,
                        notes: notes,
                      );
                      if (context.mounted) Navigator.pop(context);
                    } catch (_) {
                      if (context.mounted) {
                        setState(() {
                          saving = false;
                          failed = true;
                        });
                      }
                    }
                  },
            child: Text(l10n.save),
          ),
        ],
      ),
    ),
  );
}

enum _WodEnding { finished, capped, stopped }

class _WodBlockTile extends ConsumerWidget {
  const _WodBlockTile({
    required this.blockId,
    required this.title,
    required this.notes,
    required this.labelFor,
    required this.onEdit,
  });

  final String blockId;
  final String title;
  final String? notes;
  final String Function(String) labelFor;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final result = ref.watch(wodResultProvider(blockId));
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: result.when(
        loading: () => null,
        error: (error, stack) => Text(notes ?? l10n.loadBlocksError),
        data: (value) => value == null
            ? Text([notes, l10n.emptyWodResult].whereType<String>().join('\n'))
            : Text(
                [
                  notes,
                  '${labelFor(value.resultType)} · ${value.resultText ?? ''}',
                  if (value.notes?.isNotEmpty == true) value.notes!,
                ].whereType<String>().where((line) => line.isNotEmpty).join('\n'),
              ),
      ),
      trailing: IconButton(
        tooltip: l10n.editWodResult,
        icon: const Icon(Icons.edit_outlined),
        onPressed: onEdit,
      ),
    );
  }
}
