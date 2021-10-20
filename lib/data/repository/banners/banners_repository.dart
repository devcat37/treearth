// Project imports:
import 'package:treearth/domain/mocks/mock_banners.dart';
import 'package:treearth/domain/models/banner/tree_banner.dart';
import 'package:treearth/domain/repository/load_result.dart';
import 'package:treearth/internal/utils/infrastructure.dart';

class BannersRepository {
  /// Получение списка баннеров с бэкэнда.
  Future<ListLoadResult<TreeBanner>> fetchBanners() async {
    await Future.delayed(aSecond * 4);

    return ListLoadResult(data: [mockBanner1, mockBanner2, mockBanner3]);
  }
}
