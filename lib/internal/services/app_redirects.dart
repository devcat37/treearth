// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:phone_number/phone_number.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/pages/authorization_page/authorization_page.dart';
import 'package:treearth/internal/pages/authorization_splash/authorization_splash.dart';
import 'package:treearth/internal/pages/confirm_number_page/confirm_number_page.dart';
import 'package:treearth/internal/pages/notifications_page/notifications_page.dart';
import 'package:treearth/internal/pages/phone_number_page/phone_number_page.dart';
import 'package:treearth/internal/pages/plant_page/plant_page.dart';
import 'package:treearth/internal/pages/trash_page/trash_page.dart';
import 'package:treearth/internal/pages/workspace/workspace.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/confirm_number_state/confirm_number_state.dart';

bool canPop(BuildContext context) => Navigator.of(context).canPop();

void pop(BuildContext context, [dynamic value]) => Navigator.of(context).pop(value);

void goToAuthorizationSplashPage(BuildContext context) =>
    Navigator.of(context).pushReplacementNamed(AuthorizationSplash.routeName);

void goToAuthorizationPage(BuildContext context) => Navigator.of(context).pushNamed(AuthorizationPage.routeName);

Future<T?> goToPhoneNumberPage<T>(BuildContext context, {Function(PhoneNumber)? onSuccessfulConfirmation}) async =>
    await Navigator.of(context).pushNamed(PhoneNumberPage.routeName, arguments: onSuccessfulConfirmation);

Future<bool?> goToConfirmNumberPage<bool>(BuildContext context, PhoneNumber phone) async {
  service.registerLazySingleton(() => ConfirmNumberState(phone: phone));
  return await Navigator.of(context).pushNamed(ConfirmNumberPage.routeName);
}

Future<void> goToMainPage(BuildContext context) async =>
    await Navigator.of(context).pushReplacementNamed(Workspace.routeName);

void goToNotificationsPage(BuildContext context) => Navigator.of(context).pushNamed(NotificationsPage.routeName);

void goToPlantingPage(BuildContext context, PlantSpot plant) =>
    Navigator.of(context).pushNamed(PlantPage.routeName, arguments: plant);

void goToTrashPage(BuildContext context, TrashSpot trash) =>
    Navigator.of(context).pushNamed(TrashPage.routeName, arguments: trash);
