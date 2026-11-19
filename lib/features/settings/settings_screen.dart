import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/generated/app_localizations.dart';
import 'weight_unit.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _saving = false;
  bool _saveFailed = false;

  Future<void> _select(WeightUnit? unit) async {
    if (unit == null || _saving) return;
    setState(() {
      _saving = true;
      _saveFailed = false;
    });
    try {
      await ref.read(weightUnitProvider.notifier).select(unit);
    } catch (_) {
      if (mounted) setState(() => _saveFailed = true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final preference = ref.watch(weightUnitProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l10n.weightUnit, style: Theme.of(context).textTheme.titleMedium),
          RadioGroup<WeightUnit>(
            groupValue: preference.value,
            onChanged: _select,
            child: Column(
              children: [
                for (final unit in WeightUnit.values)
                  RadioListTile(
                    value: unit,
                    enabled: !_saving && !preference.isLoading,
                    title: Text(unit.name, textDirection: TextDirection.ltr),
                  ),
              ],
            ),
          ),
          if (_saving || preference.isLoading) const LinearProgressIndicator(),
          if (_saveFailed || preference.hasError) Text(l10n.weightUnitError),
        ],
      ),
    );
  }
}
