// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/planet_page_state/planet_page_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/internal/utils/utils.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/bottom_app_bar/bottom_app_bar.dart' as b;
import 'package:treearth/presentation/global/tab_bar/tree_tab_bar.dart';
import 'package:treearth/presentation/global/tab_bar_controller/tree_tab_bar_controller.dart';
import 'package:treearth/presentation/widgets/planet_page/spots_carousel.dart';

class PlanetPageView extends StatefulWidget {
  const PlanetPageView({Key? key}) : super(key: key);

  @override
  State<PlanetPageView> createState() => _PlanetPageViewState();
}

class _PlanetPageViewState extends State<PlanetPageView> {
  PlanetPageState get state => service<PlanetPageState>();

  final TreeTabBarController _tabController = TreeTabBarController();

  @override
  void initState() {
    _tabController.changePage(PlanetPageSection.values.indexWhere((section) => section == state.section));
    super.initState();
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    state.mapController = controller;

    String value = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    state.mapController.setMapStyle(value);
  }

  Future<Set<Marker>> _createMarkers(Iterable<Spot> spots) async {
    final BitmapDescriptor plantIcon =
        BitmapDescriptor.fromBytes(await getBytesFromAsset('assets/map/map_point_plant.png', 96));
    final BitmapDescriptor trashIcon =
        BitmapDescriptor.fromBytes(await getBytesFromAsset('assets/map/map_point_trash.png', 96));

    return spots
        .map(
          (spot) => Marker(
            markerId: MarkerId(spot.id),
            position: spot.position,
            icon: spot is PlantSpot ? plantIcon : trashIcon,
            onTap: () => state.onTapMarker(spot.id),
          ),
        )
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Планета',
        canPop: false,
      ),
      body: Stack(
        children: [
          Observer(
            builder: (_) => FutureBuilder(
              future: _createMarkers(state.activeSpots),
              builder: (_, AsyncSnapshot<Set<Marker>> snapshot) => GoogleMap(
                mapToolbarEnabled: false,
                initialCameraPosition: state.cameraPosition,
                onMapCreated: onMapCreated,
                markers: snapshot.data ?? {},
              ),
            ),
          ),
          TreeTabBar(
            controller: _tabController,
            items: PlanetPageSection.values.map((e) => e.title).toList(),
            onPageChanged: (page) => state.changeSection(page),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: b.BottomAppBar.defaultHeight + sidePadding),
              child: Observer(
                builder: (_) => SpotsCarousel(
                  spots: state.activeSpots,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
