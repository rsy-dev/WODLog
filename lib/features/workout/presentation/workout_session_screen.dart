import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/database/app_database.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../settings/weight_unit.dart';
import '../data/crossfit_catalog.dart';
import 'localized_decimal.dart';
import 'movement_category_label.dart';
import 'wod_blocks_section.dart';
import '../providers/workout_providers.dart';
import 'workout_dialog.dart';

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
          Expanded(
            child: blocks.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text(l10n.loadBlocksError)),
              data: (items) => ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (session.value case final record?) ...[
                    _SessionHeader(session: record),
                    const SizedBox(height: 16),
                  ],
                  WodBlocksSection(sessionId: sessionId),
                  if (items.isEmpty) const _EmptyBlocksState(),
                  for (final item in items) _WorkoutBlockCard(block: item),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: FilledButton.icon(
          onPressed: () => _addBlock(context, ref, blocks.value?.length ?? 0),
          icon: const Icon(Icons.add),
          label: Text(l10n.addStrengthBlock),
        ),
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
        scrollable: true,
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

class _SessionHeader extends StatelessWidget {
  const _SessionHeader({required this.session});

  final WorkoutSession session;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final date = DateTime.tryParse(session.workoutDate);
    final dateLabel = date == null
        ? session.workoutDate
        : DateFormat.yMMMMEEEEd(locale).format(date);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.workoutDate(dateLabel)),
        if (session.notes?.isNotEmpty == true) Text(session.notes!),
      ],
    );
  }
}

Future<(String, String)?> _showSessionEditDialog(
  BuildContext context,
  WorkoutSession session,
) async {
  final l10n = AppLocalizations.of(context)!;
  final titleController = TextEditingController(text: session.title ?? '');
  final notesController = TextEditingController(text: session.notes ?? '');
  final values = await showWorkoutDialog<(String, String)>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      scrollable: true,
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
                IconButton(
                  tooltip: l10n.addExercise,
                  onPressed: () =>
                      _addExercise(context, ref, exercises.value?.length ?? 0),
                  icon: const Icon(Icons.add),
                ),
                PopupMenuButton<String>(
                  tooltip: l10n.editBlock,
                  onSelected: (action) {
                    if (action == 'edit') {
                      _editBlock(context, ref);
                    } else if (action == 'delete') {
                      _deleteBlock(context, ref);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'edit', child: Text(l10n.editBlock)),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(l10n.deleteBlock),
                    ),
                  ],
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
    final selection = await showModalBottomSheet<_ExerciseSelection>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => _MovementPickerSheet(
        onSelected: (name) =>
            Navigator.of(sheetContext).pop(_ExerciseSelection(name: name)),
        onCustom: () =>
            Navigator.of(sheetContext)
                .pop(const _ExerciseSelection(custom: true)),
      ),
    );
    if (!context.mounted || selection == null) return;
    final name = selection.custom
        ? await _showTextDialog(
            context,
            title: l10n.addExercise,
            label: l10n.exerciseName,
            hint: l10n.exerciseHint,
          )
        : selection.name;
    if (name == null || name.trim().isEmpty || !context.mounted) return;

    await ref
        .read(workoutRepositoryProvider)
        .addExercise(blockId: block.id, name: name, sortOrder: sortOrder);
  }

  Future<void> _editBlock(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final title = await _showTextDialog(
      context,
      title: l10n.editBlock,
      label: l10n.blockName,
      initialValue: block.title ?? '',
      submitLabel: l10n.save,
    );
    if (title == null || title.trim().isEmpty || !context.mounted) return;
    await ref
        .read(workoutRepositoryProvider)
        .updateStrengthBlock(blockId: block.id, title: title);
  }

  Future<void> _deleteBlock(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await _confirmDeleteDialog(
      context,
      title: l10n.deleteBlock,
      message: l10n.confirmDeleteBlock,
      confirmLabel: l10n.deleteBlock,
    );
    if (!confirmed || !context.mounted) return;
    await ref.read(workoutRepositoryProvider).deleteStrengthBlock(block.id);
  }
}

class _ExerciseSelection {
  const _ExerciseSelection({this.name = '', this.custom = false});

  final String name;
  final bool custom;
}

class _MovementPickerSheet extends StatefulWidget {
  const _MovementPickerSheet({
    required this.onSelected,
    required this.onCustom,
  });

  final ValueChanged<String> onSelected;
  final VoidCallback onCustom;

  @override
  State<_MovementPickerSheet> createState() => _MovementPickerSheetState();
}

class _MovementPickerSheetState extends State<_MovementPickerSheet> {
  final _searchController = TextEditingController();
  CrossFitCategory? _category;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categories = CrossFitCategory.values
        .where((category) => category != CrossFitCategory.benchmarkWod)
        .toList();
    final movements = CrossFitCatalog.search(
      _searchController.text,
      category: _category,
    ).where((entry) => entry.category != CrossFitCategory.benchmarkWod);

    final mediaQuery = MediaQuery.of(context);
    final availableHeight =
        mediaQuery.size.height - mediaQuery.viewInsets.bottom;
    final sheetHeight = availableHeight * 0.82;

    return SafeArea(
      child: SizedBox(
        height: sheetHeight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.addExercise,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: l10n.searchMovements,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    tooltip: l10n.cancel,
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 42,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: ChoiceChip(
                        label: Text(l10n.allMovements),
                        selected: _category == null,
                        onSelected: (_) => setState(() => _category = null),
                      ),
                    ),
                    for (final category in categories)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8),
                        child: ChoiceChip(
                          label: Text(movementCategoryLabel(l10n, category)),
                          selected: _category == category,
                          onSelected: (_) =>
                              setState(() => _category = category),
                        ),
                      ),
                  ],
                ),
              ),
              const Divider(height: 16),
              Expanded(
                child: movements.isEmpty
                    ? Center(child: Text(l10n.noMovementsFound))
                    : ListView.builder(
                        itemCount: movements.length,
                        itemBuilder: (context, index) {
                          final movement = movements.elementAt(index);
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(movement.name),
                            subtitle: Text(
                              movementCategoryLabel(l10n, movement.category),
                            ),
                            trailing: const Icon(Icons.add),
                            onTap: () => widget.onSelected(movement.name),
                          );
                        },
                      ),
              ),
              const Divider(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: widget.onCustom,
                  icon: const Icon(Icons.edit_outlined),
                  label: Text(l10n.customExercise),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
    final preference = ref.watch(weightUnitProvider);
    final unit = preference.value ?? WeightUnit.kg;
    final number = NumberFormat.decimalPattern(locale);

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
                  PopupMenuButton<String>(
                    tooltip: l10n.editExercise,
                    onSelected: (action) {
                      if (action == 'edit') {
                        _editExercise(context, ref);
                      } else if (action == 'delete') {
                        _deleteExercise(context, ref);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text(l10n.editExercise),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(l10n.deleteExercise),
                      ),
                    ],
                  ),
                  IconButton(
                    tooltip: l10n.addSet,
                    onPressed: preference.isLoading
                        ? null
                        : () => _addSet(context, ref, unit),
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              if (exercise.notes?.isNotEmpty == true)
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 8,
                    start: 2,
                  ),
                  child: Text(
                    exercise.notes!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                                  l10n.setLabel(number.format(set.setNumber)),
                                  set.weightKg == null
                                      ? l10n.bodyweight
                                      : unit.format(set.weightKg!, number),
                                  number.format(set.reps ?? 0),
                                ),
                              ),
                              onPressed: preference.isLoading
                                  ? null
                                  : () => _editSet(context, ref, set, unit),
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

  Future<void> _addSet(
    BuildContext context,
    WidgetRef ref,
    WeightUnit unit,
  ) async {
    final values = await _showSetDialog(context, unit);
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
    WeightUnit unit,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final values = await _showSetDialog(
      context,
      unit,
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
        scrollable: true,
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

  Future<void> _editExercise(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final displayName = await _showTextDialog(
      context,
      title: l10n.editExercise,
      label: l10n.exerciseName,
      initialValue: exercise.displayName,
      submitLabel: l10n.save,
    );
    if (displayName == null || displayName.trim().isEmpty || !context.mounted) {
      return;
    }
    await ref
        .read(workoutRepositoryProvider)
        .updateWorkoutExercise(
          workoutExerciseId: exercise.id,
          displayName: displayName,
        );
  }

  Future<void> _deleteExercise(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await _confirmDeleteDialog(
      context,
      title: l10n.deleteExercise,
      message: l10n.confirmDeleteExercise,
      confirmLabel: l10n.deleteExercise,
    );
    if (!confirmed || !context.mounted) return;
    await ref
        .read(workoutRepositoryProvider)
        .deleteWorkoutExercise(exercise.id);
  }
}

Future<String?> _showTextDialog(
  BuildContext context, {
  required String title,
  required String label,
  String? hint,
  String? initialValue,
  String? submitLabel,
}) async {
  final l10n = AppLocalizations.of(context)!;
  final controller = TextEditingController(text: initialValue);
  final value = await showWorkoutDialog<String>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      scrollable: true,
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
          child: Text(submitLabel ?? l10n.add),
        ),
      ],
    ),
  );
  controller.dispose();
  return value;
}

Future<bool> _confirmDeleteDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
}) async {
  final l10n = AppLocalizations.of(context)!;
  return await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          scrollable: true,
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(confirmLabel),
            ),
          ],
        ),
      ) ??
      false;
}

Future<(double?, int)?> _showSetDialog(
  BuildContext context,
  WeightUnit unit, {
  String? title,
  double? initialWeightKg,
  int? initialReps,
}) async {
  final l10n = AppLocalizations.of(context)!;
  final locale = Localizations.localeOf(context).toString();
  final numberFormat = NumberFormat('0.###', locale);
  final initialWeight = initialWeightKg == null
      ? ''
      : numberFormat.format(unit.fromKg(initialWeightKg));
  final weightController = TextEditingController(text: initialWeight);
  final repsController = TextEditingController(
    text: initialReps == null ? '' : numberFormat.format(initialReps),
  );
  String? validationError;
  final values = await showWorkoutDialog<(double?, int)>(
    context: context,
    builder: (dialogContext) => StatefulBuilder(
      builder: (dialogContext, setDialogState) => AlertDialog(
        scrollable: true,
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
              decoration: InputDecoration(
                labelText: l10n.setWeight(unit.name),
                helperText: l10n.bodyweight,
              ),
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
              final weight = parseLocalizedDecimal(
                weightController.text,
                numberFormat,
              );
              final repsValue = parseLocalizedDecimal(
                repsController.text,
                numberFormat,
              );
              final reps =
                  repsValue != null && repsValue == repsValue.roundToDouble()
                  ? repsValue.toInt()
                  : null;
              final hasWeight = weightController.text.trim().isNotEmpty;
              if ((hasWeight &&
                      (weight == null || !weight.isFinite || weight < 0)) ||
                  reps == null ||
                  reps <= 0) {
                setDialogState(() => validationError = l10n.invalidSet);
                return;
              }
              final weightKg = weightController.text.trim() == initialWeight
                  ? initialWeightKg
                  : weight == null
                  ? null
                  : unit.toKg(weight);
              Navigator.of(dialogContext).pop((weightKg, reps));
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
