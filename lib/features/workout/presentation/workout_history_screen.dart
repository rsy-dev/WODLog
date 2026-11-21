import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../providers/workout_providers.dart';
import 'wod_record_list.dart';
import 'wod_blocks_section.dart';

import 'package:uuid/uuid.dart';

class WorkoutHistoryScreen extends ConsumerStatefulWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  ConsumerState<WorkoutHistoryScreen> createState() =>
      _WorkoutHistoryScreenState();
}

class _WorkoutHistoryScreenState extends ConsumerState<WorkoutHistoryScreen> {
  bool _showWods = true;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sessions = ref.watch(recentSessionsProvider);
    final locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(title: const Text('WODLog')),
      body: sessions.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(l10n.loadWorkoutError, textAlign: TextAlign.center),
        ),
        data: (sessions) {
          final items = sessions.where(
            (session) => '${session.title ?? ''} ${session.workoutDate}'
                .toLowerCase()
                .contains(_query),
          );
          return ListView(
            padding: EdgeInsets.fromLTRB(
              16,
              16,
              16,
              16 + MediaQuery.paddingOf(context).bottom,
            ),
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 12,
                runSpacing: 8,
                children: [
                  Text(
                    l10n.workoutLog,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  FilledButton.icon(
                    onPressed: () => showWodResultEditor(
                      context,
                      ref,
                      const Uuid().v4(),
                      newWorkoutDate: DateFormat('yyyy-MM-dd')
                          .format(DateTime.now()),
                    ),
                    icon: const Icon(Icons.add),
                    label: Text(l10n.recordWod),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 8,
                        children: [
                          ChoiceChip(
                            label: const Text('WOD'),
                            selected: _showWods,
                            onSelected: (_) => setState(() => _showWods = true),
                          ),
                          ChoiceChip(
                            label: Text(l10n.strengthSessions),
                            selected: !_showWods,
                            onSelected: (_) =>
                                setState(() => _showWods = false),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          labelText: l10n.searchWorkouts,
                          prefixIcon: const Icon(Icons.search),
                        ),
                        onChanged: (value) =>
                            setState(() => _query = value.trim().toLowerCase()),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (_showWods) ...[
                OutlinedButton(
                  onPressed: () => showPastWods(context, sessions),
                  child: Text(l10n.pastWods),
                ),
                WodRecordList(sessions: sessions, query: _query),
              ] else ...[
                FilledButton.icon(
                  onPressed: _startStrengthSession,
                  icon: const Icon(Icons.add),
                  label: Text(l10n.addStrengthBlock),
                ),
                const SizedBox(height: 8),
                if (items.isEmpty) Text(l10n.noMatchingWorkouts),
                for (final session in items)
                  Builder(
                    builder: (context) {
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
              ],
            ],
          );
        },
      ),
    );
  }

  Future<void> _startStrengthSession() async {
    try {
      final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final sessionId = await ref
          .read(workoutRepositoryProvider)
          .createSession(workoutDate: date);
      if (mounted) context.push('/sessions/$sessionId');
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.loadWorkoutError),
          ),
        );
      }
    }
  }
}
