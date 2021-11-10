// Package imports:
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    contentType: 'application/json',
    headers: {
      'X-Powered-By': 'Express',
    },
  ));

  Future<Response> get({required String url}) async => await _dio.get(url);

  Future<Response> post({required String url, dynamic data}) async {
    return await _dio.post(url, data: data);
  }
}
