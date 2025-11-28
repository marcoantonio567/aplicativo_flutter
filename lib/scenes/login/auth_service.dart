import '../../model/auth/credentials.dart';
import '../../model/auth/login_result.dart';

class AuthService {
  Future<Map<String, dynamic>> fetchLogin({required String user, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));
    return {
      "name": "Marcio Ferreira",
      "address": "Rua Teotonio Segurado, 1234 - Plano diretor Sul",
    };
  }

  Future<LoginResult> login(Credentials credentials) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (credentials.username.isNotEmpty && credentials.password.isNotEmpty) {
      return const LoginResult(success: true);
    }
    return const LoginResult(success: false, message: 'Credenciais inválidas');
  }
}
