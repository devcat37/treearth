// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/pages/splash_screen/splash_screen.dart';
import 'package:treearth/internal/pages/workspace/workspace.dart';
import 'package:treearth/internal/services/settings.dart';
import 'package:treearth/internal/utils/infrastructure.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Settings.appName,
      theme: ThemeData(
        textTheme: TextTheme(
          headline3: TextStyle(color: blackColor, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      // initialRoute: SplashScreen.routeName,
      onGenerateRoute: (routeSettings) {
        Route? route;
        switch (routeSettings.name) {
          case SplashScreen.routeName:
            route = MaterialPageRoute(builder: (context) => const SplashScreen());
            break;
        }
        return route;
      },
      home: Workspace(),
    );
  }
}
