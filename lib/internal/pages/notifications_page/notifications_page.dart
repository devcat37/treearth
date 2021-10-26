// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/pages/notifications_page/notifications_page_view.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  static const routeName = '/notifications-page';

  @override
  Widget build(BuildContext context) {
    return const NotificationsPageView();
  }
}
