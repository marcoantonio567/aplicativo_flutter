import 'package:flutter/material.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../factory/login_factory.dart';
import '../../shared/theme.dart';

/// View raiz da aplicação (MaterialApp).
/// Mantém apenas responsabilidades de UI e tema.
class AppView extends StatelessWidget {
  final AppCoordinator coordinator;
  const AppView({super.key, required this.coordinator});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Sample',
      navigatorKey: coordinator.navigatorKey,
      theme: AppTheme.lightTheme,
      home: LoginFactory.make(coordinator: coordinator),
    );
  }
}