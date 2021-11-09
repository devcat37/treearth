// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/gradient_text/gradient_text.dart';
import 'package:treearth/presentation/global/pin_controller/pin_controller.dart';

class PinCodeField extends StatefulWidget {
  const PinCodeField({
    Key? key,
    this.length = 4,
    this.controller,
  }) : super(key: key);

  final int length;
  final PinController? controller;

  @override
  State<PinCodeField> createState() => _PinCodeFieldState();
}

class _PinCodeFieldState extends State<PinCodeField> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildField(BuildContext context) {
    final padding = (4 / widget.length) * sidePadding;
    final width =
        (MediaQuery.of(context).size.width - sidePadding32 * 2 - padding * (widget.length - 1)) / widget.length;

    return Container(
      width: width,
      height: width * 4 / 3,
      decoration: BoxDecoration(
        color: surfaceGreyColor,
        borderRadius: borderRadius12,
      ),
    );
  }

  Widget _buildNumber(BuildContext context, String value) {
    return Center(
      child: GradientText(
        value,
        gradient: LinearGradient(colors: [lightGreenColor, semiDarkGreenColor]),
        style: TextStyle(
          fontSize: (4 / widget.length) * sidePadding48,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: sidePadding32),
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.length, (index) {
          final value =
              index > (widget.controller?.pin?.length ?? 0) ? '' : widget.controller?.pin?[index].toString() ?? '';
          print(value);
          return Stack(
            alignment: Alignment.center,
            children: [
              _buildField(context),
              _buildNumber(context, value),
            ],
          );
        }),
      ),
    );
  }
}
