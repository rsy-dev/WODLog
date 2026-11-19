import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/generated/app_localizations.dart';

typedef DisplayPreferences = ({Locale? locale, int weeklyGoal});

final displayPreferencesProvider =
    AsyncNotifierProvider<DisplayPreferenceNotifier, DisplayPreferences>(
      DisplayPreferenceNotifier.new,
    );

class DisplayPreferenceNotifier extends AsyncNotifier<DisplayPreferences> {
  late final _preferences = SharedPreferencesAsync();

  @override
  Future<DisplayPreferences> build() async {
    final tag = await _preferences.getString('language');
    final goal = await _preferences.getInt('weeklyGoal');
    return (
      locale: AppLocalizations.supportedLocales
          .where((locale) => locale.toLanguageTag() == tag)
          .firstOrNull,
      weeklyGoal: goal != null && goal >= 1 && goal <= 7 ? goal : 3,
    );
  }

  Future<void> setLocale(Locale? locale) async {
    final previous = await future;
    if (locale == null) {
      await _preferences.remove('language');
    } else {
      await _preferences.setString('language', locale.toLanguageTag());
    }
    state = AsyncData((
      locale: locale,
      weeklyGoal: state.value?.weeklyGoal ?? previous.weeklyGoal,
    ));
  }

  Future<void> setWeeklyGoal(int goal) async {
    RangeError.checkValueInInterval(goal, 1, 7, 'goal');
    final previous = await future;
    await _preferences.setInt('weeklyGoal', goal);
    state = AsyncData((
      locale: state.value == null ? previous.locale : state.value!.locale,
      weeklyGoal: goal,
    ));
  }
}
