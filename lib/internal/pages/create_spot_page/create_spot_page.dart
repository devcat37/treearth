// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/pages/create_spot_page/create_spot_page_view.dart';

class CreateSpotPage extends StatelessWidget {
  const CreateSpotPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/create-spot-page';

  @override
  Widget build(BuildContext context) {
    return CreateSpotPageView();
  }
}
