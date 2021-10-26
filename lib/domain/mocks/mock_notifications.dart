// Project imports:
import 'package:treearth/domain/mocks/mock_uuid.dart';
import 'package:treearth/domain/models/notification/notification.dart';

final mockNotification1 = Notification(
  id: uuid.v4(),
  timestamp: DateTime.now(),
  content: 'Волонтер оставил отчет о посадке дерева!',
  type: NotificationType.positive,
);

final mockNotification2 = Notification(
  id: uuid.v4(),
  timestamp: DateTime.now(),
  content: 'Даша Гнездова пригласила убрать тебя мусор!',
  type: NotificationType.warning,
  isRead: true,
);

final mockNotification3 = Notification(
  id: uuid.v4(),
  timestamp: DateTime.now(),
  content: 'Lorem ipsum sit dolor amet consecturur atit!',
  type: NotificationType.negative,
  isRead: true,
);
