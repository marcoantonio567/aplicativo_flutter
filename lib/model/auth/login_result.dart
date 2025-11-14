/// Modelo de resultado de operações de login.
class LoginResult {
  final bool success;
  final String? message;
  const LoginResult({required this.success, this.message});
}