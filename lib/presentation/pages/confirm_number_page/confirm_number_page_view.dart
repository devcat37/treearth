// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/pin_code_field/pin_code_field.dart';
import 'package:treearth/presentation/global/pin_controller/pin_controller.dart';
import 'package:treearth/presentation/global/pin_enter/pin_enter.dart';

class ConfirmNumberPageView extends StatefulWidget {
  const ConfirmNumberPageView({Key? key}) : super(key: key);

  @override
  State<ConfirmNumberPageView> createState() => _ConfirmNumberPageViewState();
}

class _ConfirmNumberPageViewState extends State<ConfirmNumberPageView> {
  static const _pinLength = 4;
  final PinController controller = PinController(length: _pinLength);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: PinCodeField(
                  controller: controller,
                  length: _pinLength,
                ),
              ),
            ),
            PinEnter(
              controller: controller,
              onChanged: () {
                setState(() {});
              },
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).padding.bottom == 0 ? sidePadding24 : MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
