// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/main_page_state/main_page_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/did_you_know/did_you_know.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      // Инициализация стейта главной страницы (баннеры и т.д).
      service<MainPageState>().initialize();

      // Переход на главную страницу или onboarding через 2 секунды.
      Future.delayed(aSecond * 2, () => goToMainPage(context));
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
