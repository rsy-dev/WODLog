import 'package:flutter/material.dart';

abstract final class WodLogColors {
  static const ink = Color(0xFF191F28);
  static const secondaryText = Color(0xFF6B7684);
  static const blue = Color(0xFF3182F6);
  static const blueSoft = Color(0xFFEAF3FF);
  static const background = Color(0xFFF6F7F9);
  static const surface = Colors.white;
  static const line = Color(0xFFE9EDF2);
  static const success = Color(0xFF15966A);
  static const negative = Color(0xFFE5484D);
}

abstract final class WodLogTheme {
  static ThemeData get light {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: WodLogColors.blue,
          brightness: Brightness.light,
        ).copyWith(
          primary: WodLogColors.blue,
          onPrimary: Colors.white,
          secondary: WodLogColors.success,
          error: WodLogColors.negative,
          surface: WodLogColors.surface,
          onSurface: WodLogColors.ink,
          outline: WodLogColors.line,
        );
    final baseText = ThemeData.light().textTheme;

    return ThemeData(
      colorScheme: scheme,
      scaffoldBackgroundColor: WodLogColors.background,
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
      textTheme: baseText.copyWith(
        headlineLarge: baseText.headlineLarge?.copyWith(
          color: WodLogColors.ink,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          height: 1.16,
          letterSpacing: -0.8,
        ),
        headlineMedium: baseText.headlineMedium?.copyWith(
          color: WodLogColors.ink,
          fontSize: 26,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: -0.55,
        ),
        headlineSmall: baseText.headlineSmall?.copyWith(
          color: WodLogColors.ink,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          height: 1.25,
          letterSpacing: -0.35,
        ),
        titleLarge: baseText.titleLarge?.copyWith(
          color: WodLogColors.ink,
          fontSize: 19,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.25,
        ),
        titleMedium: baseText.titleMedium?.copyWith(
          color: WodLogColors.ink,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.15,
        ),
        bodyLarge: baseText.bodyLarge?.copyWith(
          color: WodLogColors.ink,
          fontSize: 16,
          height: 1.45,
        ),
        bodyMedium: baseText.bodyMedium?.copyWith(
          color: WodLogColors.secondaryText,
          fontSize: 14,
          height: 1.4,
        ),
        bodySmall: baseText.bodySmall?.copyWith(
          color: WodLogColors.secondaryText,
          fontSize: 12,
          height: 1.35,
        ),
        labelLarge: baseText.labelLarge?.copyWith(
          color: WodLogColors.ink,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: WodLogColors.background,
        foregroundColor: WodLogColors.ink,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 56,
        titleTextStyle: TextStyle(
          color: WodLogColors.ink,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
        ),
      ),
      cardTheme: CardThemeData(
        color: WodLogColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: WodLogColors.line, width: 0.8),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(48, 54),
          backgroundColor: WodLogColors.blue,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 50),
          foregroundColor: WodLogColors.blue,
          side: const BorderSide(color: WodLogColors.line),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF2F4F7),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        hintStyle: const TextStyle(color: WodLogColors.secondaryText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: WodLogColors.blue, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: WodLogColors.negative),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFFF0F2F5),
        selectedColor: WodLogColors.blueSoft,
        side: BorderSide.none,
        shape: const StadiumBorder(),
        labelStyle: const TextStyle(
          color: WodLogColors.ink,
          fontWeight: FontWeight.w500,
        ),
        secondaryLabelStyle: const TextStyle(
          color: WodLogColors.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: WodLogColors.line,
        thickness: 1,
        space: 1,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: WodLogColors.blue,
        linearTrackColor: Color(0xFFE7EEF9),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: WodLogColors.surface,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: WodLogColors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
