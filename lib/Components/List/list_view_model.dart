import 'package:flutter/material.dart';

class ListItemViewModel {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final Color? iconColor;

  ListItemViewModel({
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon = Icons.arrow_forward_ios,
    this.onTap,
    this.iconColor,
  });

  ListItemViewModel copyWith({
    String? title,
    String? subtitle,
    IconData? leadingIcon,
    IconData? trailingIcon,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return ListItemViewModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      onTap: onTap ?? this.onTap,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}

class ListViewModel {
  final List<ListItemViewModel> items;
  final EdgeInsets? padding;
  final bool showDividers;

  ListViewModel({
    required this.items,
    this.padding,
    this.showDividers = true,
  });

  ListViewModel copyWith({
    List<ListItemViewModel>? items,
    EdgeInsets? padding,
    bool? showDividers,
  }) {
    return ListViewModel(
      items: items ?? this.items,
      padding: padding ?? this.padding,
      showDividers: showDividers ?? this.showDividers,
    );
  }
}