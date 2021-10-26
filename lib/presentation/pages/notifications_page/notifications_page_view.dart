// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';

// Project imports:
import 'package:treearth/domain/models/notification/notification.dart' as n;
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/notifications_state/notifications_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/widgets/notifications_page/tree_notification.dart';

class NotificationsPageView extends StatelessWidget {
  const NotificationsPageView({Key? key}) : super(key: key);

  NotificationsState get notificationsState => service<NotificationsState>();

  Widget _buildNotifications(BuildContext context) {
    return Observer(builder: (context) {
      if (notificationsState.isLoading) return const SizedBox();
      final notifications =
          notificationsState.notifications.map((n.Notification e) => TreeNotification(notification: e)).toList();

      return Column(
        children: notifications
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: sidePadding16),
                  child: e,
                ))
            .toList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(title: 'Уведомления'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: sidePadding8),
              _buildNotifications(context),
            ],
          ),
        ),
      ),
    );
  }
}
