import 'package:flutter/material.dart';

class InputTextViewModel {
  final TextEditingController controller;
  final String placeholder;
  bool password;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final VoidCallback? togglePasswordVisibility;
  final bool isLoading;

  InputTextViewModel({
    required this.controller,
    required this.placeholder,
    required this.password,
    this.suffixIcon,
    this.prefixIcon,
    this.isEnabled = true,
    this.validator,
    this.togglePasswordVisibility,
    this.isLoading = false,
  });
}
