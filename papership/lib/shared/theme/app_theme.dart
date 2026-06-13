import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme({required ColorScheme colorScheme}) {
    final brightness = colorScheme.brightness;
    final baseTheme = brightness == Brightness.light ? ThemeData.light() : ThemeData.dark();

    final inter = GoogleFonts.interTextTheme(baseTheme.textTheme);
    final interTight = GoogleFonts.interTightTextTheme(baseTheme.textTheme);

    final textTheme = inter.copyWith(
      displayLarge: interTight.displayLarge,
      displayMedium: interTight.displayMedium,
      displaySmall: interTight.displaySmall,
      headlineLarge: interTight.headlineLarge,
      headlineMedium: interTight.headlineMedium,
      headlineSmall: interTight.headlineSmall,
      titleLarge: interTight.titleLarge?.copyWith(fontWeight: FontWeight.w500),
      titleMedium: interTight.titleMedium?.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
      titleSmall: interTight.titleSmall?.copyWith(fontWeight: FontWeight.w500),
      bodyLarge: inter.bodyLarge,
      bodyMedium: inter.bodyMedium,
      bodySmall: inter.bodySmall?.copyWith(fontSize: 12),
      labelLarge: inter.labelLarge,
      labelMedium: inter.labelMedium,
      labelSmall: inter.labelSmall,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      cardTheme: CardThemeData(
        elevation: brightness == Brightness.light ? 0 : 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: brightness == Brightness.light
              ? BorderSide(color: colorScheme.outlineVariant)
              : BorderSide.none,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
