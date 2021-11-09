// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';
import 'package:treearth/presentation/global/tree_input/tree_input.dart';

class PhoneNumberPageView extends StatelessWidget {
  const PhoneNumberPageView({Key? key}) : super(key: key);

  Widget _buildNextButton(BuildContext context) {
    return TreeButton(
      onPressed: () async {
        final result = await goToConfirmNumberPage(context);
      },
      title: 'Далее',
      style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
      width: MediaQuery.of(context).size.width - sidePadding32 * 2,
    );
  }

  Widget _buildPhoneNumberInput(BuildContext context) {
    return TreeInput(
      title: 'Телефон',
      hintText: 'Введите номер',
      autoFocus: true,
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Hero(
      tag: 'AuthTitleHeroTag',
      child: Text(
        'Пожалуйста, введите номер телефона',
        style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildTitle(context),
            const SizedBox(height: sidePadding),
            _buildPhoneNumberInput(context),
            const SizedBox(height: sidePadding),
            _buildNextButton(context),
            const SizedBox(height: sidePadding),
            const SizedBox(height: defaultKeyboardHeight),
          ],
        ),
      ),
    );
  }
}
