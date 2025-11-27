import 'package:flutter/material.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../view_model/app/app_view_model.dart';
import '../factory/login_factory.dart';
import '../../shared/theme.dart';

/// View raiz da aplicação (MaterialApp).
/// Mantém apenas responsabilidades de UI e tema.
class AppView extends StatelessWidget {
  final AppCoordinator coordinator;
  final AppViewModel viewModel;
  const AppView({super.key, required this.coordinator, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: viewModel.themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'MVVM Sample',
          navigatorKey: coordinator.navigatorKey,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: LoginFactory.make(coordinator: coordinator),
        );
      },
    );
  }
}
