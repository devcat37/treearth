// Project imports:
import 'package:treearth/domain/mocks/mock_notifications.dart';
import 'package:treearth/domain/models/notification/notification.dart';
import 'package:treearth/domain/repository/load_result.dart';
import 'package:treearth/internal/utils/infrastructure.dart';

class NotificationsRepository {
  /// Получение списка баннеров с бэкэнда.
  Future<ListLoadResult<Notification>> fetchNotifications() async {
    await Future.delayed(aSecond * 4);

    return ListLoadResult(data: [mockNotification1, mockNotification2, mockNotification3]);
  }
}
