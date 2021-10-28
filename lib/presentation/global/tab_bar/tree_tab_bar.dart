// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class TreeTabBar extends StatefulWidget {
  const TreeTabBar({Key? key}) : super(key: key);

  static const defaultHeight = 56.0;

  @override
  _TreeTabBarState createState() => _TreeTabBarState();
}

class _TreeTabBarState extends State<TreeTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: TreeTabBar.defaultHeight,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: sidePadding24),
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
