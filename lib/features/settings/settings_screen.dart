import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/generated/app_localizations.dart';

import 'package:intl/intl.dart' show NumberFormat;

import '../../app/wodlog_sheet.dart';
import '../workout/data/crossfit_catalog.dart';
import '../workout/presentation/localized_decimal.dart';
import '../workout/presentation/movement_category_label.dart';
import 'display_preferences.dart';
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
    final display = ref.watch(displayPreferencesProvider);
    final locale = display.value?.locale;
    final number = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toString(),
    );
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          16 + MediaQuery.paddingOf(context).bottom,
        ),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(l10n.languageSetting),
                  subtitle: Text(
                    locale == null ? l10n.deviceLanguage : _name(locale),
                  ),
                  onTap: display.isLoading ? null : () => _language(context),
                ),
                Text(l10n.weightUnit),
                RadioGroup<WeightUnit>(
                  groupValue: preference.value,
                  onChanged: _select,
                  child: Column(
                    children: [
                      for (final unit in WeightUnit.values)
                        RadioListTile(
                          value: unit,
                          enabled: !_saving && !preference.isLoading,
                          title: Text(
                            unit.name,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                    ],
                  ),
                ),
                if (_saving || preference.isLoading)
                  const LinearProgressIndicator(),
                if (_saveFailed || preference.hasError)
                  Text(l10n.weightUnitError),
                ListTile(
                  leading: const Icon(Icons.calculate_outlined),
                  title: Text(l10n.weightCalculator),
                  onTap: () => showWodLogSheet<void>(
                    context: context,
                    title: l10n.weightCalculator,
                    builder: (_) => const _Calculator(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.flag_outlined),
              title: Text(l10n.weeklyGoal),
              subtitle: Text(
                display.value == null
                    ? '—'
                    : number.format(display.value!.weeklyGoal),
              ),
              onTap: display.isLoading
                  ? null
                  : () => _weeklyGoal(context, number),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: Text(l10n.movementLibrary),
                  onTap: () => showWodLogSheet<void>(
                    context: context,
                    title: l10n.movementLibrary,
                    builder: (_) => const _MovementLibrary(),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.menu_book_outlined),
                  title: Text(l10n.glossary),
                  onTap: () => showWodLogSheet<void>(
                    context: context,
                    title: l10n.glossary,
                    builder: (_) => ListView(
                      children: [
                        for (final (name, definition) in [
                          ('AMRAP', l10n.glossaryAmrap),
                          ('EMOM', l10n.glossaryEmom),
                          ('For Time', l10n.glossaryForTime),
                          ('Rx', l10n.glossaryRx),
                          ('Scaled', l10n.glossaryScaled),
                          ('WOD / Metcon', l10n.glossaryWodMetcon),
                          ('RFT', l10n.glossaryRft),
                          ('E2MOM', l10n.glossaryE2Mom),
                          ('Intervals', l10n.glossaryIntervals),
                          ('Tabata', l10n.glossaryTabata),
                          ('Max Load / Reps', l10n.glossaryMaxLoadReps),
                          (
                            'Distance / Calories',
                            l10n.glossaryDistanceCalories,
                          ),
                          ('Foundations', l10n.glossaryFoundations),
                          ('Time Cap', l10n.glossaryTimeCap),
                          ('Tiebreak', l10n.glossaryTiebreak),
                          ('Chipper', l10n.glossaryChipper),
                          ('Couplet / Triplet', l10n.glossaryCoupletTriplet),
                          ('Ladder', l10n.glossaryLadder),
                          ('Buy-in / Cash-out', l10n.glossaryBuyInCashOut),
                          ('Unbroken', l10n.glossaryUnbroken),
                          ('No Rep', l10n.glossaryNoRep),
                          ('PR', l10n.glossaryPr),
                        ])
                          ListTile(
                            title: Text(name),
                            subtitle: Text(definition),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _language(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final selected = await showWodLogSheet<(Locale?,)>(
      context: context,
      title: l10n.languageSetting,
      builder: (context) => ListView(
        children: [
          ListTile(
            title: Text(l10n.deviceLanguage),
            onTap: () => Navigator.pop(context, (null,)),
          ),
          for (final locale in AppLocalizations.supportedLocales)
            ListTile(
              title: Text(_name(locale)),
              onTap: () => Navigator.pop(context, (locale,)),
            ),
        ],
      ),
    );
    if (selected != null && mounted) {
      await _saveDisplay(
        () => ref
            .read(displayPreferencesProvider.notifier)
            .setLocale(selected.$1),
      );
    }
  }

  Future<void> _weeklyGoal(BuildContext context, NumberFormat number) async {
    final goal = await showWodLogSheet<int>(
      context: context,
      title: AppLocalizations.of(context)!.weeklyGoal,
      fitContent: true,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          for (var value = 1; value <= 7; value++)
            ListTile(
              title: Text(number.format(value)),
              onTap: () => Navigator.pop(context, value),
            ),
        ],
      ),
    );
    if (goal != null && mounted) {
      await _saveDisplay(
        () => ref.read(displayPreferencesProvider.notifier).setWeeklyGoal(goal),
      );
    }
  }

  Future<void> _saveDisplay(Future<void> Function() save) async {
    try {
      await save();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.settingsSaveError),
          ),
        );
      }
    }
  }

  String _name(Locale locale) =>
      const {
        'ar': 'العربية',
        'bn': 'বাংলা',
        'de': 'Deutsch',
        'en': 'English',
        'es': 'Español',
        'fil': 'Filipino',
        'fr': 'Français',
        'hi': 'हिन्दी',
        'id': 'Bahasa Indonesia',
        'it': 'Italiano',
        'ja': '日本語',
        'ko': '한국어',
        'nl': 'Nederlands',
        'pl': 'Polski',
        'pt': 'Português',
        'pt-BR': 'Português (Brasil)',
        'ru': 'Русский',
        'th': 'ไทย',
        'tr': 'Türkçe',
        'ur': 'اردو',
        'vi': 'Tiếng Việt',
        'zh': '中文',
        'zh-Hans': '简体中文',
        'zh-Hant': '繁體中文',
      }[locale.toLanguageTag()] ??
      locale.toLanguageTag();
}

class _Calculator extends StatefulWidget {
  const _Calculator();

  @override
  State<_Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<_Calculator> {
  WeightUnit _source = WeightUnit.kg;
  String _input = '';

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final number = NumberFormat.decimalPattern(locale);
    final value = parseLocalizedDecimal(_input, number);
    final target = _source == WeightUnit.kg ? WeightUnit.lb : WeightUnit.kg;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SegmentedButton<WeightUnit>(
          segments: [
            for (final unit in WeightUnit.values)
              ButtonSegment(value: unit, label: Text(unit.name)),
          ],
          selected: {_source},
          onSelectionChanged: (selected) =>
              setState(() => _source = selected.single),
        ),
        const SizedBox(height: 14),
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.setWeight(_source.name),
          ),
          onChanged: (value) => setState(() => _input = value),
        ),
        const SizedBox(height: 14),
        Text(
          value == null ? '—' : target.format(_source.toKg(value), number),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class _MovementLibrary extends StatefulWidget {
  const _MovementLibrary();

  @override
  State<_MovementLibrary> createState() => _MovementLibraryState();
}

class _MovementLibraryState extends State<_MovementLibrary> {
  String _query = '';
  CrossFitCategory? _category;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final entries = CrossFitCatalog.search(
      _query,
      category: _category,
    ).where((entry) => entry.category != CrossFitCategory.benchmarkWod);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(labelText: l10n.searchMovements),
            onChanged: (value) => setState(() => _query = value),
          ),
        ),
        SizedBox(
          height: 46,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: [
              for (final category in CrossFitCategory.values)
                if (category != CrossFitCategory.benchmarkWod)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 6),
                    child: FilterChip(
                      label: Text(movementCategoryLabel(l10n, category)),
                      selected: _category == category,
                      onSelected: (selected) => setState(
                        () => _category = selected ? category : null,
                      ),
                    ),
                  ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              if (entries.isEmpty) ListTile(title: Text(l10n.noMovementsFound)),
              for (final entry in entries)
                ListTile(
                  title: Text(entry.name),
                  subtitle: Text(movementCategoryLabel(l10n, entry.category)),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
