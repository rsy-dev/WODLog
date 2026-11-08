import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/workout/presentation/today_screen.dart';

class WodLogApp extends StatelessWidget {
  const WodLogApp({super.key});

  static final _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const TodayScreen()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WODLog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF176B5B)),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
