import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'wodlog_theme.dart';
import 'wodlog_shell.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/settings/display_preferences.dart';
import '../features/settings/settings_screen.dart';
import '../features/workout/presentation/today_screen.dart';
import '../features/workout/presentation/progress_screen.dart';
import '../features/workout/presentation/workout_history_screen.dart';
import '../features/workout/presentation/workout_session_screen.dart';
import '../l10n/generated/app_localizations.dart';

class WodLogApp extends ConsumerWidget {
  const WodLogApp({super.key});

  static final _router = GoRouter(
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => WodLogShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const TodayScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/history',
                builder: (context, state) => const WorkoutHistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/progress',
                builder: (context, state) => const ProgressScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/sessions/:sessionId',
        builder: (context, state) => WorkoutSessionScreen(
          sessionId: state.pathParameters['sessionId']!,
          initialBenchmark: state.uri.queryParameters['benchmark'],
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: ref.watch(displayPreferencesProvider).value?.locale,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale?.languageCode == 'zh') {
          final isTraditional =
              locale!.scriptCode == 'Hant' ||
              (locale.scriptCode == null &&
                  const {'TW', 'HK', 'MO'}.contains(locale.countryCode));
          final chineseLocale = Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: isTraditional ? 'Hant' : 'Hans',
          );
          if (supportedLocales.contains(chineseLocale)) return chineseLocale;
        }
        return basicLocaleListResolution(
          locale == null ? const [] : [locale],
          supportedLocales,
        );
      },
      theme: WodLogTheme.light,
      routerConfig: _router,
    );
  }
}
