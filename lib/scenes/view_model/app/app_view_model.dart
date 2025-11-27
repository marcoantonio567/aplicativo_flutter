import 'package:flutter/material.dart';
import '../../../repository/settings/app_settings_repository.dart';

class AppViewModel {
  final AppSettingsRepository repository;
  final ValueNotifier<ThemeMode> themeMode = ValueNotifier<ThemeMode>(ThemeMode.light);

  AppViewModel({required this.repository});

  Future<void> load() async {
    final dark = await repository.isDarkMode();
    themeMode.value = dark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleDark(bool value) async {
    themeMode.value = value ? ThemeMode.dark : ThemeMode.light;
    await repository.setDarkMode(value);
  }

  void dispose() {
    themeMode.dispose();
  }
}
