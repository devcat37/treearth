// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/pin_controller/pin_controller.dart';

class PinEnter extends StatelessWidget {
  const PinEnter({
    Key? key,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  final PinController? controller;
  final Function()? onChanged;

  static const _style = TextStyle(
      color: blackColor, fontSize: sidePadding48, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 78 / 48);

  Widget _buildPin(BuildContext context, {required Widget pin, Function()? onPressed}) {
    return InkResponse(
      onTap: onPressed,
      child: pin,
    );
  }

  Widget _buildNumberPin(BuildContext context, int number) {
    return _buildPin(
      context,
      onPressed: () {
        if (controller?.pin == null)
          controller?.pin = number.toString();
        else if (controller != null) controller!.pin = controller!.pin! + number.toString();

        controller?.onChanged?.call();
        if (onChanged != null) onChanged!();
      },
      pin: Text(
        number.toString(),
        style: _style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: sidePadding64),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNumberPin(context, 1),
                    _buildNumberPin(context, 4),
                    _buildNumberPin(context, 7),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNumberPin(context, 2),
                    _buildNumberPin(context, 5),
                    _buildNumberPin(context, 8),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNumberPin(context, 3),
                    _buildNumberPin(context, 6),
                    _buildNumberPin(context, 9),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPin(context, pin: _buildNumberPin(context, 0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
