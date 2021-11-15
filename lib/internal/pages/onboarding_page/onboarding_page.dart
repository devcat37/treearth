// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/pages/onboarding_page/onboarding_page_view.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  static const routeName = '/onboarding-page';

  @override
  Widget build(BuildContext context) {
    return const OnboardingPageView();
  }
}
