// Flutter imports:
import 'package:flutter/material.dart';

class TreeIcon extends StatelessWidget {
  const TreeIcon({
    Key? key,
    required this.icon,
    this.size = defaultSize,
    this.color = Colors.black,
    this.rotationAngle,
    this.onPressed,
  }) : super(key: key);

  static const defaultSize = 24.0;

  final IconData icon;
  final Color color;

  /// Размер иконки. Если не указан, то будет использоваться *defaultSize*.
  final double size;

  /// Искусственно поворачивает иконку на определенный угол.
  /// Угол должен быть в радианах.
  final double? rotationAngle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      child: Transform.rotate(
        angle: rotationAngle ?? 0,
        child: Icon(icon, size: size, color: color),
      ),
    );
  }
}
