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
    this.hasBackspace = true,
  }) : super(key: key);

  final PinController? controller;
  final Function()? onChanged;
  final bool hasBackspace;

  static const _style = TextStyle(
      color: blackColor, fontSize: sidePadding48, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 78 / 48);

  Widget _buildPin(BuildContext context, {required Widget pin, Function()? onPressed}) {
    return InkResponse(
      onTap: onPressed,
      child: pin,
    );
  }

  Widget _buildBackspace(BuildContext context) {
    return InkResponse(
      onTap: controller?.removeLast,
      child: Icon(Icons.backspace, color: greyTextColor, size: 28.0),
    );
  }

  Widget _buildNumberPin(BuildContext context, int number) {
    return _buildPin(
      context,
      onPressed: () {
        controller?.addValue(number.toString());

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
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: const SizedBox.shrink(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: _buildNumberPin(context, 0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _buildBackspace(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
