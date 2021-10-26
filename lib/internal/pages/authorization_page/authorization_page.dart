// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/pages/authorization_page/authorization_page_view.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  static const routeName = '/authorization-page';

  @override
  Widget build(BuildContext context) {
    return const AuthorizationPageView();
  }
}
