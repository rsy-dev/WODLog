import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';

Future<T?> showWodLogSheet<T>({
  required BuildContext context,
  required String title,
  required WidgetBuilder builder,
  bool fitContent = false,
  bool expandForKeyboard = false,
}) => showModalBottomSheet<T>(
  context: context,
  useRootNavigator: true,
  useSafeArea: true,
  isScrollControlled: true,
  barrierColor: const Color(0x66243552),
  backgroundColor: Colors.transparent,
  clipBehavior: Clip.antiAlias,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
  ),
  sheetAnimationStyle: MediaQuery.disableAnimationsOf(context)
      ? AnimationStyle.noAnimation
      : null,
  builder: (context) {
    final keyboard = MediaQuery.viewInsetsOf(context).bottom;
    final keyboardVisible = expandForKeyboard && keyboard > 0;
    final compactHeader =
        keyboardVisible && MediaQuery.sizeOf(context).height - keyboard < 300;
    return Padding(
      padding: EdgeInsets.only(bottom: keyboard),
      child: SafeArea(
        top: false,
        child: Material(
          color: const Color(0xFFF9FBFF),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          clipBehavior: Clip.antiAlias,
          child: FractionallySizedBox(
            heightFactor: fitContent ? null : (keyboardVisible ? 1 : .9),
            child: Column(
              mainAxisSize: fitContent ? MainAxisSize.min : MainAxisSize.max,
              children: [
                ListTile(
                  minTileHeight: compactHeader ? 48 : null,
                  title: Text(
                    title,
                    maxLines: compactHeader ? 1 : null,
                    overflow: compactHeader ? TextOverflow.ellipsis : null,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: IconButton(
                    tooltip: AppLocalizations.of(context)!.closeSheet,
                    onPressed: () => Navigator.pop(context),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFFEDF3FF),
                      foregroundColor: const Color(0xFF243552),
                      fixedSize: const Size(42, 42),
                    ),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
                if (fitContent)
                  Flexible(child: builder(context))
                else
                  Expanded(child: builder(context)),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
