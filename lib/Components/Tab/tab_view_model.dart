import 'package:flutter/material.dart';

class TabViewModel {
  final List<Tab> tabs;
  final Function(int)? onIndexChanged;
  final int initialIndex;
  final bool isLoading;

  TabViewModel({
    required this.initialIndex,
    required this.tabs, 
    this.onIndexChanged,
    this.isLoading = false});
}
