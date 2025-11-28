import 'package:flutter/widgets.dart';
import '../../utils/navigation/app_coordinator.dart';
import 'auth_service.dart';
import 'login_view_model.dart';
import 'login_view.dart';

class LoginFactory {
  static Widget make({required AppCoordinator coordinator}) {
    final service = AuthService();
    final viewModel = LoginViewModel(service: service, coordinator: coordinator);
    return LoginView(viewModel: viewModel);
  }
}
