import 'package:flutter/material.dart';
import 'package:treearth/internal/pages/splash_screen/splash_screen.dart';
import 'package:treearth/internal/services/settings.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Settings.appName,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: (routeSettings) {
        Route? route;
        switch (routeSettings.name) {
          case SplashScreen.routeName:
            route = MaterialPageRoute(builder: (context) => const SplashScreen());
            break;
        }

        return route;
      },
    );
  }
}
