import 'package:flutter/material.dart';

import '../../../app/wodlog_sheet.dart';
import '../../../l10n/generated/app_localizations.dart';

Future<DateTime?> showWorkoutDateSheet(
  BuildContext context,
  DateTime selected,
) {
  final today = DateUtils.dateOnly(DateTime.now());
  return showWodLogSheet<DateTime>(
    context: context,
    title: AppLocalizations.of(context)!.chooseDate,
    fitContent: true,
    builder: (context) => SingleChildScrollView(
      child: CalendarDatePicker(
        initialDate: selected,
        firstDate: DateTime(today.year - 5),
        lastDate: today,
        onDateChanged: (date) => Navigator.pop(context, date),
      ),
    ),
  );
}
