// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class TreeSlider extends StatefulWidget {
  const TreeSlider({
    Key? key,
    this.thumbSize = 22.0,
    this.thumbColor = semiDarkGreenColor,
    this.thumbStripColor = Colors.transparent,
    this.thumbBorderColor,
    this.onChanged,
    this.value,
  }) : super(key: key);

  final double? value;
  final double thumbSize;
  final Color thumbColor;
  final Color? thumbBorderColor;
  final Color thumbStripColor;

  final Function(double)? onChanged;

  @override
  State<TreeSlider> createState() => _TreeSliderState();
}

class _TreeSliderState extends State<TreeSlider> {
  double _value = 0.0;

  void _onHorizontalDragDown(DragDownDetails details, BoxConstraints constraints) {
    setState(() {
      _value = (details.localPosition.dx / constraints.maxWidth).clamp(0, 1.0);
    });

    if (widget.onChanged != null) widget.onChanged!(_value);
  }

  void _onHorizontalDrawUpdate(DragUpdateDetails details, BoxConstraints constraints) {
    setState(() {
      _value = (details.localPosition.dx / constraints.maxWidth).clamp(0, 1.0);
    });

    if (widget.onChanged != null) widget.onChanged!(_value);
  }

  Widget _buildThumb(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: widget.thumbSize,
          width: widget.thumbSize,
          decoration: BoxDecoration(
            color: widget.thumbBorderColor ?? Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: widget.thumbSize - 4.0,
          width: widget.thumbSize - 4.0,
          decoration: BoxDecoration(
            color: widget.thumbColor,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 10.0 * widget.thumbSize / 22.0,
          width: 4.0 * widget.thumbSize / 22.0,
          decoration: BoxDecoration(
            color: widget.thumbStripColor,
            borderRadius: borderRadius2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final thumbPosition = (constraints.maxWidth - widget.thumbSize) * (widget.value ?? _value);

      return GestureDetector(
          onHorizontalDragDown: (details) => _onHorizontalDragDown(details, constraints),
          onHorizontalDragUpdate: (details) => _onHorizontalDrawUpdate(details, constraints),
          child: Stack(alignment: Alignment.centerLeft, children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5.0,
              decoration: BoxDecoration(
                color: lightGreyColor,
                borderRadius: borderRadius2,
              ),
            ),
            FractionallySizedBox(
              widthFactor: widget.value ?? _value,
              child: Container(
                height: 5.0,
                decoration: BoxDecoration(
                  color: lightGreenColor,
                  borderRadius: borderRadius2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: thumbPosition.toDouble()),
              child: _buildThumb(context),
            ),
          ]));
    });
  }
}
