// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:treearth/data/repository/auth/auth_repository.dart';
import 'package:treearth/data/repository/banners/banners_repository.dart';
import 'package:treearth/data/repository/notifications/notifications_repository.dart';
import 'package:treearth/internal/application.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';
import 'package:treearth/internal/states/auth_state/auth_state.dart';
import 'package:treearth/internal/states/banners_state/banners_state.dart';
import 'package:treearth/internal/states/main_page_state/main_page_state.dart';
import 'package:treearth/internal/states/notifications_state/notifications_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  Settings settings = Settings();
  await settings.initStorage();
  await settings.initFirebase();
  service.registerSingleton<Settings>(settings);

  // Repositories.
  service.registerLazySingleton<AuthRepository>(() => AuthRepository());
  service.registerLazySingleton<BannersRepository>(() => BannersRepository());
  service.registerLazySingleton<NotificationsRepository>(() => NotificationsRepository());

  // States.
  service.registerLazySingleton<AuthState>(() => AuthState());
  service.registerLazySingleton<BannersState>(() => BannersState());
  service.registerLazySingleton<NotificationsState>(() => NotificationsState());
  service.registerLazySingleton<MainPageState>(() => MainPageState());

  runApp(const Application());
}
