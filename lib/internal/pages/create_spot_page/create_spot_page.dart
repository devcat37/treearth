// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/presentation/pages/create_spot_page/create_spot_page_view.dart';

class CreateSpotPage extends StatelessWidget {
  const CreateSpotPage({
    Key? key,
    required this.position,
  }) : super(key: key);

  static const routeName = '/create-spot-page';

  final LatLng position;

  @override
  Widget build(BuildContext context) {
    return CreateSpotPageView();
  }
}
