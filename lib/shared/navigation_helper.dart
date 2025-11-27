import 'package:flutter/material.dart';
import '../Components/Loading/loading_overlay.dart';

/// Helper para navegação que centraliza a lógica de navegação
/// e facilita a reutilização em diferentes partes da aplicação
class NavigationHelper {
  static OverlayEntry? _loadingOverlayEntry;
  static const Duration _defaultTransitionDuration = Duration(
    milliseconds: 250,
  );

  /// Navega para uma nova tela com animação padrão
  static Future<T?> navigateTo<T>(BuildContext context, Widget destination) {
    _showLoadingOverlay(context);
    final route = _transitionRoute<T>(destination);
    try {
      return Navigator.push<T>(context, route);
    } finally {
      Future.delayed(
        _defaultTransitionDuration + const Duration(milliseconds: 60),
        _hideLoadingOverlay,
      );
    }
  }

  /// Navega para uma nova tela substituindo a atual
  static Future<T?> navigateAndReplace<T>(
    BuildContext context,
    Widget destination,
  ) {
    _showLoadingOverlay(context);
    final route = _transitionRoute<T>(destination);
    try {
      return Navigator.pushReplacement<T, void>(context, route);
    } finally {
      Future.delayed(
        _defaultTransitionDuration + const Duration(milliseconds: 60),
        _hideLoadingOverlay,
      );
    }
  }

  /// Navega para uma nova tela removendo todas as anteriores
  static Future<T?> navigateAndClearStack<T>(
    BuildContext context,
    Widget destination,
  ) {
    _showLoadingOverlay(context);
    final route = _transitionRoute<T>(destination);
    try {
      return Navigator.pushAndRemoveUntil<T>(context, route, (route) => false);
    } finally {
      Future.delayed(
        _defaultTransitionDuration + const Duration(milliseconds: 60),
        _hideLoadingOverlay,
      );
    }
  }

  /// Volta para a tela anterior
  static void goBack(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }

  /// Verifica se é possível voltar
  static bool canGoBack(BuildContext context) {
    return Navigator.canPop(context);
  }

  static Route<T> _transitionRoute<T>(Widget destination) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );
        final fade = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
        final slide = Tween<Offset>(
          begin: const Offset(0, 0.02),
          end: Offset.zero,
        ).animate(curved);
        return FadeTransition(
          opacity: fade,
          child: SlideTransition(position: slide, child: child),
        );
      },
      transitionDuration: _defaultTransitionDuration,
      reverseTransitionDuration: const Duration(milliseconds: 200),
    );
  }

  static void _showLoadingOverlay(BuildContext context) {
    if (_loadingOverlayEntry != null) return;
    final overlay = Navigator.of(context).overlay;
    if (overlay == null) return;
    _loadingOverlayEntry = OverlayEntry(
      builder: (context) => LoadingOverlay.instantiate(),
    );
    overlay.insert(_loadingOverlayEntry!);
  }

  static void _hideLoadingOverlay() {
    _loadingOverlayEntry?.remove();
    _loadingOverlayEntry = null;
  }
}
