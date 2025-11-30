import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/presentation/theme/window_size_class.dart';

/// The standard Material 3 TextTheme includes the following properties, in order of decreasing size:
///
/// displayLarge, displayMedium, displaySmall
///
/// headlineLarge, headlineMedium, headlineSmall
///
/// titleLarge, titleMedium, titleSmall
///
/// labelLarge, labelMedium, labelSmall
///
/// bodyLarge, bodyMedium, bodySmall
TextTheme textThemeFor(WindowSize size) {
  const lato = 'Lato';
  // choose between small/compact/medium/large typographies
  if (size is WindowSmall) {
    return TextTheme(
      displayLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 48, letterSpacing: _adaptiveLetterSpacing(48)),
      displayMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 40, letterSpacing: _adaptiveLetterSpacing(40)),
      displaySmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 32, letterSpacing: _adaptiveLetterSpacing(32)),

      headlineLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 28, letterSpacing: _adaptiveLetterSpacing(28)),
      headlineMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: _adaptiveLetterSpacing(24)),
      headlineSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 20, letterSpacing: _adaptiveLetterSpacing(20)),

      titleLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 23, letterSpacing: _adaptiveLetterSpacing(23)),
      titleMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 18, letterSpacing: _adaptiveLetterSpacing(18)),
      titleSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: _adaptiveLetterSpacing(16)),

      labelLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 14, letterSpacing: _adaptiveLetterSpacing(14)),
      labelMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: _adaptiveLetterSpacing(12)),
      labelSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w300, fontSize: 10, letterSpacing: _adaptiveLetterSpacing(10)),

      bodyLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: _adaptiveLetterSpacing(14)),
      bodyMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: _adaptiveLetterSpacing(12)),
      bodySmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w300, fontSize: 10, letterSpacing: _adaptiveLetterSpacing(10)),
    );
  } else if (size is WindowCompact) {
    return TextTheme(
      displayLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 52, letterSpacing: _adaptiveLetterSpacing(52)),
      displayMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 44, letterSpacing: _adaptiveLetterSpacing(44)),
      displaySmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 36, letterSpacing: _adaptiveLetterSpacing(36)),

      headlineLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 32, letterSpacing: _adaptiveLetterSpacing(32)),
      headlineMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 28, letterSpacing: _adaptiveLetterSpacing(28)),
      headlineSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: _adaptiveLetterSpacing(24)),

      titleLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 26, letterSpacing: _adaptiveLetterSpacing(26)),
      titleMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 20, letterSpacing: _adaptiveLetterSpacing(20)),
      titleSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 18, letterSpacing: _adaptiveLetterSpacing(18)),

      labelLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: _adaptiveLetterSpacing(16)),
      labelMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: _adaptiveLetterSpacing(14)),
      labelSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w300, fontSize: 12, letterSpacing: _adaptiveLetterSpacing(12)),

      bodyLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: _adaptiveLetterSpacing(16)),
      bodyMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: _adaptiveLetterSpacing(14)),
      bodySmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w300, fontSize: 12, letterSpacing: _adaptiveLetterSpacing(12)),
    );
  } else if (size is WindowMedium) {
    return TextTheme(
      displayLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 56, letterSpacing: _adaptiveLetterSpacing(56)),
      displayMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 48, letterSpacing: _adaptiveLetterSpacing(48)),
      displaySmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 40, letterSpacing: _adaptiveLetterSpacing(40)),

      headlineLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 36, letterSpacing: _adaptiveLetterSpacing(36)),
      headlineMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 32, letterSpacing: _adaptiveLetterSpacing(32)),
      headlineSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 28, letterSpacing: _adaptiveLetterSpacing(28)),

      titleLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 30, letterSpacing: _adaptiveLetterSpacing(30)),
      titleMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 22, letterSpacing: _adaptiveLetterSpacing(22)),
      titleSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 20, letterSpacing: _adaptiveLetterSpacing(20)),

      labelLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 18, letterSpacing: _adaptiveLetterSpacing(18)),
      labelMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: _adaptiveLetterSpacing(16)),
      labelSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w300, fontSize: 14, letterSpacing: _adaptiveLetterSpacing(14)),

      bodyLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 18, letterSpacing: _adaptiveLetterSpacing(18)),
      bodyMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: _adaptiveLetterSpacing(16)),
      bodySmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w300, fontSize: 14, letterSpacing: _adaptiveLetterSpacing(14)),
    );
  } else {
    // WindowLarge
    return TextTheme(
      displayLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 60, letterSpacing: _adaptiveLetterSpacing(60)),
      displayMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 52, letterSpacing: _adaptiveLetterSpacing(52)),
      displaySmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w900, fontSize: 44, letterSpacing: _adaptiveLetterSpacing(44)),

      headlineLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 40, letterSpacing: _adaptiveLetterSpacing(40)),
      headlineMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 36, letterSpacing: _adaptiveLetterSpacing(36)),
      headlineSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 32, letterSpacing: _adaptiveLetterSpacing(32)),

      titleLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 39, letterSpacing: _adaptiveLetterSpacing(39)),
      titleMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 25, letterSpacing: _adaptiveLetterSpacing(25)),
      titleSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 22, letterSpacing: _adaptiveLetterSpacing(22)),

      labelLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w700, fontSize: 20, letterSpacing: _adaptiveLetterSpacing(20)),
      labelMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 18, letterSpacing: _adaptiveLetterSpacing(18)),
      labelSmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w300, fontSize: 16, letterSpacing: _adaptiveLetterSpacing(16)),

      bodyLarge: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 26, letterSpacing: _adaptiveLetterSpacing(26)),
      bodyMedium: TextStyle(fontFamily: lato, fontWeight: FontWeight.w400, fontSize: 29, letterSpacing: _adaptiveLetterSpacing(29)),
      bodySmall: TextStyle(fontFamily: lato, fontWeight: FontWeight.w300, fontSize: 16, letterSpacing: _adaptiveLetterSpacing(16)),
    );
  }
}

double _adaptiveLetterSpacing(double fontSize) {
  // Use a sensible, standard formula for letter spacing
  if (fontSize <= 14) return 0.2;
  if (fontSize <= 20) return 0.15;
  if (fontSize <= 28) return 0.1;
  return 0.05;
}
