import 'package:flutter/material.dart';

enum ActionButtonSize {
  small,
  medium,
  large,
}

enum ActionButtonStyle {
  primary,
  secondary,
  tertiary,
  clear,
}

class ActionButtonViewModel {
  final ActionButtonSize size;
  final ActionButtonStyle style;
  final String text;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function() onPressed;
  final bool isLoading;

  ActionButtonViewModel({
    required this.size,
    required this.style,
    required this.text,
    required this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.isLoading = false,
  });
}