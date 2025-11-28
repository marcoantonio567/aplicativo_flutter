import 'package:flutter/material.dart';
import '../../utils/navigation/app_coordinator.dart';
import 'app_view_model.dart';
import '../login/login_factory.dart';
import '../../shared/theme.dart';

class AppView extends StatelessWidget {
  final AppCoordinator coordinator;
  final AppViewModel viewModel;
  const AppView({
    super.key,
    required this.coordinator,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: viewModel.themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Projeto App',
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
