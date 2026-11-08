import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/workout/presentation/today_screen.dart';
import '../features/workout/presentation/workout_session_screen.dart';
import '../l10n/generated/app_localizations.dart';

class WodLogApp extends StatelessWidget {
  const WodLogApp({super.key});

  static final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const TodayScreen()),
      GoRoute(
        path: '/sessions/:sessionId',
        builder: (context, state) =>
            WorkoutSessionScreen(sessionId: state.pathParameters['sessionId']!),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF176B5B)),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
