import 'package:flutter/material.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/wod_parser.dart';
import '../data/wod_prescription.dart';

Future<WodPrescription?> showWodSourceReview(
  BuildContext context, {
  required String title,
}) => showWodLogSheet<WodPrescription>(
  context: context,
  title: AppLocalizations.of(context)!.reviewWodText,
  builder: (_) => _WodSourceReview(title: title),
);

class _WodSourceReview extends StatefulWidget {
  const _WodSourceReview({required this.title});

  final String title;

  @override
  State<_WodSourceReview> createState() => _WodSourceReviewState();
}

class _WodSourceReviewState extends State<_WodSourceReview> {
  static const _parser = WodTextParser();
  String _source = '';
  WodDraft? _draft;
  int? _levelIndex;

  WodPrescription? _prescription() {
    final draft = _draft;
    if (draft == null) return null;
    if (draft.levels.isEmpty) {
      return _parser.parsePrescription(_source.trim(), title: widget.title);
    }
    final levelIndex = _levelIndex;
    if (levelIndex == null) return null;
    final level = draft.levels[levelIndex];
    final selected = level.prescription;
    final header = switch (selected.format) {
      WodFormat.forTime => [
        if (selected.rounds case final rounds?) '$rounds rounds',
        'For Time',
      ].join(' '),
      WodFormat.amrap => 'AMRAP ${selected.durationMinutes ?? ''}',
      WodFormat.emom => 'EMOM ${selected.durationMinutes ?? ''}',
      WodFormat.unknown => '',
    };
    final parsed = _parser.parsePrescription(
      [
        if (header.isNotEmpty) header,
        if (selected.timeCapMinutes case final cap?) 'Time Cap $cap min',
        ...selected.rawText.split('\n').where((line) {
          final parsedLine = _parser.parsePrescription(line);
          return parsedLine.structure == WodStructure.unknown &&
              parsedLine.timeCapSeconds == null;
        }),
      ].join('\n'),
      title: widget.title,
    );
    return WodPrescription.fromJson({
      ...parsed.toJson(),
      'rawText': _source.trim(),
      'standards': [...parsed.standards, level.label],
      'unparsedLines': [
        ...parsed.unparsedLines,
        ...draft.unknownLines,
        ...draft.movements.map((movement) => movement.rawLine),
      ],
      'version': switch (level.label.toLowerCase()) {
        'rx' || 'rx\'' || 'rxd' => WodVersion.rx.name,
        'scaled' => WodVersion.scaled.name,
        'foundations' => WodVersion.foundations.name,
        _ => WodVersion.custom.name,
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final draft = _draft;
    final prescription = _prescription();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          minLines: 4,
          maxLines: 8,
          decoration: InputDecoration(labelText: l10n.wodSourceText),
          onChanged: (value) => setState(() {
            _source = value;
            _draft = null;
            _levelIndex = null;
          }),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: _source.trim().isEmpty
              ? null
              : () => setState(() => _draft = _parser.parse(_source)),
          child: Text(l10n.reviewWodText),
        ),
        if (draft != null && draft.levels.isNotEmpty)
          Wrap(
            spacing: 8,
            children: [
              for (final (index, level) in draft.levels.indexed)
                ChoiceChip(
                  label: Text(level.label),
                  selected: _levelIndex == index,
                  onSelected: (_) => setState(() => _levelIndex = index),
                ),
            ],
          ),
        if (prescription != null) ...[
          if (prescription.movements.isNotEmpty) ...[
            Text(
              l10n.wodPrescription,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            for (final movement in prescription.movements)
              ListTile(
                title: Text(movement.name),
                subtitle: movement.quantities.isEmpty
                    ? null
                    : Text(movement.quantities.join(' / ')),
              ),
          ],
          if (prescription.unparsedLines.isNotEmpty) ...[
            Text(
              l10n.unreadWodLines,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            for (final line in prescription.unparsedLines)
              ListTile(title: Text(line)),
          ],
          FilledButton(
            onPressed: () => Navigator.pop(context, prescription),
            child: Text(l10n.applyWodSource),
          ),
        ],
      ],
    );
  }
}
