import 'package:flutter/material.dart';
import '../../scenes/factory/home_factory.dart';

/// Coordenador de navegação.
/// Mantém referência ao `Navigator` e centraliza navegação entre telas.
class AppCoordinator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void goToHome({required String name, required String address}) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeFactory.make(coordinator: this),
        ),
      );
    }
  }
}