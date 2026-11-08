import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../providers/workout_providers.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final today = DateTime.now();
    final workoutDate = _formatDate(today);
    final sessions = ref.watch(sessionsForDateProvider(workoutDate));

    return Scaffold(
      appBar: AppBar(title: const Text('WODLog')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.todayWorkout,
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(l10n.workoutDate(_formatDisplayDate(today, context))),
              const SizedBox(height: 24),
              Expanded(
                child: sessions.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(
                    child: Text(
                      l10n.loadWorkoutError,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  data: (items) => items.isEmpty
                      ? const _EmptyWorkoutState()
                      : ListView.separated(
                          itemCount: items.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final session = items[index];
                            final localCreatedAt =
                                DateTime.fromMillisecondsSinceEpoch(
                                  session.createdAt,
                                  isUtc: true,
                                ).toLocal();
                            return Card(
                              child: ListTile(
                                onTap: () =>
                                    context.push('/sessions/${session.id}'),
                                leading: const Icon(Icons.fitness_center),
                                title: Text(session.title ?? l10n.workoutLog),
                                subtitle: Text(
                                  TimeOfDay.fromDateTime(localCreatedAt)
                                      .format(context),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () async {
                    await ref
                        .read(workoutRepositoryProvider)
                        .createSession(workoutDate: workoutDate);
                  },
                  icon: const Icon(Icons.add),
                  label: Text(l10n.startWorkout),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  static String _formatDisplayDate(DateTime date, BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.yMMMMEEEEd(locale).format(date);
  }
}

class _EmptyWorkoutState extends StatelessWidget {
  const _EmptyWorkoutState();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.event_note_outlined,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Text(l10n.noRecords, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(l10n.emptyTodayHelp),
        ],
      ),
    );
  }
}
