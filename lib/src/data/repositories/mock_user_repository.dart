import 'dart:async';
import '../../services/token_storage.dart';

class MockUserRepository {
  final TokenStorage _storage = TokenStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));
    // Accept any credentials for mock
    final token = 'mock_access_token_${DateTime.now().millisecondsSinceEpoch}';
    await _storage.saveRefreshToken(token);
    return {'id': 'user-1', 'email': email, 'name': 'Usuário Mock', 'token': token};
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final token = 'mock_access_token_${DateTime.now().millisecondsSinceEpoch}';
    await _storage.saveRefreshToken(token);
    return {'id': 'user-1', 'email': email, 'name': name, 'token': token};
  }

  Future<void> logout() async {
    await _storage.deleteRefreshToken();
  }
}
