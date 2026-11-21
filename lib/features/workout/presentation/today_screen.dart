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
    final textScaler = MediaQuery.textScalerOf(context);
    final compactDate =
        MediaQuery.sizeOf(context).width < 360 || textScaler.scale(16) > 24;
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
    final shortcutStyle = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      minimumSize: const Size(48, 48),
    );

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
                Tooltip(
                  message: l10n.chooseDate,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: WodLogColors.surface,
                      foregroundColor: WodLogColors.navy,
                      minimumSize: const Size(48, 48),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    onPressed: _chooseDate,
                    icon: const Icon(Icons.calendar_month_outlined, size: 18),
                    label: compactDate
                        ? const SizedBox.shrink()
                        : Text(l10n.chooseDate),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFC43C12), Color(0xFFA82B0A)],
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _startWorkout,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.white24,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  l10n.recordWod,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 6, 12, 8),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final shortcuts = <(String, IconData, VoidCallback)>[
                          (
                            l10n.homeBenchmarks,
                            Icons.grid_view_rounded,
                            () async {
                              final template = await showWodLibrary(context);
                              if (template != null && mounted) {
                                await _startWorkout(template.name);
                              }
                            },
                          ),
                          (
                            l10n.homeRepeatWod,
                            Icons.refresh_rounded,
                            () => showPastWods(context, recent ?? []),
                          ),
                          (
                            l10n.homeWodPr,
                            Icons.trending_up_rounded,
                            () => context.go('/progress'),
                          ),
                        ];
                        final equalWidths = textScaler.scale(16) <= 24;

                        if (equalWidths) {
                          return Row(
                            children: [
                              for (final (index, shortcut)
                                  in shortcuts.indexed) ...[
                                Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: shortcut.$3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 3,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            shortcut.$2,
                                            size: 20,
                                            color: WodLogColors.accent,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            shortcut.$1,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                  color: WodLogColors.ink,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                if (index < shortcuts.length - 1)
                                  const SizedBox(
                                    height: 48,
                                    child: VerticalDivider(width: 1),
                                  ),
                              ],
                            ],
                          );
                        }
                        return Column(
                          children: [
                            for (final (label, icon, onPressed) in shortcuts)
                              SizedBox(
                                width: constraints.maxWidth,
                                child: TextButton.icon(
                                  style: shortcutStyle,
                                  onPressed: onPressed,
                                  icon: Icon(icon),
                                  label: Text(label),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Card(
              color: WodLogColors.blueSurface,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.lastSevenDays,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            [
                              l10n.weeklyGoal,
                              if (activityReady && goal != null)
                                '${number.format(days.length)} / ${number.format(goal)}',
                            ].join(' · '),
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        for (final date in dates)
                          Expanded(
                            child: _dayChip(context, date, days, locale),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
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
      selected: selected,
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
                    width: 32,
                    height: 32,
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
