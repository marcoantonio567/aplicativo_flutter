import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'avatar_config.dart';

class AvatarTheme {
  static double getSizeValue(AvatarSize size) {
    switch (size) {
      case AvatarSize.small:
        return 32.0;
      case AvatarSize.medium:
        return 48.0;
      case AvatarSize.large:
        return 64.0;
      case AvatarSize.extraLarge:
        return 96.0;
    }
  }

  static TextStyle getTextStyle(AvatarSize size) {
    switch (size) {
      case AvatarSize.small:
        return label2Semibold;
      case AvatarSize.medium:
        return label1Semibold;
      case AvatarSize.large:
        return heading5Regular;
      case AvatarSize.extraLarge:
        return heading4Regular;
    }
  }

  static double getIconSize(AvatarSize size) {
    switch (size) {
      case AvatarSize.small:
        return 16.0;
      case AvatarSize.medium:
        return 24.0;
      case AvatarSize.large:
        return 32.0;
      case AvatarSize.extraLarge:
        return 48.0;
    }
  }

  static Color getDefaultBackgroundColor() {
    return normalSecondaryBrandColor;
  }

  static Color getDefaultTextColor() {
    return lightTertiaryBaseColorLight;
  }

  static Color getDefaultBorderColor() {
    return lightSecondaryBrandColor;
  }

  static double getDefaultBorderWidth() {
    return 2.0;
  }

  static Color getDefaultBadgeColor() {
    return normalPrimaryBrandColor;
  }

  static double getBadgeSize(AvatarSize size) {
    switch (size) {
      case AvatarSize.small:
        return 10.0;
      case AvatarSize.medium:
        return 12.0;
      case AvatarSize.large:
        return 16.0;
      case AvatarSize.extraLarge:
        return 20.0;
    }
  }

  static double getBadgeOffset(AvatarSize size) {
    switch (size) {
      case AvatarSize.small:
        return -2.0;
      case AvatarSize.medium:
        return -4.0;
      case AvatarSize.large:
        return -6.0;
      case AvatarSize.extraLarge:
        return -8.0;
    }
  }
}