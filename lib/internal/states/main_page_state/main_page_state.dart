// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/banners_state/banners_state.dart';
import 'package:treearth/internal/states/interfaces/initializable.dart';

part 'main_page_state.g.dart';

class MainPageState = _MainPageStateBase with _$MainPageState;

abstract class _MainPageStateBase with Store implements Initializable {
  @override
  Future<void> initialize() async {
    Future.wait([
      service<BannersState>().initialize(),
    ]);
  }
}
