// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/confirm_number_state/confirm_number_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/pin_code_field/pin_code_field.dart';
import 'package:treearth/presentation/global/pin_controller/pin_controller.dart';
import 'package:treearth/presentation/global/pin_enter/pin_enter.dart';

class ConfirmNumberPageView extends StatefulWidget {
  const ConfirmNumberPageView({Key? key}) : super(key: key);

  @override
  State<ConfirmNumberPageView> createState() => _ConfirmNumberPageViewState();
}

class _ConfirmNumberPageViewState extends State<ConfirmNumberPageView> {
  static const _pinLength = ConfirmNumberState.defaultCodeLength;

  final PinController controller = PinController(length: _pinLength);

  ConfirmNumberState get confirmNumberState => service<ConfirmNumberState>();

  Widget _buildWeHaveSent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Мы отправили SMS с кодом на номер\n',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: greyTextColor, height: 16 / 14),
                ),
                TextSpan(
                  text: '${confirmNumberState.phone.national} (DEBUG: ${confirmNumberState.verificationCode})',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: darkGreyColor, fontFamily: 'Inter'),
                ),
              ],
            ),
          ),
          const SizedBox(height: sidePadding8),
          Text(
            'Чтобы закончить подтверждение номера, пожалуйста введите 6-ти символьный код подтверждения.',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: greyTextColor, height: 18 / 14),
          ),
        ],
      ),
    );
  }

  Widget _buildDidntReceiveTheCode(BuildContext context) {
    return Text(
      'Не получили код?',
      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: lightGreenColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TreeAppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: sidePadding),
                      _buildWeHaveSent(context),
                      const SizedBox(height: sidePadding),
                      PinCodeField(
                        controller: controller,
                        length: _pinLength,
                        onComplete: (code) {
                          final isValidCode = confirmNumberState.verifyCode(code);

                          if (isValidCode) pop(context, true);
                        },
                      ),
                      _buildDidntReceiveTheCode(context),
                    ],
                  ),
                ),
              ),
              PinEnter(
                controller: controller,
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).padding.bottom == 0 ? sidePadding24 : MediaQuery.of(context).padding.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
