// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/auth_state/auth_state.dart';
import 'package:treearth/internal/states/user_state/user_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';
import 'package:treearth/presentation/global/tree_input/tree_input.dart';

class AuthorizationPageView extends StatelessWidget {
  const AuthorizationPageView({Key? key}) : super(key: key);

  AuthState get authState => service<AuthState>();
  UserState get userState => service<UserState>();

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: sidePadding64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TreeButton(
            onPressed: () async {
              final authResult = await authState.signInWithGoogle();

              if (authResult) {
                if (userState.user?.isNew ?? true)
                  goToOnboardingPage(context);
                else
                  goToMainPage(context);
              }
            },
            width: MediaQuery.of(context).size.width - sidePadding32 * 2,
            // TODO: Добавить икноку гугла в название.
            title: 'Google',
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: sidePadding18),
          TreeButton.outlined(
            onPressed: () async {
              final result = await goToPhoneNumberPage(
                context,
                // Авторизация с помощью номера телефона, если введенный номер подтвержден по СМС.
                onSuccessfulConfirmation: (phone) async {
                  final authResult = await authState.signInWithPhoneNumber();

                  if (authResult) {
                    if (userState.user?.isNew ?? true)
                      goToOnboardingPage(context);
                    else
                      goToMainPage(context);
                  }
                },
              );
            },
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
      padding: EdgeInsets.only(
        bottom: defaultKeyboardHeight + TreeInput.defaultHeight + TreeButton.defaultHeight + sidePadding24 * 3,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Hero(
            tag: 'AuthTitleHeroTag',
            child: Text(
              'Выберите, как вы хотите авторизоваться',
              style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
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
