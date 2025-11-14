import 'package:flutter/material.dart';
import 'scenes/view/app_view.dart';
import 'utils/navigation/app_coordinator.dart';

/// Ponto de entrada da aplicação.
/// Responsável apenas por inicializar o `AppCoordinator` e executar a `AppView`.
void main() {
  final coordinator = AppCoordinator();
  runApp(AppView(coordinator: coordinator));
}
