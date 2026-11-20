import 'dart:ui' show ImageFilter;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../l10n/generated/app_localizations.dart';

class WodLogShell extends StatelessWidget {
  const WodLogShell({required this.shell, super.key});

  final StatefulNavigationShell shell;

  static final _reduceTransparency =
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS
      ? const EventChannel('wodlog/reduce_transparency')
            .receiveBroadcastStream()
            .map((value) => value as bool)
      : null;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = [l10n.todayTab, l10n.history, l10n.statsTab, l10n.settings];
    const icons = [
      Icons.today_outlined,
      Icons.receipt_long_outlined,
      Icons.bar_chart_rounded,
      Icons.settings_outlined,
    ];
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      extendBody: true,
      body: shell,
      bottomNavigationBar: MediaQuery.viewInsetsOf(context).bottom > 0
          ? null
          : SafeArea(
              minimum: const EdgeInsets.fromLTRB(14, 4, 14, 8),
              child: StreamBuilder<bool>(
                stream: _reduceTransparency,
                builder: (context, snapshot) {
                  final opaque =
                      MediaQuery.highContrastOf(context) ||
                      (_reduceTransparency != null && snapshot.data != false);
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      boxShadow: [
                        BoxShadow(
                          color: colors.shadow.withValues(alpha: .15),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipPath(
                      clipper: const ShapeBorderClipper(shape: StadiumBorder()),
                      child: BackdropFilter(
                        enabled: !opaque,
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Material(
                          color: opaque
                              ? colors.surface
                              : colors.surface.withValues(alpha: .86),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: IgnorePointer(
                                    child: AnimatedAlign(
                                      duration:
                                          MediaQuery.disableAnimationsOf(
                                            context,
                                          )
                                          ? Duration.zero
                                          : const Duration(milliseconds: 220),
                                      curve: Curves.easeOutCubic,
                                      alignment: AlignmentDirectional(
                                        -1 + shell.currentIndex * 2 / 3,
                                        0,
                                      ),
                                      child: FractionallySizedBox(
                                        widthFactor: .25,
                                        heightFactor: 1,
                                        child: DecoratedBox(
                                          decoration: ShapeDecoration(
                                            color: colors.primaryContainer,
                                            shape: const StadiumBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    for (
                                      var index = 0;
                                      index < labels.length;
                                      index++
                                    )
                                      Expanded(
                                        child: Semantics(
                                          selected: index == shell.currentIndex,
                                          button: true,
                                          child: InkWell(
                                            customBorder: const StadiumBorder(),
                                            onTap: () => shell.goBranch(index),
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                minHeight: 54,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                    ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      icons[index],
                                                      size: 21,
                                                      color:
                                                          index ==
                                                              shell.currentIndex
                                                          ? colors
                                                                .onPrimaryContainer
                                                          : colors.onSurface,
                                                    ),
                                                    Text(
                                                      labels[index],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
