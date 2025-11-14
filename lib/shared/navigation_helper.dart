import 'package:flutter/material.dart';

/// Helper para navegação que centraliza a lógica de navegação
/// e facilita a reutilização em diferentes partes da aplicação
class NavigationHelper {
  /// Navega para uma nova tela com animação padrão
  static Future<T?> navigateTo<T>(BuildContext context, Widget destination) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  /// Navega para uma nova tela substituindo a atual
  static Future<T?> navigateAndReplace<T>(BuildContext context, Widget destination) {
    return Navigator.pushReplacement<T, void>(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  /// Navega para uma nova tela removendo todas as anteriores
  static Future<T?> navigateAndClearStack<T>(BuildContext context, Widget destination) {
    return Navigator.pushAndRemoveUntil<T>(
      context,
      MaterialPageRoute(builder: (context) => destination),
      (route) => false,
    );
  }

  /// Volta para a tela anterior
  static void goBack(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }

  /// Verifica se é possível voltar
  static bool canGoBack(BuildContext context) {
    return Navigator.canPop(context);
  }
}