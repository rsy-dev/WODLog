import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../data/crossfit_catalog.dart';
import 'movement_category_label.dart';

class MovementPickerSheet extends StatefulWidget {
  const MovementPickerSheet({
    required this.onSelected,
    required this.onCustom,
    this.useSearchAsCustom = false,
    super.key,
  });

  final ValueChanged<CrossFitCatalogEntry> onSelected;
  final ValueChanged<String> onCustom;
  final bool useSearchAsCustom;

  @override
  State<MovementPickerSheet> createState() => _MovementPickerSheetState();
}

class _MovementPickerSheetState extends State<MovementPickerSheet> {
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      onSelected: (_) => setState(() => _category = category),
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
                        onTap: () => widget.onSelected(movement),
                      );
                    },
                  ),
          ),
          const Divider(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed:
                  widget.useSearchAsCustom &&
                      _searchController.text.trim().isEmpty
                  ? null
                  : () => widget.onCustom(_searchController.text.trim()),
              icon: const Icon(Icons.edit_outlined),
              label: Text(l10n.customExercise),
            ),
          ),
        ],
      ),
    );
  }
}
