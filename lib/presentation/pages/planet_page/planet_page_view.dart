// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';

class PlanetPageView extends StatefulWidget {
  const PlanetPageView({Key? key}) : super(key: key);

  @override
  State<PlanetPageView> createState() => _PlanetPageViewState();
}

class _PlanetPageViewState extends State<PlanetPageView> {
  final CameraPosition _kInitialPosition =
      CameraPosition(target: LatLng(56.852429788108054, 40.53087642118375), zoom: 15.0, tilt: 0, bearing: 0);

  late GoogleMapController _controller;

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Планета',
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: onMapCreated,
      ),
    );
  }
}
