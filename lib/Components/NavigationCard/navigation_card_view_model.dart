import 'package:flutter/material.dart';

class NavigationCardViewModel {
  final String title;
  final String description;
  final IconData icon;
  final Widget destination;
  final VoidCallback? onTap;
  final bool isLoading;

  NavigationCardViewModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.destination,
    this.onTap,
    this.isLoading = false,
  });

  NavigationCardViewModel copyWith({
    String? title,
    String? description,
    IconData? icon,
    Widget? destination,
    VoidCallback? onTap,
    bool? isLoading,
  }) {
    return NavigationCardViewModel(
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      destination: destination ?? this.destination,
      onTap: onTap ?? this.onTap,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}