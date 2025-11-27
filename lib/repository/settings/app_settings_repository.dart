import '../../scenes/services/settings/app_settings_service.dart';

class AppSettingsRepository {
  final AppSettingsService service;
  AppSettingsRepository({required this.service});

  Future<bool> isDarkMode() => service.getDarkMode();
  Future<void> setDarkMode(bool value) => service.setDarkMode(value);
}
