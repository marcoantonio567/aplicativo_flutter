import 'package:flutter/material.dart';
import '../../shared/colors.dart';

enum BannerType { info, success, warning, error, promotional }

class BannerTheme {
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;
  final IconData defaultIcon;

  const BannerTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
    required this.defaultIcon,
  });

  static const Map<BannerType, BannerTheme> themes = {
    BannerType.info: BannerTheme(
      backgroundColor: lightPrimaryBrandColor,
      borderColor: normalPrimaryBrandColor,
      iconColor: normalPrimaryBrandColor,
      textColor: normalSecondaryBaseColorLight,
      defaultIcon: Icons.info_outline,
    ),
    BannerType.success: BannerTheme(
      backgroundColor: lightSuccessSystemColor,
      borderColor: normalSuccessSystemColor,
      iconColor: normalSuccessSystemColor,
      textColor: normalSecondaryBaseColorLight,
      defaultIcon: Icons.check_circle_outline,
    ),
    BannerType.warning: BannerTheme(
      backgroundColor: Color(0xFFFFF3CD),
      borderColor: Color(0xFFFFE69C),
      iconColor: Color(0xFFB45309),
      textColor: Color(0xFF664D03),
      defaultIcon: Icons.warning_amber_outlined,
    ),
    BannerType.error: BannerTheme(
      backgroundColor: lightErrorSystemColor,
      borderColor: normalErrorSystemColor,
      iconColor: normalErrorSystemColor,
      textColor: normalSecondaryBaseColorLight,
      defaultIcon: Icons.error_outline,
    ),
    BannerType.promotional: BannerTheme(
      backgroundColor: lightTertiaryBrandColor,
      borderColor: normalTertiaryBrandColor,
      iconColor: normalTertiaryBrandColor,
      textColor: lightTertiaryBaseColorLight,
      defaultIcon: Icons.campaign_outlined,
    ),
  };

  static BannerTheme getTheme(BannerType type) {
    return themes[type] ?? themes[BannerType.info]!;
  }
}