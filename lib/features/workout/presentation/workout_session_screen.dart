import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/database/app_database.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'wod_blocks_section.dart';
import '../providers/workout_providers.dart';

class WorkoutSessionScreen extends ConsumerWidget {
  const WorkoutSessionScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final blocks = ref.watch(blocksForSessionProvider(sessionId));
    final session = ref.watch(workoutSessionProvider(sessionId));

    return Scaffold(
      appBar: AppBar(
        title: Text(session.value?.title ?? l10n.workoutLog),
        actions: [
          if (session.value != null)
            PopupMenuButton<String>(
              onSelected: (action) {
                if (action == 'edit') {
                  _editSession(context, ref, session.value!);
                } else if (action == 'delete') {
                  _deleteSession(context, ref);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 'edit', child: Text(l10n.editSession)),
                PopupMenuItem(value: 'delete', child: Text(l10n.deleteSession)),
              ],
            ),
        ],
      ),
      body: Column(
        children: [
          if (session.value?.notes case final notes?)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(notes),
              ),
            ),
          Expanded(
            child: blocks.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text(l10n.loadBlocksError)),
              data: (items) => ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                children: [
                  WodBlocksSection(sessionId: sessionId),
                  if (items.isEmpty) const _EmptyBlocksState(),
                  for (final item in items) _WorkoutBlockCard(block: item),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addBlock(context, ref, blocks.value?.length ?? 0),
        icon: const Icon(Icons.add),
        label: Text(l10n.addStrengthBlock),
      ),
    );
  }

  Future<void> _addBlock(
    BuildContext context,
    WidgetRef ref,
    int sortOrder,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final title = await _showTextDialog(
      context,
      title: l10n.addBlockTitle,
      label: l10n.blockName,
      initialValue: l10n.strength,
    );
    if (title == null || title.trim().isEmpty || !context.mounted) return;

    await ref
        .read(workoutRepositoryProvider)
        .createStrengthBlock(
          sessionId: sessionId,
          title: title,
          sortOrder: sortOrder,
        );
  }

  Future<void> _editSession(
    BuildContext context,
    WidgetRef ref,
    WorkoutSession session,
  ) async {
    final values = await _showSessionEditDialog(context, session);
    if (values == null || !context.mounted) return;
    await ref
        .read(workoutRepositoryProvider)
        .updateSession(
          sessionId: sessionId,
          title: values.$1,
          notes: values.$2,
        );
  }

  Future<void> _deleteSession(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.deleteSession),
        content: Text(l10n.confirmDeleteSession),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.deleteSession),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    await ref.read(workoutRepositoryProvider).deleteSession(sessionId);
    if (context.mounted) context.go('/');
  }
}

Future<(String, String)?> _showSessionEditDialog(
  BuildContext context,
  WorkoutSession session,
) async {
  final l10n = AppLocalizations.of(context)!;
  final titleController = TextEditingController(text: session.title ?? '');
  final notesController = TextEditingController(text: session.notes ?? '');
  final values = await showDialog<(String, String)>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(l10n.editSession),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: l10n.sessionTitle),
            textCapitalization: TextCapitalization.sentences,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: notesController,
            decoration: InputDecoration(labelText: l10n.sessionNotes),
            minLines: 2,
            maxLines: 4,
            textCapitalization: TextCapitalization.sentences,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () =>
              Navigator.of(dialogContext)
                  .pop((titleController.text, notesController.text)),
          child: Text(l10n.save),
        ),
      ],
    ),
  );
  titleController.dispose();
  notesController.dispose();
  return values;
}

class _WorkoutBlockCard extends ConsumerWidget {
  const _WorkoutBlockCard({required this.block});

  final WorkoutBlock block;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final exercises = ref.watch(exercisesForBlockProvider(block.id));

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    block.title ?? l10n.strength,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                TextButton.icon(
                  onPressed: () =>
                      _addExercise(context, ref, exercises.value?.length ?? 0),
                  icon: const Icon(Icons.add),
                  label: Text(l10n.addExercise),
                ),
              ],
            ),
            const SizedBox(height: 8),
            exercises.when(
              loading: () => const LinearProgressIndicator(),
              error: (error, stackTrace) => Text(l10n.loadExercisesError),
              data: (items) => items.isEmpty
                  ? Text(l10n.emptyBlockHelp)
                  : Column(
                      children: [
                        for (final exercise in items)
                          _ExerciseCard(exercise: exercise),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addExercise(
    BuildContext context,
    WidgetRef ref,
    int sortOrder,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final name = await _showTextDialog(
      context,
      title: l10n.addExercise,
      label: l10n.exerciseName,
      hint: l10n.exerciseHint,
    );
    if (name == null || name.trim().isEmpty || !context.mounted) return;

    await ref
        .read(workoutRepositoryProvider)
        .addExercise(blockId: block.id, name: name, sortOrder: sortOrder);
  }
}

class _ExerciseCard extends ConsumerWidget {
  const _ExerciseCard({required this.exercise});

  final WorkoutExercise exercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final sets = ref.watch(setsForExerciseProvider(exercise.id));

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      exercise.displayName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.addSet,
                    onPressed: () => _addSet(context, ref),
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              sets.when(
                loading: () => const LinearProgressIndicator(),
                error: (error, stackTrace) => Text(l10n.loadSetsError),
                data: (items) => items.isEmpty
                    ? Text(l10n.emptyExerciseHelp)
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final set in items)
                            InputChip(
                              label: Text(
                                l10n.setSummary(
                                  l10n.setLabel(set.setNumber),
                                  _formatWeight(set.weightKg, l10n, locale),
                                  set.reps ?? 0,
                                ),
                              ),
                              onPressed: () => _editSet(context, ref, set),
                              onDeleted: () => _deleteSet(context, ref, set),
                            ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addSet(BuildContext context, WidgetRef ref) async {
    final values = await _showSetDialog(context);
    if (values == null || !context.mounted) return;

    await ref
        .read(workoutRepositoryProvider)
        .addSet(
          workoutExerciseId: exercise.id,
          weightKg: values.$1,
          reps: values.$2,
        );
  }

  Future<void> _editSet(
    BuildContext context,
    WidgetRef ref,
    PerformedSet set,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final values = await _showSetDialog(
      context,
      title: l10n.editSet,
      initialWeightKg: set.weightKg,
      initialReps: set.reps,
    );
    if (values == null || !context.mounted) return;
    await ref
        .read(workoutRepositoryProvider)
        .updateSet(setId: set.id, weightKg: values.$1, reps: values.$2);
  }

  Future<void> _deleteSet(
    BuildContext context,
    WidgetRef ref,
    PerformedSet set,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.deleteSet),
        content: Text(l10n.confirmDeleteSet),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.deleteSet),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    await ref.read(workoutRepositoryProvider).deleteSet(set.id);
  }
}

Future<String?> _showTextDialog(
  BuildContext context, {
  required String title,
  required String label,
  String? hint,
  String? initialValue,
}) async {
  final l10n = AppLocalizations.of(context)!;
  final controller = TextEditingController(text: initialValue);
  final value = await showDialog<String>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(labelText: label, hintText: hint),
        textCapitalization: TextCapitalization.sentences,
        onSubmitted: (value) => Navigator.of(dialogContext).pop(value),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(dialogContext).pop(controller.text),
          child: Text(l10n.add),
        ),
      ],
    ),
  );
  controller.dispose();
  return value;
}

Future<(double, int)?> _showSetDialog(
  BuildContext context, {
  String? title,
  double? initialWeightKg,
  int? initialReps,
}) async {
  final l10n = AppLocalizations.of(context)!;
  final locale = Localizations.localeOf(context).toString();
  final numberFormat = NumberFormat.decimalPattern(locale);
  final weightController = TextEditingController(
    text: initialWeightKg == null ? '' : numberFormat.format(initialWeightKg),
  );
  final repsController = TextEditingController(
    text: initialReps?.toString() ?? '',
  );
  String? validationError;
  final values = await showDialog<(double, int)>(
    context: context,
    builder: (dialogContext) => StatefulBuilder(
      builder: (dialogContext, setDialogState) => AlertDialog(
        title: Text(title ?? l10n.addSet),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: weightController,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(labelText: l10n.weightKg),
            ),
            TextField(
              controller: repsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: l10n.reps),
            ),
            if (validationError != null) ...[
              const SizedBox(height: 8),
              Text(
                validationError!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              final numberFormat = NumberFormat.decimalPattern(locale);
              final weight = _tryParseLocalizedNumber(
                weightController.text,
                numberFormat,
              );
              final repsValue = _tryParseLocalizedNumber(
                repsController.text,
                numberFormat,
              );
              final reps =
                  repsValue != null && repsValue == repsValue.roundToDouble()
                  ? repsValue.toInt()
                  : null;
              if (weight == null ||
                  !weight.isFinite ||
                  weight < 0 ||
                  reps == null ||
                  reps <= 0) {
                setDialogState(() => validationError = l10n.invalidSet);
                return;
              }
              Navigator.of(dialogContext).pop((weight, reps));
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    ),
  );
  weightController.dispose();
  repsController.dispose();
  return values;
}

double? _tryParseLocalizedNumber(String value, NumberFormat format) {
  try {
    return format.parse(value.trim()).toDouble();
  } on FormatException {
    return null;
  }
}

String _formatWeight(double? weight, AppLocalizations l10n, String locale) =>
    weight == null
    ? l10n.bodyweight
    : NumberFormat.decimalPattern(locale).format(weight);

class _EmptyBlocksState extends StatelessWidget {
  const _EmptyBlocksState();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(l10n.emptyBlocks, textAlign: TextAlign.center),
      ),
    );
  }
}
