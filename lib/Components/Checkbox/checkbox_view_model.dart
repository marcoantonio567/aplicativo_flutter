import 'package:flutter/material.dart';

enum CheckboxStyle {
  primary,
  secondary,
  success,
  error,
}

class CheckboxViewModel {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final bool enabled;
  final CheckboxStyle style;

  CheckboxViewModel({
    required this.value,
    this.onChanged,
    this.label,
    this.enabled = true,
    this.style = CheckboxStyle.primary,
  });

  CheckboxViewModel copyWith({
    bool? value,
    ValueChanged<bool?>? onChanged,
    String? label,
    bool? enabled,
    CheckboxStyle? style,
  }) {
    return CheckboxViewModel(
      value: value ?? this.value,
      onChanged: onChanged ?? this.onChanged,
      label: label ?? this.label,
      enabled: enabled ?? this.enabled,
      style: style ?? this.style,
    );
  }
}