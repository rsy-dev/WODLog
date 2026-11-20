import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import 'package:uuid/uuid.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../core/database/app_database.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../settings/weight_unit.dart';
import '../data/named_wod_catalog.dart';
import '../data/wod_prescription.dart';
import 'localized_decimal.dart';
import 'wod_prescription_editor.dart';
import '../providers/wod_providers.dart';
import '../providers/workout_providers.dart';
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
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.wodSectionTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              IconButton(
                tooltip: l10n.reviewWodText,
                onPressed: () async {
                  final draft = await showWodSourceReview(context, title: '');
                  if (!context.mounted || draft == null) return;
                  await showWodResultEditor(
                    context,
                    ref,
                    const Uuid().v4(),
                    newSessionId: sessionId,
                    initialDraft: draft,
                  );
                },
                icon: const Icon(Icons.content_paste),
              ),
              if (items.isNotEmpty)
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

String? wodScoreLabel(BuildContext context, WidgetRef ref, WodResult? result) {
  if (result == null) return null;
  final kg = result.scoreValue;
  if (result.outcome != null &&
      (result.resultType == 'weight' || result.resultType == 'load') &&
      kg != null) {
    final unit = ref.watch(weightUnitProvider).value ?? WeightUnit.kg;
    final locale = Localizations.localeOf(context).toString();
    return unit.format(kg, NumberFormat.decimalPattern(locale));
  }
  return result.resultText;
}

Future<void> showWodResultEditor(
  BuildContext context,
  WidgetRef ref,
  String blockId, {
  bool repeat = false,
  String? newSessionId,
  String? newWorkoutDate,
  WodPrescription? initialDraft,
  String? initialBenchmark,
}) async {
  final repository = ref.read(wodRepositoryProvider);
  final l10n = AppLocalizations.of(context)!;
  final number = NumberFormat.decimalPattern(
    Localizations.localeOf(context).toString(),
  );
  final unit = ref.read(weightUnitProvider).value ?? WeightUnit.kg;
  final isNew = newSessionId != null || newWorkoutDate != null;
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

  var title =
      record?.block.title ?? initialBenchmark ?? initialDraft?.title ?? '';
  var prescription =
      record?.prescription ?? initialDraft ?? benchmarkDraft(title);
  void updatePrescription(Map<String, Object?> changes) {
    prescription = WodPrescription.fromJson({
      ...prescription.toJson(),
      ...changes,
    });
  }

  void updateMovements(List<WodMovementPrescription> movements) {
    updatePrescription({
      'movements': movements.map((item) => item.toJson()).toList(),
    });
  }

  void moveMovement(int from, int to) {
    final movements = [...prescription.movements];
    final item = movements.removeAt(from);
    movements.insert(to, item);
    updateMovements(movements);
  }

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
  var version = prescription.version;
  var score = result?.resultText ?? '';
  final hasPreviousScore = score.trim().isNotEmpty;
  var usePreviousScore = hasPreviousScore;
  var secondScore = '';
  var tieBreak = '';
  var ending = _WodEnding.finished;
  var invalid = false;
  final invalidPrescriptionFields = <String>{};

  int? whole(String text) {
    final value = parseLocalizedDecimal(text, number);
    return value != null && value <= 2147483647 && value == value.truncate()
        ? value.toInt()
        : null;
  }

  int? durationMs(String text) {
    final parts = text.trim().split(':');
    if (parts.length != 2) return null;
    final minutes = whole(parts.first);
    final seconds = whole(parts.last);
    if (minutes == null || seconds == null || seconds >= 60) return null;
    final elapsed = (minutes * 60 + seconds) * 1000;
    return elapsed > 0 ? elapsed : null;
  }

  String? validatedScore() {
    if (usePreviousScore || type == 'other' || !_types.contains(type)) {
      return score.trim().isEmpty ? null : score.trim();
    }
    final capMs = (prescription.timeCapSeconds ?? 0) * 1000;
    if (type == 'for_time' && ending == _WodEnding.stopped) return 'DNF';
    if (type == 'for_time' && ending == _WodEnding.finished) {
      final elapsed = durationMs(score);
      if (elapsed == null || (capMs > 0 && elapsed > capMs)) return null;
      final seconds = elapsed ~/ 1000;
      return '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}';
    }
    if (type == 'for_time' && tieBreak.trim().isNotEmpty) {
      final elapsed = durationMs(tieBreak);
      if (elapsed == null || (capMs > 0 && elapsed > capMs)) return null;
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
    if (type == 'emom') {
      final total = prescription.intervalCount;
      return total != null && first > total ? null : '$first intervals';
    }
    final second = whole(secondScore);
    return second == null ? null : '$first + $second';
  }

  var notes = result?.notes ?? initialDraft?.rawText ?? '';
  var notesRevision = 0;
  final appliedSources = <String>{};
  var saving = false;
  var failed = false;
  final saved = await showWodLogSheet<bool>(
    context: context,
    title: repeat
        ? (l10n.wodRecordAgain)
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
                        invalidPrescriptionFields.clear();
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
          for (final (index, movement) in prescription.movements.indexed)
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(movement.name),
              subtitle: movement.quantities.isEmpty
                  ? null
                  : Text(movement.quantities.map(number.format).join(' / ')),
              onTap: saving
                  ? null
                  : () async {
                      final edited = await editWodMovement(
                        context,
                        movement,
                        unit,
                        number,
                        index > 0
                            ? () =>
                                  setState(() => moveMovement(index, index - 1))
                            : null,
                        index < prescription.movements.length - 1
                            ? () =>
                                  setState(() => moveMovement(index, index + 1))
                            : null,
                      );
                      if (edited == null || !context.mounted) return;
                      setState(
                        () => updateMovements(
                          [...prescription.movements]..[index] = edited,
                        ),
                      );
                    },
              trailing: IconButton(
                tooltip: l10n.deleteExercise,
                onPressed: saving
                    ? null
                    : () => setState(() {
                        updateMovements(
                          [...prescription.movements]..removeAt(index),
                        );
                      }),
                icon: const Icon(Icons.remove_circle_outline),
              ),
            ),
          OutlinedButton(
            onPressed: saving
                ? null
                : () async {
                    final movement = await pickWodMovement(context);
                    if (movement == null || !context.mounted) return;
                    setState(
                      () => updateMovements([
                        ...prescription.movements,
                        movement,
                      ]),
                    );
                  },
            child: Text(l10n.addExercise),
          ),
          if (isNew || repeat || prescription.movements.isNotEmpty)
            DropdownButtonFormField<WodVersion>(
              initialValue: version,
              decoration: InputDecoration(labelText: l10n.wodWorkoutStandard),
              items: [
                for (final item in WodVersion.values)
                  DropdownMenuItem(
                    value: item,
                    child: Text(switch (item) {
                      WodVersion.unknown => l10n.wodUnconfirmedStandard,
                      WodVersion.rx => 'Rx',
                      WodVersion.scaled => 'Scaled',
                      WodVersion.foundations => 'Foundations',
                      WodVersion.custom => l10n.wodCustomStandard,
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
          if (!usePreviousScore &&
              type == 'for_time' &&
              ending == _WodEnding.capped)
            TextFormField(
              initialValue: tieBreak,
              enabled: !saving,
              decoration: InputDecoration(labelText: l10n.wodTiebreak),
              onChanged: (value) => tieBreak = value,
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
          ExpansionTile(
            key: ValueKey(('prescription', titleRevision, notesRevision)),
            title: Text(l10n.wodPrescription),
            children: [
              DropdownButtonFormField<WodStructure>(
                initialValue: prescription.structure,
                decoration: InputDecoration(labelText: l10n.wodSectionTitle),
                items: [
                  for (final structure in WodStructure.values)
                    DropdownMenuItem(
                      value: structure,
                      child: Text(switch (structure) {
                        WodStructure.forTime => l10n.resultForTime,
                        WodStructure.amrap => l10n.resultAmrap,
                        WodStructure.emom => l10n.resultEmom,
                        WodStructure.intervals => l10n.wodIntervals,
                        WodStructure.other => l10n.resultOther,
                        WodStructure.unknown => l10n.wodUnconfirmedStandard,
                      }),
                    ),
                ],
                onChanged: saving
                    ? null
                    : (value) {
                        if (value != null) {
                          updatePrescription({'structure': value.name});
                        }
                      },
              ),
              for (final (field, label, value) in [
                ('rounds', l10n.wodTotalRounds, prescription.rounds),
                (
                  'timeCapSeconds',
                  l10n.wodTimeCapSeconds,
                  prescription.timeCapSeconds,
                ),
                (
                  'durationSeconds',
                  l10n.wodDurationSeconds,
                  prescription.durationSeconds,
                ),
                (
                  'intervalCount',
                  l10n.wodTotalIntervals,
                  prescription.intervalCount,
                ),
                (
                  'intervalSeconds',
                  l10n.wodIntervalLengthSeconds,
                  prescription.intervalSeconds,
                ),
              ])
                TextFormField(
                  initialValue: value == null ? '' : number.format(value),
                  enabled: !saving,
                  decoration: InputDecoration(labelText: label),
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    final amount = whole(text);
                    if (text.trim().isNotEmpty &&
                        (amount == null || amount == 0)) {
                      invalidPrescriptionFields.add(field);
                    } else {
                      invalidPrescriptionFields.remove(field);
                      updatePrescription({field: amount});
                    }
                  },
                ),
              if (prescription.unparsedLines.isNotEmpty) ...[
                Text(l10n.unreadWodLines),
                for (final line in prescription.unparsedLines) Text(line),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.wodUnreadLinesConfirmed),
                  value: false,
                  onChanged: saving
                      ? null
                      : (_) => setState(() {
                          updatePrescription({'unparsedLines': <String>[]});
                        }),
                ),
              ],
            ],
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
                    final draft = await showWodSourceReview(
                      context,
                      title: title,
                    );
                    final source = draft?.rawText;
                    if (!context.mounted ||
                        draft == null ||
                        source == null ||
                        source == prescription.rawText ||
                        !appliedSources.add(source)) {
                      return;
                    }
                    setState(() {
                      prescription = draft;
                      invalidPrescriptionFields.clear();
                      version = prescription.version;
                      if (prescription.scoreKind != WodScoreKind.unknown) {
                        usePreviousScore = false;
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
                        invalidPrescriptionFields.isNotEmpty ||
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
                              ? durationMs(score)
                              : null,
                          tieBreakMs:
                              kind == WodScoreKind.time &&
                                  ending == _WodEnding.capped
                              ? durationMs(tieBreak)
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
                        } else if (repeat || newWorkoutDate != null) {
                          await repository.saveRepeat(
                            attemptId: attemptId,
                            workoutDate: newWorkoutDate ?? workoutDate,
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
                      if (context.mounted) Navigator.pop(context, true);
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
  if (saved != true || !context.mounted || (!isNew && !repeat)) return;
  final sessionId = newSessionId ?? attemptId;
  await showWodRecordDetail(
    context,
    blockId: attemptId,
    sessionId: sessionId,
    title: repeat ? prescription.title : title.trim(),
    showSessionLink: newSessionId == null,
  );
}

Future<void> showWodRecordDetail(
  BuildContext thisContext, {
  required String blockId,
  required String sessionId,
  required String title,
  String? date,
  String? notes,
  bool showSessionLink = true,
}) async {
  final l10n = AppLocalizations.of(thisContext)!;
  await showWodLogSheet<void>(
    context: thisContext,
    title: title,
    builder: (_) => Consumer(
      builder: (context, ref, _) {
        final score = ref.watch(wodResultProvider(blockId));
        final blocks = ref.watch(wodBlocksForSessionProvider(sessionId));
        final record = ref.watch(
          _detailRecordProvider((blockId, blocks.value)),
        );
        final prescription = record.value?.prescription;
        final bests = ref.watch(wodPersonalBestsProvider).value ?? [];
        final isPr = bests.any(
          (group) =>
              group.improvements.any((record) => record.block.id == blockId),
        );
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (date != null) Text(date),
            if (prescription != null) ...[
              Text(prescription.version.name),
              for (final movement in prescription.movements)
                Text(
                  [
                    movement.name,
                    if (movement.quantities.isNotEmpty)
                      '${movement.quantities.join(' / ')} ${movement.unit.name}',
                    if (movement.weightKg case final kg?)
                      (ref.watch(weightUnitProvider).value ?? WeightUnit.kg)
                          .format(
                            kg,
                            NumberFormat.decimalPattern(l10n.localeName),
                          ),
                    ?movement.standard,
                  ].join(' · '),
                ),
            ],
            if (isPr) Text(l10n.wodNewPersonalRecord),
            if (notes case final blockNotes?)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(blockNotes),
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
                      wodScoreLabel(context, ref, result) ??
                          l10n.emptyWodResult,
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
              onPressed: () => showWodResultEditor(context, ref, blockId),
              child: Text(l10n.editWodResult),
            ),
            OutlinedButton(
              onPressed: () =>
                  showWodResultEditor(context, ref, blockId, repeat: true),
              child: Text(l10n.wodRecordAgain),
            ),
            OutlinedButton(
              onPressed: () async {
                final repository = ref.read(workoutRepositoryProvider);
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: Text(l10n.wodDeleteRecord),
                    content: Text(title),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext, false),
                        child: Text(l10n.cancel),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(dialogContext, true),
                        child: Text(l10n.wodDeleteRecord),
                      ),
                    ],
                  ),
                );
                if (confirmed != true || !context.mounted) return;
                try {
                  await repository.deleteStrengthBlock(blockId);
                  if (context.mounted) Navigator.pop(context);
                } catch (_) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(l10n.wodSaveError)));
                  }
                }
              },
              child: Text(l10n.wodDeleteRecord),
            ),
            if (showSessionLink)
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (thisContext.mounted) {
                    thisContext.push('/sessions/$sessionId');
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

final _detailRecordProvider = FutureProvider.autoDispose.family(
  (ref, (String, List<WorkoutBlock>?) key) =>
      ref.watch(wodRepositoryProvider).getRecord(key.$1),
);

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
                  '${labelFor(value.resultType)} · ${wodScoreLabel(context, ref, value) ?? ''}',
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
