// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';

// Project imports:
import 'package:treearth/domain/models/notification/notification.dart' as n;
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';
import 'package:treearth/presentation/global/notifications/notification_read.dart';

class TreeNotification extends StatelessWidget {
  const TreeNotification({
    Key? key,
    required this.notification,
  }) : super(key: key);

  static const double defaultHeight = 70.0;

  final n.Notification notification;

  List<Color> backgroundColors() {
    switch (notification.type) {
      case n.NotificationType.positive:
        return notificationBackgroundPositiveGradient;
      case n.NotificationType.warning:
        return notificationBackgroundWarningGradient;
      case n.NotificationType.negative:
        return notificationBackgroundNegativeGradient;
    }
  }

  List<Color> iconColors() {
    switch (notification.type) {
      case n.NotificationType.positive:
        return notificationIconPositiveGradient;
      case n.NotificationType.warning:
        return notificationIconWarningGradient;
      case n.NotificationType.negative:
        return notificationIconNegativeGradient;
    }
  }

  Color iconColor() {
    switch (notification.type) {
      case n.NotificationType.positive:
        return notificationIconPositiveColor.withOpacity(0.25);
      case n.NotificationType.warning:
        return notificationIconWarningColor.withOpacity(0.25);
      case n.NotificationType.negative:
        return notificationIconNegativeColor.withOpacity(0.15);
    }
  }

  Color textColor() {
    switch (notification.type) {
      case n.NotificationType.positive:
        return notificationTextPositiveColor;
      case n.NotificationType.warning:
        return notificationTextWarningColor;
      case n.NotificationType.negative:
        return notificationTextNegativeColor;
    }
  }

  IconData icon() {
    switch (notification.type) {
      case n.NotificationType.positive:
        return TreeIcons.done;
      case n.NotificationType.warning:
        return TreeIcons.lotus;
      case n.NotificationType.negative:
        return TreeIcons.earth;
    }
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return Container(
      height: sidePadding40,
      width: sidePadding40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: whiteColor,
        gradient: LinearGradient(
          colors: iconColors(),
        ),
      ),
      child: Center(
        child: Icon(
          icon(),
          size: sidePadding24,
          color: iconColor(),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: sidePadding16, right: sidePadding32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              child: Row(
                children: [
                  _buildNotificationIcon(context),
                  const SizedBox(width: sidePadding12),
                  Expanded(
                    child: Text(
                      notification.content,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: textColor()),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: sidePadding12),
                ],
              ),
            ),
          ),
          Icon(TreeIcons.right_md, color: iconColor(), size: 16.0),
        ],
      ),
    );
  }

  Widget _buildNotificationDate(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: sidePadding),
        child: Text(
          '${notification.timestamp.day} ${monthToString(notification.timestamp.month)}, ${notification.timestamp.hour}:${notification.timestamp.minute}',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 10.0, fontFamily: 'Inter', color: lightGreyColor),
        ),
      ),
    );
  }

  Widget _buildNotificationContainer(BuildContext context) {
    return Container(
      height: defaultHeight + NotificationRead.defaultSize / 3,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              borderRadius: borderRadius12,
              onTap: () {},
              child: Ink(
                height: defaultHeight,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: borderRadius12,
                  color: whiteColor,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: backgroundColors(),
                  ),
                ),
                child: _buildContent(context),
              ),
            ),
          ),
          Observer(
            builder: (_) => !notification.isRead ? NotificationRead() : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNotificationContainer(context),
        const SizedBox(height: sidePadding4),
        _buildNotificationDate(context),
      ],
    );
  }
}
