// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/data/repository/notifications/notifications_repository.dart';
import 'package:treearth/domain/models/notification/notification.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/interfaces/initializable.dart';
import 'package:treearth/internal/states/interfaces/network_state.dart';

part 'notifications_state.g.dart';

class NotificationsState = _NotificationsStateBase with _$NotificationsState;

abstract class _NotificationsStateBase extends NetworkState with Store implements Initializable {
  /// Репозиторий уведомлений.
  NotificationsRepository get repository => service<NotificationsRepository>();

  /// Observable notifications list.
  @observable
  ObservableList<Notification> notifications = ObservableList();

  /// Проверка, есть ли непрочитанные уведомления.
  @computed
  bool get hasUnreadNotifications => notifications.any((notification) => !notification.isRead);

  /// Загрузка уведомлений с бэкэнда.
  @action
  Future<void> _loadNotifications() async {
    isLoading = true;

    /// Запрос на бэкэнд через репозиторий на получение уведомлений.
    final apiResult = await repository.fetchNotifications();
    if (apiResult.isSuccessful) notifications = ObservableList.of(apiResult.data ?? []);

    isLoading = false;
  }

  @override
  Future<void> initialize() async {
    await _loadNotifications();
  }
}
