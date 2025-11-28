import '../../Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  BottomTabBarViewModel buildBottomBar() {
    return BottomTabBarViewModel(
      bottomTabs: const [
        BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notas'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),
      ],
      onIndexChanged: (i) => currentIndex.value = i,
    );
  }

  void dispose() {
    currentIndex.dispose();
  }
}
