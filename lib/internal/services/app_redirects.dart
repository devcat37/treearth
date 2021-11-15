// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:phone_number/phone_number.dart';

// Project imports:
import 'package:treearth/domain/models/banner/tree_banner.dart';
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/pages/authorization_page/authorization_page.dart';
import 'package:treearth/internal/pages/authorization_splash/authorization_splash.dart';
import 'package:treearth/internal/pages/banner_page/banner_page.dart';
import 'package:treearth/internal/pages/confirm_number_page/confirm_number_page.dart';
import 'package:treearth/internal/pages/create_spot_page/create_spot_page.dart';
import 'package:treearth/internal/pages/notifications_page/notifications_page.dart';
import 'package:treearth/internal/pages/onboarding_page/onboarding_page.dart';
import 'package:treearth/internal/pages/phone_number_page/phone_number_page.dart';
import 'package:treearth/internal/pages/plant_page/plant_page.dart';
import 'package:treearth/internal/pages/settings_page/settings_page.dart';
import 'package:treearth/internal/pages/trash_page/trash_page.dart';
import 'package:treearth/internal/pages/workspace/workspace.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/confirm_number_state/confirm_number_state.dart';
import 'package:treearth/internal/states/donation_state/donation_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/bottom_sheet_swiper/bottom_sheet_swiper.dart';
import 'package:treearth/presentation/pages/plant_page/plant_donation_page_view.dart';

bool canPop(BuildContext context) => Navigator.of(context).canPop();

void pop(BuildContext context, [dynamic value]) => Navigator.of(context).pop(value);

Future<T?> showPopup<T>(BuildContext context, {required Widget child, double heightFactor = 0.9}) =>
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: radiusCircular32, topRight: radiusCircular32),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: heightFactor,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: radiusCircular32, topRight: radiusCircular32),
          child: Stack(
            children: [
              child,
              const Positioned(
                top: sidePadding,
                left: 0,
                right: 0,
                child: Center(
                  child: BottomSheetSwiper(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

void goToAuthorizationSplashPage(BuildContext context) =>
    Navigator.of(context).pushReplacementNamed(AuthorizationSplash.routeName);

Future<void> goToAuthorizationPage(BuildContext context) =>
    Navigator.of(context).pushNamedAndRemoveUntil(AuthorizationPage.routeName, (_) => false);

Future<T?> goToPhoneNumberPage<T>(BuildContext context, {Function(PhoneNumber)? onSuccessfulConfirmation}) async =>
    await Navigator.of(context).pushNamed(PhoneNumberPage.routeName, arguments: onSuccessfulConfirmation);

Future<bool?> goToConfirmNumberPage<bool>(BuildContext context, PhoneNumber phone) async {
  service.registerLazySingleton(() => ConfirmNumberState(phone: phone));
  return await Navigator.of(context).pushNamed(ConfirmNumberPage.routeName);
}

void goToBannerPage(BuildContext context, TreeBanner banner) =>
    Navigator.of(context).pushNamed(BannerPage.routeName, arguments: banner);

void goToOnboardingPage(BuildContext context) => Navigator.of(context).pushReplacementNamed(OnboardingPage.routeName);

Future<void> goToMainPage(BuildContext context) async =>
    await Navigator.of(context).pushNamedAndRemoveUntil(Workspace.routeName, (_) => false);

Future<void> goToDonationPage(BuildContext context, PlantSpot plant) async {
  final state = DonationState();

  service.registerSingleton<DonationState>(state);
  await showPopup(context, heightFactor: 0.7, child: PlantDonationPage(plant: plant));

  service.unregister(instance: state);
}

void goToNotificationsPage(BuildContext context) => Navigator.of(context).pushNamed(NotificationsPage.routeName);

void goToPlantingPage(BuildContext context, PlantSpot plant) =>
    Navigator.of(context).pushNamed(PlantPage.routeName, arguments: plant);

void goToTrashPage(BuildContext context, TrashSpot trash) =>
    Navigator.of(context).pushNamed(TrashPage.routeName, arguments: trash);

void goToSettingsPage(BuildContext context) => Navigator.of(context).pushNamed(SettingsPage.routeName);

void goToCreateSpotPage(BuildContext context) => Navigator.of(context).pushNamed(CreateSpotPage.routeName);
