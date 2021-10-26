// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/did_you_know/did_you_know.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';

class AuthorizationSplashView extends StatelessWidget {
  const AuthorizationSplashView({Key? key}) : super(key: key);

  Widget _buildLoginButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: sidePadding64),
        child: TreeButton(
          onPressed: () => goToAuthorizationPage(context),
          width: MediaQuery.of(context).size.width - sidePadding32 * 2,
          title: 'Войти',
          style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Hero(
              tag: DidYouKnow.heroTag,
              child: DidYouKnow(),
            ),
          ),
          _buildLoginButton(context),
        ],
      ),
    );
  }
}
