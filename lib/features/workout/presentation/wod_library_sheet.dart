import 'package:flutter/material.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/named_wod_catalog.dart';

Future<NamedWodTemplate?> showWodLibrary(BuildContext context) =>
    showWodLogSheet<NamedWodTemplate>(
      context: context,
      title: AppLocalizations.of(context)!.chooseBenchmark,
      builder: (_) => const _WodLibrary(),
    );

class _WodLibrary extends StatefulWidget {
  const _WodLibrary();

  @override
  State<_WodLibrary> createState() => _WodLibraryState();
}

class _WodLibraryState extends State<_WodLibrary> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = NamedWodCatalog.templates.where(
      (template) =>
          '${template.name} ${template.format}'.toLowerCase().contains(_query),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              labelText: l10n.searchWorkouts,
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: (value) =>
                setState(() => _query = value.trim().toLowerCase()),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              if (items.isEmpty) ListTile(title: Text(l10n.noMatchingWorkouts)),
              for (final template in items)
                ListTile(
                  title: Text(template.name),
                  subtitle: Text(
                    '${template.format} · ${template.prescription}',
                  ),
                  onTap: () => Navigator.pop(context, template),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
