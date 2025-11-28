import 'package:flutter/foundation.dart';
import 'auth_service.dart';
import '../../utils/navigation/app_coordinator.dart';

class LoginViewModel {
  final AuthService service;
  final AppCoordinator coordinator;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);

  LoginViewModel({required this.service, required this.coordinator});

  AppCoordinator get appCoordinator => coordinator;

  Future<void> performLogin(
    String user,
    String password, {
    required void Function(String name, String address) onSuccess,
  }) async {
    isLoading.value = true;
    errorMessage.value = null;
    final response = await service.fetchLogin(user: user, password: password);
    final name = response["name"] as String? ?? "";
    final address = response["address"] as String? ?? "";
    isLoading.value = false;
    onSuccess(name, address);
  }

  void presentHome(String name, String address) {
    coordinator.goToHome(name: name, address: address);
  }

  void dispose() {
    isLoading.dispose();
    errorMessage.dispose();
  }
}
