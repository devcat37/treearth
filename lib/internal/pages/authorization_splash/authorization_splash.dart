// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/pages/authorization_splash/authorization_splash_view.dart';

class AuthorizationSplash extends StatelessWidget {
  const AuthorizationSplash({Key? key}) : super(key: key);

  static const routeName = '/authorization-splash';

  @override
  Widget build(BuildContext context) {
    return const AuthorizationSplashView();
  }
}
