import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/spacing.dart';
import 'card_types.dart';

class CardStyles {
  static double getElevation(CardSize size) {
    switch (size) {
      case CardSize.small:
        return 2;
      case CardSize.medium:
        return 4;
      case CardSize.large:
        return 6;
    }
  }

  static double getBorderRadius(CardSize size) {
    switch (size) {
      case CardSize.small:
        return radiusSm;
      case CardSize.medium:
        return radiusMd;
      case CardSize.large:
        return radiusLg;
    }
  }

  static double getPadding(CardSize size) {
    switch (size) {
      case CardSize.small:
        return spaceSm;
      case CardSize.medium:
        return spaceMd;
      case CardSize.large:
        return spaceLg;
    }
  }

  static double getContentSpacing(CardSize size) {
    switch (size) {
      case CardSize.small:
        return spaceXs;
      case CardSize.medium:
        return spaceSm;
      case CardSize.large:
        return spaceMd;
    }
  }

  static BoxDecoration getDecoration(CardType type, CardSize size) {
    final borderRadius = getBorderRadius(size);
    
    switch (type) {
      case CardType.primary:
        return BoxDecoration(
          color: lightTertiaryBaseColorLight,
          borderRadius: BorderRadius.circular(borderRadius),
        );
      case CardType.secondary:
        return BoxDecoration(
          color: normalSecondaryBrandColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(borderRadius),
        );
      case CardType.tertiary:
        return BoxDecoration(
          color: normalTertiaryBrandColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(borderRadius),
        );
      case CardType.gradient:
        return BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              normalSecondaryBrandColor.withValues(alpha: 0.1),
              lightSecondaryBrandColor.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        );
      case CardType.outlined:
        return BoxDecoration(
          color: lightTertiaryBaseColorLight,
          borderRadius: BorderRadius.circular(borderRadius),
        );
    }
  }

  static TextStyle getTitleStyle(CardSize size) {
    switch (size) {
      case CardSize.small:
        return label1Semibold;
      case CardSize.medium:
        return heading5Regular;
      case CardSize.large:
        return heading4Regular;
    }
  }

  static TextStyle getSubtitleStyle() {
    return paragraph2Medium.copyWith(
      color: normalSecondaryBrandColor,
    );
  }

  static TextStyle getDescriptionStyle() {
    return paragraph2Medium.copyWith(
      color: normalSecondaryBaseColorLight,
    );
  }

  static TextStyle getBadgeTextStyle() {
    return labelLinkSemibold.copyWith(
      color: lightTertiaryBaseColorLight,
      decoration: TextDecoration.none,
    );
  }

  static Color getIconColor(CardType type) {
    switch (type) {
      case CardType.primary:
      case CardType.outlined:
        return normalSecondaryBrandColor;
      case CardType.secondary:
        return normalSecondaryBrandColor;
      case CardType.tertiary:
        return normalTertiaryBrandColor;
      case CardType.gradient:
        return normalSecondaryBrandColor;
    }
  }

  static Color getIconBackgroundColor(CardType type) {
    switch (type) {
      case CardType.primary:
      case CardType.outlined:
        return normalSecondaryBrandColor.withValues(alpha: 0.1);
      case CardType.secondary:
        return normalSecondaryBrandColor.withValues(alpha: 0.15);
      case CardType.tertiary:
        return normalTertiaryBrandColor.withValues(alpha: 0.15);
      case CardType.gradient:
        return lightTertiaryBaseColorLight.withValues(alpha: 0.8);
    }
  }

  static double getIconSize(CardSize size) {
    switch (size) {
      case CardSize.small:
        return iconSizeMd;
      case CardSize.medium:
        return iconSizeLg;
      case CardSize.large:
        return iconSizeXl;
    }
  }

  static double getIconPadding(CardSize size) {
    switch (size) {
      case CardSize.small:
        return spaceXs;
      case CardSize.medium:
        return spaceSm;
      case CardSize.large:
        return spaceMd;
    }
  }

  static double getIconBorderRadius(CardSize size) {
    switch (size) {
      case CardSize.small:
        return radiusXs;
      case CardSize.medium:
        return radiusSm;
      case CardSize.large:
        return radiusMd;
    }
  }
}