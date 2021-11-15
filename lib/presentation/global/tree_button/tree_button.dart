// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class TreeButton extends StatelessWidget {
  const TreeButton({
    Key? key,
    required this.title,
    this.height = defaultHeight,
    this.width = defaultWidth,
    this.onPressed,
    this.style,
    this.color = semiDarkGreenColor,
    this.titleColor,
    bool? isOutlined,
  })  : isOutlined = isOutlined ?? false,
        super(key: key);

  const TreeButton.outlined({
    Key? key,
    required this.title,
    this.height = defaultHeight,
    this.width = defaultWidth,
    this.onPressed,
    this.style,
    this.color = semiDarkGreenColor,
    this.titleColor,
  })  : isOutlined = true,
        super(key: key);

  static const defaultHeight = 60.0;
  static const defaultWidth = 250.0;

  final double height;
  final double width;
  final String title;
  final TextStyle? style;
  final Function()? onPressed;
  final bool isOutlined;
  final Color? titleColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius12,
      child: Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isOutlined ? whiteColor : color ?? semiDarkGreenColor,
          borderRadius: borderRadius12,
          border: isOutlined ? Border.all(width: 1.0, color: color ?? semiDarkGreenColor) : null,
        ),
        child: Center(
          child: Text(
            title,
            style: style?.copyWith(color: titleColor ?? (isOutlined ? Colors.black : whiteColor)) ??
                Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: titleColor ?? (isOutlined ? Colors.black : whiteColor)),
          ),
        ),
      ),
    );
  }
}
