import 'dart:async';
import 'package:data/lib.dart';
import 'package:domain/lib.dart';

abstract class IAuthRepository {
  Future<LoginResponse> login(LoginRequest request);
}

class AuthRepository implements IAuthRepository {
  AuthRepository({required AuthProvider authProvider})
    : _authProvider = authProvider;

  final AuthProvider _authProvider;

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _authProvider.login(request.toJson());

      if (response == null) {
        throw Exception('Login response is null');
      }

      return LoginResponse.fromJson(response);
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }
}
