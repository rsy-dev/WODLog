import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';

Future<T?> showWodLogSheet<T>({
  required BuildContext context,
  required String title,
  required WidgetBuilder builder,
}) => showModalBottomSheet<T>(
  context: context,
  useRootNavigator: true,
  useSafeArea: true,
  isScrollControlled: true,
  sheetAnimationStyle: MediaQuery.disableAnimationsOf(context)
      ? AnimationStyle.noAnimation
      : null,
  builder: (context) {
    final keyboard = MediaQuery.viewInsetsOf(context).bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: keyboard),
      child: SafeArea(
        top: false,
        child: FractionallySizedBox(
          heightFactor: .9,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: IconButton(
                  tooltip: AppLocalizations.of(context)!.closeSheet,
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ),
              Expanded(child: builder(context)),
            ],
          ),
        ),
      ),
    );
  },
);
