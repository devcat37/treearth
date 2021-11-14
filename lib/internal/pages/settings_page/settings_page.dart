// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/pages/settings_page/settings_page_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings-page';

  @override
  Widget build(BuildContext context) {
    return const SettingsPageView();
  }
}
