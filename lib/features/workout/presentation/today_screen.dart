import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../app/wodlog_theme.dart';
import '../../../core/database/app_database.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../settings/display_preferences.dart';
import 'wod_library_sheet.dart';
import 'wod_blocks_section.dart';
import '../providers/wod_providers.dart';
import 'wod_record_list.dart';
import 'workout_date_sheet.dart';
import '../providers/workout_providers.dart';

class TodayScreen extends ConsumerStatefulWidget {
  const TodayScreen({super.key});

  @override
  ConsumerState<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends ConsumerState<TodayScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sessions = ref.watch(
      sessionsForDateProvider(_formatDate(_selectedDate)),
    );
    final locale = Localizations.localeOf(context).toString();
    final today = DateUtils.dateOnly(DateTime.now());
    final isToday = DateUtils.isSameDay(_selectedDate, today);

    final recent = ref.watch(recentSessionsProvider).value;
    final goal = ref.watch(displayPreferencesProvider).value?.weeklyGoal;
    final dates = [
      for (var offset = -6; offset <= 0; offset++)
        DateUtils.addDaysToDate(today, offset),
    ];
    final activitySessions = [
      for (final date in dates)
        ref.watch(sessionsForDateProvider(_formatDate(date))),
    ];
    final activity = [
      for (final day in activitySessions)
        for (final session in day.value ?? const <WorkoutSession>[])
          (
            date: session.workoutDate,
            blocks: ref.watch(wodBlocksForSessionProvider(session.id)),
          ),
    ];
    final activityReady =
        activitySessions.every((day) => day.hasValue) &&
        activity.every((item) => item.blocks.hasValue);
    final days = {
      for (final item in activity)
        if (item.blocks.value?.isNotEmpty ?? false) item.date,
    };
    final number = NumberFormat.decimalPattern(locale);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                'assets/branding/wodlog-launcher.png',
                width: 28,
                height: 28,
                fit: BoxFit.cover,
                semanticLabel: 'WODLog',
              ),
            ),
            const SizedBox(width: 8),
            const Text('WODLog'),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            20,
            8,
            20,
            16 + MediaQuery.paddingOf(context).bottom,
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.workoutDate(
                          _formatDisplayDate(_selectedDate, context),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isToday ? l10n.todayWodTitle : l10n.workoutLog,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontSize: 31),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: l10n.chooseDate,
                  constraints: const BoxConstraints(
                    minWidth: 48,
                    minHeight: 48,
                  ),
                  onPressed: _chooseDate,
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const ExcludeSemantics(
                          child: Icon(Icons.fitness_center, size: 32),
                        ),
                        const Spacer(),
                        PopupMenuButton<int>(
                          tooltip: MaterialLocalizations.of(context)
                              .moreButtonTooltip,
                          constraints: const BoxConstraints(
                            minWidth: 200,
                            maxWidth: 320,
                          ),
                          icon: const Icon(Icons.more_horiz),
                          style: IconButton.styleFrom(
                            minimumSize: const Size(48, 48),
                          ),
                          onSelected: (action) async {
                            switch (action) {
                              case 0:
                                final template = await showWodLibrary(context);
                                if (template != null && mounted) {
                                  await _startWorkout(template.name);
                                }
                              case 1:
                                if (mounted) {
                                  showPastWods(context, recent ?? []);
                                }
                              case 2:
                                context.go('/progress');
                              case 3:
                                context.go('/history');
                            }
                          },
                          itemBuilder: (context) => [
                            for (final (index, item) in [
                              (l10n.homeBenchmarks, Icons.fitness_center),
                              (l10n.homeRepeatWod, Icons.replay),
                              (l10n.homeWodPr, Icons.trending_up),
                              (l10n.history, Icons.history),
                            ].indexed)
                              PopupMenuItem(
                                value: index,
                                height: 48,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      ExcludeSemantics(child: Icon(item.$2)),
                                      const SizedBox(width: 12),
                                      Expanded(child: Text(item.$1)),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(48, 56),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      onPressed: _startWorkout,
                      icon: const Icon(Icons.add),
                      label: Text(l10n.recordWod, textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                title: Text(l10n.lastSevenDays),
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      [
                        l10n.weeklyGoal,
                        if (activityReady && goal != null)
                          '${number.format(days.length)} / ${number.format(goal)}',
                      ].join(' · '),
                    ),
                  ),
                  const SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Wrap instead of shrinking interactive dates below 48 px.
                      final dayWidth = (constraints.maxWidth / 7).clamp(
                        48.0 * MediaQuery.textScalerOf(context).scale(14) / 14,
                        double.infinity,
                      );
                      return Wrap(
                        runSpacing: 12,
                        children: [
                          for (final date in dates)
                            SizedBox(
                              width: dayWidth,
                              child: _dayChip(context, date, days, locale),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    isToday
                        ? l10n.wodRecentRecords
                        : _formatDisplayDate(_selectedDate, context),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(minimumSize: const Size(48, 48)),
                  onPressed: () => context.go('/history'),
                  child: Text(l10n.wodViewAll),
                ),
              ],
            ),
            if (sessions.value case final currentSessions?)
              WodRecordList(
                sessions: isToday
                    ? [
                        ...currentSessions,
                        for (final item in (recent ?? const <WorkoutSession>[]))
                          if (item.workoutDate != _formatDate(today)) item,
                      ]
                    : currentSessions,
                limit: isToday ? 3 : null,
              ),
          ],
        ),
      ),
    );
  }

  bool _starting = false;

  Future<void> _startWorkout([String? benchmark]) async {
    if (_starting) return;
    _starting = true;
    try {
      await showWodResultEditor(
        context,
        ref,
        const Uuid().v4(),
        newWorkoutDate: _formatDate(_selectedDate),
        initialBenchmark: benchmark,
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.wodSaveError)),
        );
      }
    } finally {
      _starting = false;
    }
  }

  Widget _dayChip(
    BuildContext context,
    DateTime date,
    Set<String> dates,
    String locale,
  ) {
    final selected = DateUtils.isSameDay(date, _selectedDate);
    final recorded = dates.contains(_formatDate(date));
    return Semantics(
      button: true,
      selected: selected,
      label: _formatDisplayDate(date, context),
      child: Tooltip(
        message: _formatDisplayDate(date, context),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => setState(() => _selectedDate = date),
          child: Ink(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  Text(
                    DateFormat.E(locale).format(date),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                    padding: const EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected ? WodLogColors.navy : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      NumberFormat.decimalPattern(locale).format(date.day),
                      style: TextStyle(
                        color: selected ? Colors.white : null,
                        fontWeight: selected ? FontWeight.w700 : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: recorded
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _chooseDate() async {
    final selected = await showWorkoutDateSheet(context, _selectedDate);
    if (selected != null && mounted) {
      setState(() => _selectedDate = DateUtils.dateOnly(selected));
    }
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
