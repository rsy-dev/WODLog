import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../providers/workout_providers.dart';

class WorkoutHistoryScreen extends ConsumerWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final sessions = ref.watch(recentSessionsProvider);
    final locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.history)),
      body: sessions.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(l10n.loadWorkoutError, textAlign: TextAlign.center),
        ),
        data: (items) => items.isEmpty
            ? Center(child: Text(l10n.emptyHistory))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final session = items[index];
                  final localTime = DateTime.fromMillisecondsSinceEpoch(
                    session.createdAt,
                    isUtc: true,
                  ).toLocal();
                  final date = DateTime.tryParse(session.workoutDate);
                  final dateLabel = date == null
                      ? session.workoutDate
                      : DateFormat.yMMMMd(locale).format(date);
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.fitness_center),
                      title: Text(session.title ?? l10n.workoutLog),
                      subtitle: Text(
                        '$dateLabel · ${TimeOfDay.fromDateTime(localTime).format(context)}',
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/sessions/${session.id}'),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
