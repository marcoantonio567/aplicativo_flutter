import 'package:flutter/material.dart';

class CustomAppBarViewModel {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomAppBarViewModel({
    required this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
  });
}
