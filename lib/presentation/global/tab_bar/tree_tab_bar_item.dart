// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class TreeTabBarItem {
  const TreeTabBarItem({
    Key? key,
    required this.title,
    this.activeColor = lightGreenColor,
  });

  final String title;
  final Color activeColor;
}
