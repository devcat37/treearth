// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';
import 'package:treearth/presentation/global/tree_input/tree_input.dart';

class AuthorizationPageView extends StatelessWidget {
  const AuthorizationPageView({Key? key}) : super(key: key);

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: sidePadding64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TreeButton(
            onPressed: () => print('fsd'),
            width: MediaQuery.of(context).size.width - sidePadding32 * 2,
            // TODO: Добавить икноку гугла в название.
            title: 'Google',
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: sidePadding18),
          TreeButton.outlined(
            onPressed: () => print('fsd'),
            width: MediaQuery.of(context).size.width - sidePadding32 * 2,
            title: 'Номер телефона',
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: defaultKeyboardHeight + TreeInput.defaultHeight + sidePadding24 * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Выберите, как вы хотите авторизоваться',
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _buildTitle(context),
          _buildButtons(context),
        ],
      ),
    );
  }
}
