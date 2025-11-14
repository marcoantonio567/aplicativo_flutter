import 'package:flutter/material.dart';
import 'banner_theme.dart';

class BannerViewModel {
  final String title;
  final String? subtitle;
  final BannerType type;
  final IconData? icon;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final bool showCloseButton;
  final VoidCallback? onDismiss;
  final Widget? customContent;
  final bool isLoading;

  BannerViewModel({
    required this.title,
    this.subtitle,
    required this.type,
    this.icon,
    this.actionText,
    this.onActionPressed,
    this.showCloseButton = false,
    this.onDismiss,
    this.customContent,
    this.isLoading = false,
  });

  BannerViewModel copyWith({
    String? title,
    String? subtitle,
    BannerType? type,
    IconData? icon,
    String? actionText,
    VoidCallback? onActionPressed,
    bool? showCloseButton,
    VoidCallback? onDismiss,
    Widget? customContent,
    bool? isLoading,
  }) {
    return BannerViewModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      actionText: actionText ?? this.actionText,
      onActionPressed: onActionPressed ?? this.onActionPressed,
      showCloseButton: showCloseButton ?? this.showCloseButton,
      onDismiss: onDismiss ?? this.onDismiss,
      customContent: customContent ?? this.customContent,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}