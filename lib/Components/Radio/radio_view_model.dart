import 'package:flutter/material.dart';

enum RadioStyle {
  primary,
  secondary,
  success,
  error,
}

class RadioViewModel<T> {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final bool enabled;
  final RadioStyle style;

  RadioViewModel({
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label,
    this.enabled = true,
    this.style = RadioStyle.primary,
  });

  RadioViewModel<T> copyWith({
    T? value,
    T? groupValue,
    ValueChanged<T?>? onChanged,
    String? label,
    bool? enabled,
    RadioStyle? style,
  }) {
    return RadioViewModel<T>(
      value: value ?? this.value,
      groupValue: groupValue ?? this.groupValue,
      onChanged: onChanged ?? this.onChanged,
      label: label ?? this.label,
      enabled: enabled ?? this.enabled,
      style: style ?? this.style,
    );
  }
}