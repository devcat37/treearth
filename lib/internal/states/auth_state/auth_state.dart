// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';

part 'auth_state.g.dart';

class AuthState = _AuthStateBase with _$AuthState;

abstract class _AuthStateBase with Store {
  Settings get settings => service<Settings>();

  @action
  Future<bool> authorize() async {
    // Берем токен из локального хранилища.
    final accessToken = settings.accessToken;
    // Первая проверка. Если нет токена, то пользователь точно не авторизован.
    if (accessToken.isEmpty) return false;

    // Стандартно - пользователь не авторизован.
    return false;
  }
}
