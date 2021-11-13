// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';

class AppBarBack extends StatelessWidget {
  const AppBarBack({Key? key, this.color = blackColor}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => pop(context),
      child: Icon(
        TreeIcons.left_md,
        color: color,
      ),
    );
  }
}
