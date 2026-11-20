import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../settings/weight_unit.dart';
import '../data/wod_prescription.dart';
import 'localized_decimal.dart';
import 'movement_picker_sheet.dart';

Future<WodMovementPrescription?> pickWodMovement(BuildContext context) =>
    showWodLogSheet<WodMovementPrescription>(
      context: context,
      title: AppLocalizations.of(context)!.addExercise,
      builder: (sheetContext) => MovementPickerSheet(
        useSearchAsCustom: true,
        onSelected: (entry) => Navigator.pop(
          sheetContext,
          WodMovementPrescription(name: entry.name, movementId: entry.id),
        ),
        onCustom: (name) =>
            Navigator.pop(sheetContext, WodMovementPrescription(name: name)),
      ),
    );

Future<WodMovementPrescription?> editWodMovement(
  BuildContext context,
  WodMovementPrescription initial,
  WeightUnit weightUnit,
  NumberFormat number,
  VoidCallback? onMoveUp,
  VoidCallback? onMoveDown,
) {
  final l10n = AppLocalizations.of(context)!;
  final ko = l10n.localeName.startsWith('ko');
  final inputNumber = NumberFormat('0.############', number.locale);
  final initialQuantities = initial.quantities
      .map(inputNumber.format)
      .join(' / ');
  final initialWeight = initial.weightKg == null
      ? ''
      : inputNumber.format(weightUnit.fromKg(initial.weightKg!));
  var movement = initial;
  var quantityUnit = initial.unit;
  var quantities = initialQuantities;
  var weight = initialWeight;
  var equipment = initial.equipment ?? '';
  var standard = initial.standard ?? '';
  var error = false;
  return showWodLogSheet<WodMovementPrescription>(
    context: context,
    title: l10n.wodPrescription,
    fitContent: true,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) => ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text(movement.name),
            trailing: const Icon(Icons.edit_outlined),
            onTap: () async {
              final selected = await pickWodMovement(context);
              if (context.mounted && selected != null) {
                setState(() => movement = selected);
              }
            },
          ),
          TextFormField(
            initialValue: quantities,
            decoration: InputDecoration(labelText: l10n.wodMovementQuantities),
            onChanged: (value) => quantities = value,
          ),
          DropdownButtonFormField<WodQuantityUnit>(
            initialValue: quantityUnit,
            items: [
              for (final unit in WodQuantityUnit.values)
                DropdownMenuItem(
                  value: unit,
                  child: Text(switch (unit) {
                    WodQuantityUnit.reps => l10n.reps,
                    WodQuantityUnit.meters => 'm',
                    WodQuantityUnit.calories => 'kcal',
                    WodQuantityUnit.seconds => ko ? '초' : 'sec',
                  }),
                ),
            ],
            onChanged: (value) => quantityUnit = value ?? quantityUnit,
          ),
          TextFormField(
            initialValue: weight,
            decoration: InputDecoration(
              labelText: l10n.setWeight(weightUnit.name),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) => weight = value,
          ),
          TextFormField(
            initialValue: equipment,
            decoration: InputDecoration(labelText: l10n.wodMovementEquipment),
            onChanged: (value) => equipment = value,
          ),
          TextFormField(
            initialValue: standard,
            decoration: InputDecoration(
              labelText: l10n.wodMovementStandard,
              helperText: initial.options.isEmpty
                  ? null
                  : initial.options.join(' / '),
              helperMaxLines: 3,
            ),
            onChanged: (value) => standard = value,
          ),
          if (error) Text(l10n.wodInvalidScore),
          FilledButton(
            onPressed: () {
              final values = quantities.trim().isEmpty
                  ? <double?>[]
                  : quantities
                        .split('/')
                        .map((value) => parseLocalizedDecimal(value, number))
                        .toList();
              final kg = weight.trim().isEmpty
                  ? null
                  : parseLocalizedDecimal(weight, number);
              if (values.contains(null) ||
                  (weight.trim().isNotEmpty && kg == null)) {
                setState(() => error = true);
                return;
              }
              Navigator.pop(
                context,
                WodMovementPrescription(
                  name: movement.name,
                  movementId: movement.movementId,
                  quantities: quantities == initialQuantities
                      ? initial.quantities
                      : values.whereType<double>().toList(),
                  unit: quantityUnit,
                  weightKg: weight == initialWeight
                      ? initial.weightKg
                      : kg == null
                      ? null
                      : weightUnit.toKg(kg),
                  equipment: equipment.trim().isEmpty ? null : equipment.trim(),
                  interval: initial.interval,
                  standard: standard.trim().isEmpty ? null : standard.trim(),
                  options: movement == initial ? initial.options : const [],
                ),
              );
            },
            child: Text(l10n.applyWodSource),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: l10n.wodMoveUp,
                onPressed: onMoveUp == null
                    ? null
                    : () {
                        onMoveUp();
                        Navigator.pop(context);
                      },
                icon: const Icon(Icons.arrow_upward),
              ),
              IconButton(
                tooltip: l10n.wodMoveDown,
                onPressed: onMoveDown == null
                    ? null
                    : () {
                        onMoveDown();
                        Navigator.pop(context);
                      },
                icon: const Icon(Icons.arrow_downward),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
