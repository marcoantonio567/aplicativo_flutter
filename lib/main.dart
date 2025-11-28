import 'package:flutter/material.dart';
import 'scenes/app/app_view.dart';
import 'utils/navigation/app_coordinator.dart';
import 'repository/settings/app_settings_repository.dart';
import 'scenes/app/app_settings_service.dart';
import 'scenes/app/app_view_model.dart';

/// Ponto de entrada da aplicação.
/// Responsável apenas por inicializar o `AppCoordinator` e executar a `AppView`.
void main() {
  final coordinator = AppCoordinator();
  final settingsRepo = AppSettingsRepository(service: AppSettingsService());
  final appViewModel = AppViewModel(repository: settingsRepo);
  appViewModel.load();
  coordinator.appViewModel = appViewModel;
  runApp(AppView(coordinator: coordinator, viewModel: appViewModel));
}
