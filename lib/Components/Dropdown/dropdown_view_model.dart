import 'package:flutter/material.dart';

class DropdownItem<T> {
  final T value;
  final String label;
  final Widget? icon;

  DropdownItem({
    required this.value,
    required this.label,
    this.icon,
  });
}

class DropdownViewModel<T> {
  final List<DropdownItem<T>> items;
  final T? selectedValue;
  final String placeholder;
  final bool isEnabled;
  final Widget? prefixIcon;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final String? errorText;
  final bool isLoading;

  DropdownViewModel({
    required this.items,
    this.selectedValue,
    required this.placeholder,
    this.isEnabled = true,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.errorText,
    this.isLoading = false,
  });

  DropdownViewModel<T> copyWith({
    List<DropdownItem<T>>? items,
    T? selectedValue,
    String? placeholder,
    bool? isEnabled,
    Widget? prefixIcon,
    String? Function(T?)? validator,
    void Function(T?)? onChanged,
    String? errorText,
    bool? isLoading,
  }) {
    return DropdownViewModel<T>(
      items: items ?? this.items,
      selectedValue: selectedValue ?? this.selectedValue,
      placeholder: placeholder ?? this.placeholder,
      isEnabled: isEnabled ?? this.isEnabled,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      validator: validator ?? this.validator,
      onChanged: onChanged ?? this.onChanged,
      errorText: errorText ?? this.errorText,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}