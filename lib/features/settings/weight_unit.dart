import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum WeightUnit {
  kg(1),
  lb(0.45359237);

  const WeightUnit(this._kilograms);
  final double _kilograms;

  double fromKg(double value) => value / _kilograms;
  double toKg(double value) => value * _kilograms;

  String format(double kg, NumberFormat number) =>
      '\u2066${number.format(fromKg(kg))}\u00a0$name\u2069';
}

final weightUnitProvider =
    AsyncNotifierProvider<WeightUnitPreference, WeightUnit>(
      WeightUnitPreference.new,
    );

class WeightUnitPreference extends AsyncNotifier<WeightUnit> {
  static const _key = 'weightUnit';
  late final _preferences = SharedPreferencesAsync();

  @override
  Future<WeightUnit> build() async => await _preferences.getString(_key) == 'lb'
      ? WeightUnit.lb
      : WeightUnit.kg;

  bool _saving = false;

  Future<void> select(WeightUnit unit) async {
    if (_saving || state.isLoading || state.value == unit) return;
    _saving = true;
    try {
      await _preferences.setString(_key, unit.name);
      state = AsyncData(unit);
    } finally {
      _saving = false;
    }
  }
}
