import 'package:flutter/material.dart';
import 'colors.dart';
import 'styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: normalSecondaryBrandColor),
      useMaterial3: true,
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        headlineLarge: heading1Light,
        headlineMedium: heading2Light,
        headlineSmall: heading3Regular,
        titleLarge: heading4Regular,
        titleMedium: heading5Regular,
        bodyLarge: paragraph1Regular,
        bodyMedium: paragraph2Medium,
        labelLarge: label1Semibold,
        labelMedium: label2Semibold,
        labelSmall: label2Regular,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: normalSecondaryBrandColor, brightness: Brightness.dark),
      useMaterial3: true,
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        headlineLarge: heading1LightDark,
        headlineMedium: heading2LightDark,
        headlineSmall: heading3RegularDark,
        titleLarge: heading4RegularDark,
        titleMedium: heading5RegularDark,
        bodyLarge: paragraph1RegularDark,
        bodyMedium: paragraph2MediumDark,
        labelLarge: label1SemiboldDark,
        labelMedium: label2SemiboldDark,
        labelSmall: label2RegularDark,
      ),
    );
  }
}
