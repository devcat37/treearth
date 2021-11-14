// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/auth_state/auth_state.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/icons/tree_icon.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';
import 'package:treearth/presentation/global/tree_dialog/tree_dialog.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  Widget _buildLogoutButton(BuildContext context) {
    return TreeIcon(
      onPressed: () => showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => TreeDialog.logout(
          onSuccessPressed: () {
            service<AuthState>().logout();
            goToAuthorizationPage(context);
          },
          onCancelPressed: () => pop(context),
        ),
      ),
      icon: TreeIcons.logout,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Настройки',
        actions: [
          _buildLogoutButton(context),
        ],
      ),
    );
  }
}
