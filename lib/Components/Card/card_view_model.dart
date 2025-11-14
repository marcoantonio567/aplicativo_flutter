import 'package:flutter/material.dart';

enum CardType {
  primary,
  secondary,
  tertiary,
  gradient,
  outlined,
}

enum CardSize {
  small,
  medium,
  large,
}

class CardViewModel {
  final CardType type;
  final CardSize size;
  final String? title;
  final String? subtitle;
  final String? description;
  final IconData? icon;
  final Widget? customIcon;
  final String? badgeText;
  final Widget? trailing;
  final Widget? customContent;
  final bool hasShadow;
  final VoidCallback? onTap;
  final bool isLoading;

  CardViewModel({
    this.type = CardType.primary,
    this.size = CardSize.medium,
    this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.customIcon,
    this.badgeText,
    this.trailing,
    this.customContent,
    this.hasShadow = true,
    this.onTap,
    this.isLoading = false,
  });

  CardViewModel copyWith({
    CardType? type,
    CardSize? size,
    String? title,
    String? subtitle,
    String? description,
    IconData? icon,
    Widget? customIcon,
    String? badgeText,
    Widget? trailing,
    Widget? customContent,
    bool? hasShadow,
    VoidCallback? onTap,
    bool? isLoading,
  }) {
    return CardViewModel(
      type: type ?? this.type,
      size: size ?? this.size,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      customIcon: customIcon ?? this.customIcon,
      badgeText: badgeText ?? this.badgeText,
      trailing: trailing ?? this.trailing,
      customContent: customContent ?? this.customContent,
      hasShadow: hasShadow ?? this.hasShadow,
      onTap: onTap ?? this.onTap,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}