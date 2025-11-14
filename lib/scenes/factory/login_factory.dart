import 'package:flutter/widgets.dart';
import '../../utils/navigation/app_coordinator.dart';
import '../services/auth/auth_service.dart';
import '../view_model/auth/login_view_model.dart';
import '../view/login_view.dart';

/// Factory de composição para a cena de Login.
/// Conecta Repository -> ViewModel -> View e injeta o coordinator.
class LoginFactory {
  static Widget make({required AppCoordinator coordinator}) {
    final service = AuthService();
    final viewModel = LoginViewModel(service: service, coordinator: coordinator);
    return LoginView(viewModel: viewModel);
  }
}