import 'package:dio/dio.dart';
import 'api_constants.dart';

class DioService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

  void setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  void removeToken() {
    dio.options.headers.remove("Authorization");
  }
}

final dioService = DioService();