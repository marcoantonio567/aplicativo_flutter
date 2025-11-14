import '../../model/auth/credentials.dart';
import '../../model/auth/login_result.dart';
import '../../scenes/services/auth/auth_service.dart';

/// Repositório responsável por consolidar acesso a dados de Login.
/// Aqui poderíamos integrar API remota, cache local, etc.
class LoginRepository {
  final AuthService service;

  LoginRepository({required this.service});

  Future<LoginResult> login(Credentials credentials) async {
    return service.login(credentials);
  }
}