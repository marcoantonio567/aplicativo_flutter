import 'package:flutter/material.dart';

enum AvatarSize {
  small,
  medium,
  large,
  extraLarge,
}

enum AvatarType {
  image,
  initials,
  icon,
}

class AvatarViewModel {
  final AvatarSize size;
  final AvatarType type;
  final String? imageUrl;
  final String? initials;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showBadge;
  final Color? badgeColor;
  final Widget? badgeWidget;
  final VoidCallback? onTap;
  final bool isLoading;

  AvatarViewModel({
    this.size = AvatarSize.medium,
    this.type = AvatarType.initials,
    this.imageUrl,
    this.initials,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.showBadge = false,
    this.badgeColor,
    this.badgeWidget,
    this.onTap,
    this.isLoading = false,
  });

  AvatarViewModel copyWith({
    AvatarSize? size,
    AvatarType? type,
    String? imageUrl,
    String? initials,
    IconData? icon,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    double? borderWidth,
    bool? showBadge,
    Color? badgeColor,
    Widget? badgeWidget,
    VoidCallback? onTap,
    bool? isLoading,
  }) {
    return AvatarViewModel(
      size: size ?? this.size,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
      initials: initials ?? this.initials,
      icon: icon ?? this.icon,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      showBadge: showBadge ?? this.showBadge,
      badgeColor: badgeColor ?? this.badgeColor,
      badgeWidget: badgeWidget ?? this.badgeWidget,
      onTap: onTap ?? this.onTap,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}