import 'package:flutter/material.dart';
import '../../shared/colors.dart';

class DropdownStyles {
  static const Duration animationDuration = Duration(milliseconds: 200);
  static const double borderRadius = 16.0;
  static const double iconBorderRadius = 8.0;
  static const double itemBorderRadius = 12.0;
  static const double focusedBorderWidth = 2.0;
  static const double normalBorderWidth = 1.5;
  static const double maxMenuHeight = 300.0;
  static const double scaleAnimationBegin = 1.0;
  static const double scaleAnimationEnd = 1.02;
  static const double rotationAnimationBegin = 0.0;
  static const double rotationAnimationEnd = 0.5;

  static EdgeInsets get containerPadding => 
      const EdgeInsets.symmetric(horizontal: 16, vertical: 0);
  
  static EdgeInsets get itemPadding => 
      const EdgeInsets.symmetric(vertical: 12, horizontal: 16);
  
  static EdgeInsets get itemMargin => 
      const EdgeInsets.symmetric(horizontal: 8, vertical: 2);
  
  static EdgeInsets get iconPadding => const EdgeInsets.all(4);
  static EdgeInsets get largeIconPadding => const EdgeInsets.all(6);
  static EdgeInsets get errorPadding => 
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static Color getBorderColor({
    required bool hasError,
    required bool isFocused,
    required bool isHovered,
  }) {
    if (hasError) return normalErrorSystemColor;
    if (isFocused) return normalSecondaryBrandColor;
    if (isHovered) return lightSecondaryBrandColor;
    return normalSecondaryBaseColorLight.withValues(alpha: 0.3);
  }

  static LinearGradient getContainerGradient({required bool isEnabled}) {
    if (isEnabled) {
      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          lightTertiaryBaseColorLight,
          lightTertiaryBaseColorLight.withValues(alpha: 0.95),
        ],
      );
    } else {
      return LinearGradient(
        colors: [
          normalTertiaryBaseColorLight,
          normalTertiaryBaseColorLight.withValues(alpha: 0.8),
        ],
      );
    }
  }

  static List<BoxShadow> getBoxShadow({
    required bool isHovered,
    required bool isFocused,
  }) {
    if (isHovered || isFocused) {
      return [
        BoxShadow(
          color: (isFocused ? normalSecondaryBrandColor : lightSecondaryBrandColor)
              .withValues(alpha: 0.15),
          blurRadius: isFocused ? 12 : 8,
          offset: const Offset(0, 4),
          spreadRadius: isFocused ? 2 : 0,
        ),
      ];
    } else {
      return [
        BoxShadow(
          color: normalPrimaryBaseColorLight.withValues(alpha: 0.08),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];
    }
  }

  static Color getIconBackgroundColor({
    required bool isFocused,
    required bool isForPrefix,
  }) {
    if (isForPrefix) {
      return isFocused 
          ? normalSecondaryBrandColor.withValues(alpha: 0.1)
          : lightSecondaryBrandColor.withValues(alpha: 0.1);
    }
    return (isFocused ? normalSecondaryBrandColor : lightSecondaryBrandColor)
        .withValues(alpha: 0.1);
  }

  static Color getIconColor({
    required bool isEnabled,
    required bool isFocused,
  }) {
    if (!isEnabled) return lightSecondaryBaseColorLight;
    return isFocused ? normalSecondaryBrandColor : normalPrimaryBaseColorLight;
  }
}