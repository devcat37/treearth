// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/pages/phone_number_page/phone_number_page_view.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  static const routeName = '/phone-number-page';

  @override
  Widget build(BuildContext context) {
    return const PhoneNumberPageView();
  }
}
