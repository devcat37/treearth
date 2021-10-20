// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:treearth/data/repository/banners/banners_repository.dart';
import 'package:treearth/internal/application.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/banners_state/banners_state.dart';
import 'package:treearth/internal/states/main_page_state/main_page_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  // Repositories.
  service.registerLazySingleton<BannersRepository>(() => BannersRepository());

  // States.
  service.registerLazySingleton<BannersState>(() => BannersState());
  service.registerLazySingleton<MainPageState>(() => MainPageState());

  runApp(const Application());
}
