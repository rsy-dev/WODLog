import 'package:flutter/material.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/wod_parser.dart';
import '../data/wod_prescription.dart';

Future<String?> showWodSourceReview(BuildContext context) =>
    showWodLogSheet<String>(
      context: context,
      title: AppLocalizations.of(context)!.reviewWodText,
      builder: (_) => const _WodSourceReview(),
    );

class _WodSourceReview extends StatefulWidget {
  const _WodSourceReview();

  @override
  State<_WodSourceReview> createState() => _WodSourceReviewState();
}

class _WodSourceReviewState extends State<_WodSourceReview> {
  String _source = '';
  WodPrescription? _draft;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final draft = _draft;
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
          }),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: _source.trim().isEmpty
              ? null
              : () => setState(
                  () =>
                      _draft = const WodTextParser().parsePrescription(_source),
                ),
          child: Text(l10n.reviewWodText),
        ),
        if (draft != null) ...[
          if (draft.movements.isNotEmpty) ...[
            Text(
              l10n.wodPrescription,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            for (final movement in draft.movements)
              ListTile(
                title: Text(movement.name),
                subtitle: movement.quantities.isEmpty
                    ? null
                    : Text(movement.quantities.join(' / ')),
              ),
          ],
          if (draft.unparsedLines.isNotEmpty) ...[
            Text(
              l10n.unreadWodLines,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            for (final line in draft.unparsedLines) ListTile(title: Text(line)),
          ],
          FilledButton(
            onPressed: () => Navigator.pop(context, _source.trim()),
            child: Text(l10n.applyWodSource),
          ),
        ],
      ],
    );
  }
}
