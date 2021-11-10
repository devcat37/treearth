// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/data/models/auth_result_data.dart';
import 'package:treearth/data/repository/auth/auth_repository.dart';
import 'package:treearth/domain/repository/load_result.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';
import 'package:treearth/internal/states/user_state/user_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';

part 'auth_state.g.dart';

class AuthState = _AuthStateBase with _$AuthState;

abstract class _AuthStateBase with Store {
  Settings get settings => service<Settings>();
  AuthRepository get authRepository => service<AuthRepository>();
  UserState get userState => service<UserState>();

  /// Авторизация с помощью google sign in provider.
  @action
  Future<bool> signInWithGoogle() async {
    // Получаем ID пользователя через репозиторий.
    final user = await authRepository.signInWithGoogle();
    if (user == null) return false;

    return await authorize(userId: user.uid);
  }

  // Авторизация с помощью номера телефона.
  @action
  Future<bool> signInWithPhoneNumber() async {
    // Получение номера телефона пользователя и подтверждение его на pin-странице.
    final user = await authRepository.signInWithPhoneNumber();
    if (user == null) return false;

    return await authorize(userId: user.uid);
  }

  /// Получение информации от бэкэнда по пользовательскому ID,
  /// который передается как access token в payload.
  @action
  Future<bool> authorize({String? userId, bool? isNew = false}) async {
    // Берем токен из локального хранилища если он не был передан как аргумент (или равен null).
    userId ??= settings.userId;
    // Первая проверка. Если нет токена, то пользователь точно не авторизован.
    if (userId.isEmpty) return false;

    // Получение пользователя по access токену.

    // Если пользователь авторизован через firebase, но у него не получается
    // получить информацию от бэкэнда, то его нужно разлогинить.
    // if (userId.isNotEmpty) return true;
    LoadResult<AuthResultData?> authResult;
    if (isNew == true)
      authResult = await authRepository.register(userId);
    else
      authResult = await authRepository.login(userId);

    if (authResult.isSuccessful && authResult.data != null) {
      settings.userId = userId;

      // Сохранение access и refresh токенов.
      settings.accessToken = authResult.data!.accessToken;
      settings.refreshToken = authResult.data!.refreshToken;

      // Сохранение пользователя в стейт.
      userState.user = authResult.data!.user;
      return true;
    }
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
