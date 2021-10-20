// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/data/repository/banners/banners_repository.dart';
import 'package:treearth/domain/models/banner/tree_banner.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/interfaces/initializable.dart';
import 'package:treearth/internal/states/interfaces/network_state.dart';

part 'banners_state.g.dart';

class BannersState = _BannersStateBase with _$BannersState;

abstract class _BannersStateBase extends NetworkState with Store implements Initializable {
  /// Репозиторий баннеров.
  BannersRepository get repository => service<BannersRepository>();

  /// Баннеры для главной страницы.
  @observable
  ObservableList<TreeBanner> banners = ObservableList();

  /// Загрузка баннеров с бэкэнда.
  @action
  Future<void> _loadBanners() async {
    isLoading = true;

    /// Запрос на бэкэнд через репозиторий на получение баннеров.
    final apiResult = await repository.fetchBanners();
    if (apiResult.isSuccessful) banners = ObservableList.of(apiResult.data ?? []);

    isLoading = false;
  }

  @override
  Future<void> initialize() async {
    await _loadBanners();
  }
}
