// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class NotificationRead extends StatelessWidget {
  const NotificationRead({Key? key}) : super(key: key);

  static const defaultSize = 14.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultSize,
      width: defaultSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2.0,
          color: whiteColor,
        ),
      ),
      child: Container(
        width: defaultSize - 2.0,
        height: defaultSize - 2.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: notificationReadColor,
        ),
      ),
    );
  }
}
