// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/data/repository/auth/auth_repository.dart';
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';

part 'auth_state.g.dart';

class AuthState = _AuthStateBase with _$AuthState;

abstract class _AuthStateBase with Store {
  Settings get settings => service<Settings>();
  AuthRepository get authRepository => service<AuthRepository>();

  /// Авторизация с помощью google sign in provider.
  @action
  Future<bool> signInWithGoogle() async {
    // Получаем ID пользователя через репозиторий.
    final userId = await authRepository.signInWithGoogle();
    if (userId == null) return false;

    final accessToken = generateAccessToken({'userId': userId});

    return await authorize(accessToken: accessToken);
  }

  // Авторизация с помощью номера телефона.
  @action
  Future<bool> signInWithPhoneNumber() async {
    // Получение номера телефона пользователя и подтверждение его на pin-странице.

    return await authorize();
  }

  /// Получение информации от бэкэнда по пользовательскому ID,
  /// который передается как access token в payload.
  @action
  Future<bool> authorize({String? accessToken}) async {
    // Берем токен из локального хранилища если он не был передан как аргумент (или равен null).
    accessToken ??= settings.accessToken;
    // Первая проверка. Если нет токена, то пользователь точно не авторизован.
    if (accessToken.isEmpty) return false;

    // Получение пользователя по access токену.

    // Если пользователь авторизован через firebase, но у него не получается
    // получить информацию от бэкэнда, то его нужно разлогинить.
    if (accessToken.isNotEmpty) return true;
    // ----------------------------------------

    // Стандартно - пользователь не авторизован.
    return false;
  }

  /// Генерация access токена с подписью сервера авторизации и payload.
  String generateAccessToken(Map<String, dynamic> payload) {
    // TODO: сделать адекватную генерацию токена.
    return payload.toString();
  }
}
