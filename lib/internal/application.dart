// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/pages/authorization_page/authorization_page.dart';
import 'package:treearth/internal/pages/authorization_splash/authorization_splash.dart';
import 'package:treearth/internal/pages/confirm_number_page/confirm_number_page.dart';
import 'package:treearth/internal/pages/notifications_page/notifications_page.dart';
import 'package:treearth/internal/pages/phone_number_page/phone_number_page.dart';
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
        fontFamily: 'Raleway',
        scaffoldBackgroundColor: whiteColor,
        textTheme: TextTheme(
          headline3: TextStyle(color: blackColor, fontSize: 24.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: blackColor, fontSize: 18.0, fontWeight: FontWeight.w500),
          bodyText2: TextStyle(color: blackColor, fontSize: 12.0, fontWeight: FontWeight.w500),
          button: TextStyle(color: blackColor, fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: (routeSettings) {
        Route? route;
        switch (routeSettings.name) {
          case SplashScreen.routeName:
            route = MaterialPageRoute(builder: (context) => const SplashScreen());
            break;
          case AuthorizationSplash.routeName:
            route = MaterialPageRoute(builder: (context) => const AuthorizationSplash());
            break;
          case AuthorizationPage.routeName:
            route = MaterialPageRoute(builder: (context) => const AuthorizationPage());
            break;
          case Workspace.routeName:
            route = MaterialPageRoute(builder: (context) => const Workspace());
            break;
          case NotificationsPage.routeName:
            route = MaterialPageRoute(builder: (context) => const NotificationsPage());
            break;
          case PhoneNumberPage.routeName:
            route = MaterialPageRoute(builder: (context) => const PhoneNumberPage());
            break;
          case ConfirmNumberPage.routeName:
            route = MaterialPageRoute(builder: (context) => const ConfirmNumberPage());
        }
        return route;
      },
    );
  }
}
