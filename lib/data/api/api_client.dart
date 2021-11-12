// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:treearth/data/models/auth_result_data.dart';
import 'package:treearth/data/repository/auth/auth_repository.dart';
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    contentType: 'application/json',
    headers: {
      'X-Powered-By': 'Express',
    },
  ));

  Future<Dio> _getApiClient() async {
    _dio.interceptors.clear();
    _dio.interceptors.add(
      InterceptorsWrapper(
        // Передаем авторизационный токен каждый раз, если он есть.
        onRequest: (request, handler) async {
          final accessToken = service<Settings>().accessToken;
          final refreshToken = service<Settings>().refreshToken;

          if (accessToken.isNotEmpty && hasTokenExpired(accessToken)) {
            // Останавливаем временно возможность делать запросы.
            _dio.interceptors.requestLock.lock();

            final refreshTokenResult = await http.post(
              Uri.parse(AuthRepository.REFRESH_ENDPOINT),
              headers: {
                'Content-Type': 'application/json',
                'X-Powered-By': 'Express',
              },
              body: jsonEncode({
                Settings.refreshTokenKey: refreshToken,
              }),
            );

            if (refreshTokenResult.statusCode == 200) {
              final data = AuthResultData.fromJson(jsonDecode(refreshTokenResult.body)['data']);

              service<Settings>().accessToken = data.accessToken;
              service<Settings>().refreshToken = data.refreshToken;
            } else {
              // Выйти из аккаунта.
            }

            // Снимаем ограничение.
            _dio.interceptors.requestLock.unlock();
          }

          request.headers['Authorization'] = 'Bearer ${service<Settings>().accessToken}';
          return handler.next(request);
        },
      ),
    );

    return _dio;
  }

  Future<Response> get({required String url, Map<String, dynamic>? params, Map<String, dynamic>? headers}) async =>
      await _getApiClient().then(
        (dio) => dio.get(url, queryParameters: params, options: Options(headers: headers)),
      );

  Future<Response> post({required String url, dynamic data}) async => await _getApiClient().then(
        (dio) => dio.post(url, data: data),
      );
}
