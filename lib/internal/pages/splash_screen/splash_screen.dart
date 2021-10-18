import 'package:flutter/material.dart';
import 'package:treearth/presentation/pages/splash_screen/splash_screen_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView();
  }
}
