// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:phone_number/phone_number.dart';

// Project imports:
import 'package:treearth/presentation/pages/phone_number_page/phone_number_page_view.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({
    Key? key,
    this.onSuccessfulConfirmation,
  }) : super(key: key);

  static const routeName = '/phone-number-page';

  final Function(PhoneNumber)? onSuccessfulConfirmation;

  @override
  Widget build(BuildContext context) {
    return PhoneNumberPageView(
      onSuccessfulConfirmation: onSuccessfulConfirmation,
    );
  }
}
