// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/gradient_text/gradient_text.dart';

class PinCodeNumber extends StatefulWidget {
  const PinCodeNumber(this.number, {Key? key, this.size = sidePadding48}) : super(key: key);

  final String number;
  final double size;

  @override
  _PinCodeNumberState createState() => _PinCodeNumberState();
}

class _PinCodeNumberState extends State<PinCodeNumber> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? curve;
  Tween<double>? valueTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: defaultAnimationDuration);

    valueTween = Tween<double>(begin: 0, end: 1);

    curve = CurvedAnimation(parent: _controller!, curve: Curves.easeInOutCubic);

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null)
      return AnimatedBuilder(
        animation: _controller!,
        builder: (context, _) => Opacity(
          opacity: valueTween!.evaluate(curve!),
          child: GradientText(
            widget.number,
            gradient: LinearGradient(colors: [lightGreenColor, semiDarkGreenColor]),
            style: TextStyle(
              fontSize: valueTween!.evaluate(curve!) * widget.size,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
        ),
      );
    return SizedBox.shrink();
  }
}
