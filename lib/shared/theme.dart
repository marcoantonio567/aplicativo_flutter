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
}