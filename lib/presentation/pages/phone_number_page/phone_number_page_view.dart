// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:phone_number/phone_number.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';
import 'package:treearth/presentation/global/tree_input/tree_input.dart';

class PhoneNumberPageView extends StatefulWidget {
  const PhoneNumberPageView({
    Key? key,
    this.onSuccessfulConfirmation,
  }) : super(key: key);

  final Function(PhoneNumber)? onSuccessfulConfirmation;

  @override
  State<PhoneNumberPageView> createState() => _PhoneNumberPageViewState();
}

class _PhoneNumberPageViewState extends State<PhoneNumberPageView> {
  final TextEditingController _numberController = TextEditingController();

  Widget _buildNextButton(BuildContext context) {
    return TreeButton(
      onPressed: () async {
        try {
          final util = PhoneNumberUtil();
          final String rawNumber = _numberController.text;
          final PhoneNumber number = await util.parse(rawNumber);

          final result = await goToConfirmNumberPage(context, number);

          if (result == true && widget.onSuccessfulConfirmation != null) widget.onSuccessfulConfirmation!(number);
        } catch (e) {
          print(e);
        }
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
      controller: _numberController,
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
      appBar: TreeAppBar(),
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
