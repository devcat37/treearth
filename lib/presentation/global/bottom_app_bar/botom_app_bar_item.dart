// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

// ignore: must_be_immutable
class BottomAppBarItem extends StatefulWidget {
  BottomAppBarItem({
    Key? key,
    required this.icon,
    required this.activeIcon,
    this.activeColor = lightGreenColor,
  }) : super(key: key);

  static const double defaultWidth = 28.0;

  final IconData icon;
  final IconData activeIcon;
  final Color activeColor;

  bool _isActive = false;
  bool get isActive => _isActive;

  void setActive(bool active) => _isActive = active;

  @override
  _BottomAppBarItemState createState() => _BottomAppBarItemState();
}

class _BottomAppBarItemState extends State<BottomAppBarItem> {
  bool get isActive => widget.isActive;

  @override
  Widget build(BuildContext context) {
    return Icon(
      isActive ? widget.activeIcon : widget.icon,
      size: BottomAppBarItem.defaultWidth,
      color: isActive ? widget.activeColor : lightGreyColor,
    );
  }
}
