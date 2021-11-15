// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/data/models/auth_result_data.dart';
import 'package:treearth/data/repository/auth/auth_repository.dart';
import 'package:treearth/domain/repository/load_result.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';
import 'package:treearth/internal/states/user_state/user_state.dart';

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
    final userCredential = await authRepository.signInWithGoogle();
    if (userCredential?.user == null) return false;

    return await authorize(userId: userCredential!.user!.uid, isNew: userCredential.additionalUserInfo?.isNewUser);
  }

  // Авторизация с помощью номера телефона.
  @action
  Future<bool> signInWithPhoneNumber() async {
    // Получение номера телефона пользователя и подтверждение его на pin-странице.
    final userCredential = await authRepository.signInWithPhoneNumber();
    if (userCredential?.user == null) return false;

    return await authorize(userId: userCredential!.user!.uid, isNew: userCredential.additionalUserInfo?.isNewUser);
  }

  /// Получение информации от бэкэнда по пользовательскому ID,
  /// который передается как access token в payload.
  @action
  Future<bool> authorize({String? userId, bool? isNew = false}) async {
    // Берем токен из локального хранилища если он не был передан как аргумент (или равен null).
    userId ??= settings.userId;
    // Если это не быстрая авторизация, то нужно создать временный access токен, чтобы сервер понял, что запрос защищенный.
    if (settings.accessToken.isEmpty) settings.accessToken = generateAccessToken(userId);
    // Первая проверка. Если нет токена, то пользователь точно не авторизован.
    if (userId.isEmpty) return false;

    // Получение пользователя по access токену.

    // Если пользователь авторизован через firebase, но у него не получается
    // получить информацию от бэкэнда, то его нужно разлогинить.
    LoadResult<AuthResultData?> authResult;
    if (isNew == true)
      authResult = await authRepository.register(userId);
    else
      authResult = await authRepository.login(userId);

    if (authResult.data == null) return false;

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

  Future<void> logout() async {
    settings.accessToken = '';
    settings.refreshToken = '';
    settings.userId = '';

    userState.user = null;
    authRepository.logout();
  }

  /// Создание access токена для авторизации.
  String generateAccessToken(String userId) {
    final token = JWT({'userId': userId}).sign(SecretKey(Settings.JWT_ACCESS_SECRET));
    return token;
  }
}
