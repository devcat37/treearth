// Package imports:
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    contentType: 'application/json',
    headers: {
      'X-Powered-By': 'Express',
    },
  ));

  Future<Response> get({required String url, Map<String, dynamic>? params, Map<String, dynamic>? headers}) async =>
      await _dio.get(url, queryParameters: params, options: Options(headers: headers));

  Future<Response> post({required String url, dynamic data}) async {
    return await _dio.post(url, data: data);
  }
}
