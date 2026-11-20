import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import 'package:uuid/uuid.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../settings/weight_unit.dart';
import '../data/named_wod_catalog.dart';
import '../data/wod_parser.dart';
import '../data/wod_prescription.dart';
import 'localized_decimal.dart';
import '../providers/wod_providers.dart';
import 'wod_library_sheet.dart';
import 'wod_source_review_sheet.dart';

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

  Future<void> _addBlock(BuildContext context, WidgetRef ref) =>
      showWodResultEditor(
        context,
        ref,
        const Uuid().v4(),
        newSessionId: sessionId,
        initialBenchmark: initialBenchmark,
      );
}

const _types = <String>[
  'for_time',
  'amrap',
  'emom',
  'rounds_reps',
  'load',
  'reps',
  'distance',
  'calories',
  'points',
  'other',
];

String wodTypeLabel(AppLocalizations l10n, String type) => switch (type) {
  'for_time' || 'time' => l10n.resultForTime,
  'amrap' => l10n.resultAmrap,
  'emom' || 'intervals' => l10n.resultEmom,
  'rounds_reps' || 'roundsAndReps' => l10n.resultRoundsReps,
  'load' || 'weight' => l10n.resultLoad,
  'reps' => l10n.wodCompletedReps,
  'distance' => 'm',
  'calories' => 'cal',
  'points' => l10n.localeName.startsWith('ko') ? '점수' : 'Points',
  _ => l10n.resultOther,
};

Future<void> showWodResultEditor(
  BuildContext context,
  WidgetRef ref,
  String blockId, {
  bool repeat = false,
  String? newSessionId,
  String? initialBenchmark,
}) async {
  final repository = ref.read(wodRepositoryProvider);
  final l10n = AppLocalizations.of(context)!;
  final number = NumberFormat.decimalPattern(
    Localizations.localeOf(context).toString(),
  );
  final unit = ref.read(weightUnitProvider).value ?? WeightUnit.kg;
  final isNew = newSessionId != null;
  final record = isNew ? null : await repository.getRecord(blockId);
  if ((!isNew && record == null) || !context.mounted) return;
  final result = repeat ? null : record?.result;
  final attemptId = repeat ? const Uuid().v4() : blockId;
  final workoutDate = DateFormat('yyyy-MM-dd', 'en').format(DateTime.now());

  WodPrescription benchmarkDraft(String title) {
    for (final benchmark in NamedWodCatalog.prescriptions()) {
      if (benchmark.draft.title == title) return benchmark.draft;
    }
    return WodPrescription(title: title);
  }

  String typeFor(WodScoreKind kind) => switch (kind) {
    WodScoreKind.roundsAndReps => 'amrap',
    WodScoreKind.intervals => 'emom',
    WodScoreKind.weight => 'load',
    WodScoreKind.unknown || WodScoreKind.time => 'for_time',
    WodScoreKind.reps => 'reps',
    WodScoreKind.distance => 'distance',
    WodScoreKind.calories => 'calories',
    WodScoreKind.points => 'points',
  };

  var title = record?.block.title ?? initialBenchmark ?? '';
  var prescription = record?.prescription ?? benchmarkDraft(title);
  if (repeat) prescription = NamedWodCatalog.repeatDraft(prescription);
  final template = NamedWodCatalog.find(title);
  if (template != null &&
      record?.block.notes == '${template.format} · ${template.prescription}' &&
      prescription.structure == WodStructure.unknown &&
      prescription.scoreKind == WodScoreKind.unknown) {
    prescription = benchmarkDraft(title);
  }
  final originalType = switch (result?.resultType) {
    'time' => 'for_time',
    'roundsAndReps' => 'amrap',
    'intervals' => 'emom',
    'weight' => 'load',
    final type => type,
  };
  final availableTypes = [
    ..._types.where((type) => (!repeat && !isNew) || type != 'other'),
    if (originalType != null && !_types.contains(originalType)) originalType,
  ];
  var type = originalType ?? typeFor(prescription.scoreKind);
  var titleRevision = 0;
  var typeRevision = 0;
  final korean = l10n.localeName.startsWith('ko');
  var version = prescription.version;
  var score = result?.resultText ?? '';
  final hasPreviousScore = score.trim().isNotEmpty;
  var usePreviousScore = hasPreviousScore;
  var secondScore = '';
  var ending = _WodEnding.finished;
  var invalid = false;

  int? whole(String text) {
    final value = parseLocalizedDecimal(text, number);
    return value != null && value <= 2147483647 && value == value.truncate()
        ? value.toInt()
        : null;
  }

  String? validatedScore() {
    if (usePreviousScore || type == 'other' || !_types.contains(type)) {
      return score.trim().isEmpty ? null : score.trim();
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
    if (type == 'distance' || type == 'points') {
      return parseLocalizedDecimal(score, number)?.toString();
    }
    if (type == 'load') {
      final value = parseLocalizedDecimal(score, number);
      return value != null && value > 0 ? '$value ${unit.name}' : null;
    }
    final first = whole(score);
    if (first == null) return null;
    if (type == 'for_time') return 'CAP · $first reps';
    if (type == 'reps' || type == 'calories') return '$first';
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
    title: repeat
        ? (korean ? '다시 기록' : 'Record again')
        : result == null
        ? l10n.addWodResult
        : l10n.editWodResult,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (isNew) ...[
            TextFormField(
              key: ValueKey(('title', titleRevision)),
              initialValue: title,
              enabled: !saving,
              decoration: InputDecoration(labelText: l10n.wodName),
              onChanged: (value) => title = value,
            ),
            OutlinedButton(
              onPressed: saving
                  ? null
                  : () async {
                      final template = await showWodLibrary(context);
                      if (template == null || !context.mounted) return;
                      setState(() {
                        title = template.name;
                        titleRevision++;
                        prescription = benchmarkDraft(title);
                        version = prescription.version;
                        type = typeFor(prescription.scoreKind);
                        typeRevision++;
                        score = '';
                        secondScore = '';
                        ending = _WodEnding.finished;
                        invalid = false;
                      });
                    },
              child: Text(l10n.chooseBenchmark),
            ),
          ],
          DropdownButtonFormField<String>(
            key: ValueKey(typeRevision),
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
          if (prescription.movements.isNotEmpty)
            DropdownButtonFormField<WodVersion>(
              initialValue: version,
              decoration: InputDecoration(
                labelText: korean ? '수행 기준' : 'Workout standard',
              ),
              items: [
                for (final item in WodVersion.values)
                  DropdownMenuItem(
                    value: item,
                    child: Text(switch (item) {
                      WodVersion.unknown => korean ? '미확인' : 'Unconfirmed',
                      WodVersion.rx => 'Rx',
                      WodVersion.scaled => 'Scaled',
                      WodVersion.foundations => 'Foundations',
                      WodVersion.custom => korean ? '직접 설정' : 'Custom',
                    }),
                  ),
              ],
              onChanged: saving
                  ? null
                  : (value) {
                      if (value != null) setState(() => version = value);
                    },
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
              key: ValueKey((typeRevision, type, ending, usePreviousScore)),
              initialValue: score,
              enabled: !saving,
              keyboardType: switch ((type, usePreviousScore, ending)) {
                (_, true, _) ||
                ('other', _, _) ||
                ('for_time', _, _WodEnding.finished) => TextInputType.text,
                ('load' || 'distance' || 'points', _, _) =>
                  const TextInputType.numberWithOptions(decimal: true),
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
                        'reps' ||
                        'distance' ||
                        'calories' ||
                        'points' => wodTypeLabel(l10n, type),
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
                      prescription = const WodTextParser().parsePrescription(
                        source,
                        title: title,
                      );
                      version = prescription.version;
                      if (isNew &&
                          prescription.scoreKind != WodScoreKind.unknown) {
                        type = typeFor(prescription.scoreKind);
                        typeRevision++;
                        score = '';
                        secondScore = '';
                        ending = _WodEnding.finished;
                        invalid = false;
                      }
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
                    if (confirmedScore == null ||
                        (isNew && title.trim().isEmpty)) {
                      setState(() => invalid = true);
                      return;
                    }
                    setState(() {
                      invalid = false;
                      saving = true;
                      failed = false;
                    });
                    try {
                      final kind = switch (type) {
                        'for_time' => WodScoreKind.time,
                        'amrap' || 'rounds_reps' => WodScoreKind.roundsAndReps,
                        'emom' => WodScoreKind.intervals,
                        'load' => WodScoreKind.weight,
                        'reps' => WodScoreKind.reps,
                        'distance' => WodScoreKind.distance,
                        'calories' => WodScoreKind.calories,
                        'points' => WodScoreKind.points,
                        _ => WodScoreKind.unknown,
                      };
                      final definition = WodPrescription.fromJson({
                        ...prescription.toJson(),
                        if (isNew) 'title': title.trim(),
                        'scoreKind': kind.name,
                        'version': version.name,
                      });
                      if (usePreviousScore &&
                          result?.outcome != null &&
                          prescription.scoreKind == kind) {
                        await repository.saveStructuredResult(
                          blockId: blockId,
                          prescription: definition,
                          score: WodAttemptScore(
                            outcome: WodOutcome.values.byName(result!.outcome!),
                            elapsedMs: result.durationMs,
                            rounds: result.rounds?.toInt(),
                            reps: result.extraReps,
                            value: result.scoreValue,
                            tieBreakMs: result.tieBreakMs,
                            text: confirmedScore,
                            notes: notes.trim(),
                          ),
                        );
                      } else if (!usePreviousScore &&
                          kind != WodScoreKind.unknown) {
                        final time = confirmedScore.split(':');
                        final attemptScore = WodAttemptScore(
                          outcome: type == 'for_time'
                              ? switch (ending) {
                                  _WodEnding.finished => WodOutcome.completed,
                                  _WodEnding.capped => WodOutcome.capped,
                                  _WodEnding.stopped => WodOutcome.stopped,
                                }
                              : WodOutcome.completed,
                          elapsedMs:
                              kind == WodScoreKind.time &&
                                  ending == _WodEnding.finished
                              ? (int.parse(time.first) * 60 +
                                        int.parse(time.last)) *
                                    1000
                              : null,
                          rounds: kind == WodScoreKind.roundsAndReps
                              ? whole(score)
                              : null,
                          reps: kind == WodScoreKind.roundsAndReps
                              ? whole(secondScore)
                              : kind == WodScoreKind.reps ||
                                    (kind == WodScoreKind.time &&
                                        ending == _WodEnding.capped)
                              ? whole(score)
                              : null,
                          value: switch (kind) {
                            WodScoreKind.intervals ||
                            WodScoreKind.calories => whole(score)?.toDouble(),
                            WodScoreKind.weight => unit.toKg(
                              parseLocalizedDecimal(score, number)!,
                            ),
                            WodScoreKind.distance || WodScoreKind.points =>
                              parseLocalizedDecimal(score, number),
                            _ => null,
                          },
                          text: confirmedScore,
                          notes: notes.trim(),
                        );
                        if (newSessionId != null) {
                          await repository.saveConfirmed(
                            attemptId: attemptId,
                            sessionId: newSessionId,
                            sortOrder: await repository.nextWodSortOrder(
                              newSessionId,
                            ),
                            prescription: definition,
                            score: attemptScore,
                          );
                        } else if (repeat) {
                          await repository.saveRepeat(
                            attemptId: attemptId,
                            workoutDate: workoutDate,
                            prescription: definition,
                            score: attemptScore,
                          );
                        } else {
                          await repository.saveStructuredResult(
                            blockId: blockId,
                            prescription: definition,
                            score: attemptScore,
                          );
                        }
                      } else {
                        await repository.saveResult(
                          blockId: blockId,
                          resultType: type,
                          resultText: confirmedScore,
                          notes: notes,
                        );
                      }
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
