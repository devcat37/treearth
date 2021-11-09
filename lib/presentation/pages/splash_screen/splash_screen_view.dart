// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/auth_state/auth_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/did_you_know/did_you_know.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  AuthState get authorization => service<AuthState>();

  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      // Авторизация пользователя, если он уже был авторизован на устройстве.
      // Результат возвращает успешность авторизации.
      final isAuthorized = await authorization.authorize();
      log('[AUTH]: Состояние авторизации пользователя: $isAuthorized');

      // Переход на главную страницу или авторизацию в зависимости от состояния.
      // TODO: Убрать задержку на переход на главную страницу.
      if (isAuthorized)
        Future.delayed(aSecond * 2, () => goToMainPage(context));
      else
        Future.delayed(aSecond * 2, () => goToAuthorizationSplashPage(context));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: DidYouKnow.heroTag,
          child: DidYouKnow(),
        ),
      ),
    );
  }
}
