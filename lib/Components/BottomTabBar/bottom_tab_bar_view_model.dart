import 'package:flutter/material.dart';

class BottomTabBarViewModel {
  final Function(int)? onIndexChanged;
  final List<BottomNavigationBarItem> bottomTabs;
  final bool isLoading;

  BottomTabBarViewModel({
    required this.bottomTabs, 
    this.onIndexChanged,
    this.isLoading = false,
  });
}