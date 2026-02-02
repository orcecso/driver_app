import 'package:dio/dio.dart';

class AuthProvider {
  AuthProvider(this.dio);
  final Dio dio;

  Future<Map<String, dynamic>?> login(Map<String, dynamic> body) async {
    final response = await dio.post('/auth/login', data: body); // sample lang
    return response.data;
  }
}
