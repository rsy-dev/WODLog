import 'package:intl/intl.dart';

/// Numeric fields use ungrouped values so a decimal cannot be mistaken for
/// a thousands separator. Accept both keyboard ASCII and locale digits.
double? parseLocalizedDecimal(String input, NumberFormat format) {
  final zero = format.symbols.ZERO_DIGIT.runes.single;
  final value = String.fromCharCodes(
    input.trim().runes.map((digit) {
      if (digit >= zero && digit <= zero + 9) return digit - zero + 48;
      return digit;
    }),
  );
  final separator = format.symbols.DECIMAL_SEP;
  final decimal = separator != '.' && format.symbols.GROUP_SEP != '.'
      ? '[${RegExp.escape(separator)}.]'
      : RegExp.escape(separator);
  if (!RegExp('^(?:[0-9]+(?:$decimal[0-9]*)?|$decimal[0-9]+)\$')
      .hasMatch(value)) {
    return null;
  }
  final parsed = double.tryParse(value.replaceAll(separator, '.'));
  return parsed != null && parsed.isFinite ? parsed : null;
}
