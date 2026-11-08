import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../data/crossfit_catalog.dart';
import '../providers/wod_providers.dart';

class WodBlocksSection extends ConsumerWidget {
  const WodBlocksSection({super.key, required this.sessionId});

  final String sessionId;

  static const _types = <String>[
    'for_time',
    'amrap',
    'emom',
    'rounds_reps',
    'load',
    'other',
  ];

  String _typeLabel(AppLocalizations l10n, String type) => switch (type) {
    'for_time' => l10n.resultForTime,
    'amrap' => l10n.resultAmrap,
    'emom' => l10n.resultEmom,
    'rounds_reps' => l10n.resultRoundsReps,
    'load' => l10n.resultLoad,
    _ => l10n.resultOther,
  };

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
                label: Text(l10n.addWodBlock),
              ),
            )
          else
            for (final block in items)
              _WodBlockTile(
                blockId: block.id,
                title: block.title ?? l10n.wodSectionTitle,
                labelFor: (type) => _typeLabel(l10n, type),
                onEdit: () => _editResult(context, ref, block.id),
              ),
        ],
      ),
    );
  }

  Future<void> _addBlock(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();
    final title = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.addWodBlock),
        content: SizedBox(
          width: 360,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller,
                  autofocus: true,
                  decoration: InputDecoration(labelText: l10n.wodName),
                  textCapitalization: TextCapitalization.sentences,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.benchmarkWorkouts,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final wod in CrossFitCatalog.inCategory(
                      CrossFitCategory.benchmarkWod,
                    ))
                      ActionChip(
                        label: Text(wod.name),
                        onPressed: () {
                          controller.text = wod.name;
                          controller.selection = TextSelection.collapsed(
                            offset: controller.text.length,
                          );
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text(l10n.add),
          ),
        ],
      ),
    );
    controller.dispose();
    if (!context.mounted || title == null) return;
    final count =
        ref.read(wodBlocksForSessionProvider(sessionId)).asData?.value.length ??
        0;
    await ref
        .read(wodRepositoryProvider)
        .createWodBlock(sessionId: sessionId, title: title, sortOrder: count);
  }

  Future<void> _editResult(
    BuildContext context,
    WidgetRef ref,
    String blockId,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final result = await ref
        .read(wodRepositoryProvider)
        .watchResult(blockId)
        .first;
    if (!context.mounted) return;
    var selectedType = _types.contains(result?.resultType)
        ? result!.resultType
        : _types.first;
    final scoreController = TextEditingController(
      text: result?.resultText ?? '',
    );
    final notesController = TextEditingController(text: result?.notes ?? '');
    final values = await showDialog<(String, String, String)>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(result == null ? l10n.addWodResult : l10n.editWodResult),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedType,
                  decoration: InputDecoration(labelText: l10n.wodResultType),
                  items: [
                    for (final type in _types)
                      DropdownMenuItem(
                        value: type,
                        child: Text(_typeLabel(l10n, type)),
                      ),
                  ],
                  onChanged: (value) {
                    if (value != null) setState(() => selectedType = value);
                  },
                ),
                TextField(
                  controller: scoreController,
                  decoration: InputDecoration(labelText: l10n.wodScore),
                ),
                TextField(
                  controller: notesController,
                  decoration: InputDecoration(labelText: l10n.wodNotes),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, (
                selectedType,
                scoreController.text,
                notesController.text,
              )),
              child: Text(l10n.save),
            ),
          ],
        ),
      ),
    );
    scoreController.dispose();
    notesController.dispose();
    if (values == null) return;
    await ref
        .read(wodRepositoryProvider)
        .saveResult(
          blockId: blockId,
          resultType: values.$1,
          resultText: values.$2,
          notes: values.$3,
        );
  }
}

class _WodBlockTile extends ConsumerWidget {
  const _WodBlockTile({
    required this.blockId,
    required this.title,
    required this.labelFor,
    required this.onEdit,
  });

  final String blockId;
  final String title;
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
        error: (error, stack) => Text(l10n.loadBlocksError),
        data: (value) => value == null
            ? Text(l10n.emptyWodResult)
            : Text(
                '${labelFor(value.resultType)} · ${value.resultText ?? ''}${value.notes?.isNotEmpty == true ? '\n${value.notes}' : ''}',
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
