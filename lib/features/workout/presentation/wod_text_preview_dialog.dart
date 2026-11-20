import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../data/wod_parser.dart';

String wodTextPreviewLabel(BuildContext context) =>
    Localizations.localeOf(context).languageCode == 'ko'
    ? 'WOD 텍스트 붙여넣기'
    : 'Paste WOD text';

class WodTextPreviewDialog extends StatefulWidget {
  const WodTextPreviewDialog({super.key, required this.onSave});

  final Future<void> Function(
    String title,
    WodDraft draft,
    int? levelIndex,
    String score,
  )
  onSave;

  @override
  State<WodTextPreviewDialog> createState() => _WodTextPreviewDialogState();
}

class _WodTextPreviewDialogState extends State<WodTextPreviewDialog> {
  WodDraft? _draft;
  int? _selectedLevel;
  String _title = '';
  String _score = '';
  bool _saving = false;
  bool _saveFailed = false;

  Future<void> _save(WodDraft draft, int? level, String fallbackTitle) async {
    setState(() {
      _saving = true;
      _saveFailed = false;
    });
    try {
      await widget.onSave(
        _title.trim().isEmpty ? fallbackTitle : _title,
        draft,
        level,
        _score,
      );
      if (mounted) Navigator.pop(context);
    } catch (_) {
      if (mounted) {
        setState(() {
          _saving = false;
          _saveFailed = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final korean = Localizations.localeOf(context).languageCode == 'ko';
    final draft = _draft;
    final selectedLevel = _selectedLevel;

    final canSave =
        !_saving &&
        draft != null &&
        (draft.levels.isEmpty || selectedLevel != null);
    return PopScope(
      canPop: !_saving,
      child: AlertDialog(
        title: Text(wodTextPreviewLabel(context)),
        scrollable: true,
        content: SizedBox(
          width: 440,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                enabled: !_saving,
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration(
                  labelText: korean ? 'WOD 원문' : 'Workout text',
                ),
                onChanged: (value) => setState(() {
                  _draft = value.trim().isEmpty
                      ? null
                      : const WodTextParser().parse(value);
                  _selectedLevel = null;
                }),
              ),
              if (draft != null) ...[
                const SizedBox(height: 12),
                if (draft.levels.isNotEmpty) ...[
                  Text(korean ? '수행한 레벨을 선택하세요' : 'Choose the level you did'),
                  Wrap(
                    spacing: 8,
                    children: [
                      for (final (index, level) in draft.levels.indexed)
                        ChoiceChip(
                          label: Text(level.label),
                          selected: selectedLevel == index,
                          onSelected: _saving
                              ? null
                              : (selected) => setState(() {
                                  _selectedLevel = selected ? index : null;
                                }),
                        ),
                    ],
                  ),
                ],
                const SizedBox(height: 12),
                TextField(
                  enabled: !_saving,
                  decoration: InputDecoration(labelText: l10n.wodName),
                  onChanged: (value) => _title = value,
                ),
                TextField(
                  enabled: !_saving,
                  decoration: InputDecoration(
                    labelText: korean ? '스코어 (선택)' : 'Score (optional)',
                  ),
                  onChanged: (value) => _score = value,
                ),
                if (_saveFailed)
                  Text(
                    korean
                        ? '저장하지 못했습니다. 다시 시도하세요.'
                        : 'Could not save. Try again.',
                  ),
                if (draft.levels.isEmpty)
                  _PrescriptionPreview(draft: draft, korean: korean)
                else ...[
                  if (draft.movements.isNotEmpty ||
                      draft.unknownLines.isNotEmpty)
                    _PrescriptionPreview(
                      draft: draft,
                      korean: korean,
                      title: korean ? '공통 원문' : 'Common text',
                    ),
                  if (selectedLevel != null)
                    _PrescriptionPreview(
                      draft: draft.levels[selectedLevel].prescription,
                      korean: korean,
                    ),
                ],
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: _saving ? null : () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: canSave
                ? () => _save(draft, selectedLevel, l10n.wodSectionTitle)
                : null,
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }
}

class _PrescriptionPreview extends StatelessWidget {
  const _PrescriptionPreview({
    required this.draft,
    required this.korean,
    this.title,
  });

  final WodDraft draft;
  final bool korean;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final format = switch (draft.format) {
      WodFormat.amrap => l10n.resultAmrap,
      WodFormat.forTime => l10n.resultForTime,
      WodFormat.emom => l10n.resultEmom,
      WodFormat.unknown => null,
    };
    final settings = [
      ?format,
      if (draft.durationMinutes case final minutes?)
        korean ? '$minutes분' : '$minutes min',
      if (draft.rounds case final rounds?)
        korean ? '$rounds라운드' : '$rounds rounds',
      if (draft.timeCapMinutes case final cap?)
        korean ? '타임캡 $cap분' : '$cap min cap',
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        if (title case final label?) Text(label),
        if (settings.isNotEmpty)
          Text(
            settings.join(' · '),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        for (final movement in draft.movements) Text(movement.rawLine),
        if (draft.unknownLines.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            korean ? '확인할 원문' : 'Review these lines',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          for (final line in draft.unknownLines) Text(line),
        ],
      ],
    );
  }
}
