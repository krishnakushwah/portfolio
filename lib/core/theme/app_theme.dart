import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF18D2C3);
  static const Color accent = Color(0xFF7C5CFF);
  static const Color ink = Color(0xFF101828);
  static const Color lightSurface = Color(0xFFF6F8FB);
  static const Color darkSurface = Color(0xFF08111F);

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
        primary: primary,
        secondary: accent,
        surface: darkSurface,
      ),
      scaffoldBackgroundColor: darkSurface,
      fontFamily: 'Inter',
      textTheme: _textTheme(Brightness.dark),
    );
  }

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
        primary: const Color(0xFF087F78),
        secondary: accent,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: lightSurface,
      fontFamily: 'Inter',
      textTheme: _textTheme(Brightness.light),
    );
  }

  static TextTheme _textTheme(Brightness brightness) {
    final baseColor = brightness == Brightness.dark ? Colors.white : ink;
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 64,
        height: 1.02,
        fontWeight: FontWeight.w800,
        color: baseColor,
      ),
      displayMedium: TextStyle(
        fontSize: 44,
        height: 1.08,
        fontWeight: FontWeight.w800,
        color: baseColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        height: 1.35,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.7,
        color: baseColor.withValues(alpha: .78),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.55,
        color: baseColor.withValues(alpha: .72),
      ),
    );
  }
}
