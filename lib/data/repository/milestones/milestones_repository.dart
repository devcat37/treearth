// Project imports:
import 'package:treearth/domain/mocks/mock_milestones.dart';
import 'package:treearth/domain/models/milestone/milestone.dart';
import 'package:treearth/domain/repository/load_result.dart';
import 'package:treearth/internal/utils/infrastructure.dart';

class MilestonesRepository {
  /// Получение списка баннеров с бэкэнда.
  Future<ListLoadResult<Milestone>> fetchMilestones() async {
    await Future.delayed(aSecond * 4);

    return ListLoadResult(data: allMockMilestones);
  }
}
