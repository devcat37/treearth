// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/pages/authorization_page/authorization_page.dart';
import 'package:treearth/internal/pages/authorization_splash/authorization_splash.dart';
import 'package:treearth/internal/pages/notifications_page/notifications_page.dart';
import 'package:treearth/internal/pages/workspace/workspace.dart';

bool canPop(BuildContext context) => Navigator.of(context).canPop();

void pop(BuildContext context) => Navigator.of(context).pop();

void goToAuthorizationSplashPage(BuildContext context) =>
    Navigator.of(context).pushReplacementNamed(AuthorizationSplash.routeName);

void goToAuthorizationPage(BuildContext context) => Navigator.of(context).pushNamed(AuthorizationPage.routeName);

void goToMainPage(BuildContext context) => Navigator.of(context).pushReplacementNamed(Workspace.routeName);

void goToNotificationsPage(BuildContext context) => Navigator.of(context).pushNamed(NotificationsPage.routeName);
