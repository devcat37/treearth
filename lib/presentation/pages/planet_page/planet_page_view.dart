// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/planet_page_state/planet_page_state.dart';
import 'package:treearth/internal/states/spots_state/spots_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/bottom_app_bar/bottom_app_bar.dart' as b;
import 'package:treearth/presentation/global/static_map_at_object/static_map_at_object.dart';
import 'package:treearth/presentation/global/tab_bar/tree_tab_bar.dart';
import 'package:treearth/presentation/global/tab_bar/tree_tab_bar_item.dart';
import 'package:treearth/presentation/global/tab_bar_controller/tree_tab_bar_controller.dart';
import 'package:treearth/presentation/global/tree_dialog/tree_dialog.dart';
import 'package:treearth/presentation/widgets/planet_page/spots_carousel.dart';

class PlanetPageView extends StatefulWidget {
  const PlanetPageView({Key? key}) : super(key: key);

  @override
  State<PlanetPageView> createState() => _PlanetPageViewState();
}

class _PlanetPageViewState extends State<PlanetPageView> {
  PlanetPageState get state => service<PlanetPageState>();
  SpotsState get spotsState => service<SpotsState>();

  final TreeTabBarController _tabController = TreeTabBarController();

  Future<void> showCreateNewSpotDialog(LatLng position) async {
    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => TreeDialog.newPlantSpot(
        themeColor: state.section == PlanetPageSection.plants ? semiDarkGreenColor : semiDarkOrangeColor,
        onSuccessPressed: () {
          pop(context);

          final type = state.section == PlanetPageSection.plants ? MapObjectType.plant : MapObjectType.trash;
          goToCreateSpotPage(context, position: position, type: type);
        },
      ),
    );
  }

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
      ),
      body: Stack(
        children: [
          Observer(
            builder: (context) {
              log('Количество видимых точек: ${state.activeSpots.length}');

              return FutureBuilder(
                future: _createMarkers(state.activeSpots),
                builder: (context, AsyncSnapshot<Set<Marker>> snapshot) => GoogleMap(
                  onCameraMove: state.onCameraPositionChanged,
                  mapToolbarEnabled: false,
                  initialCameraPosition: state.cameraPosition,
                  onMapCreated: onMapCreated,
                  markers: snapshot.data ?? {},
                  onLongPress: showCreateNewSpotDialog,
                ),
              );
            },
          ),
          TreeTabBar(
            controller: _tabController,
            items: [
              TreeTabBarItem(title: PlanetPageSection.plants.title, activeColor: lightGreenColor),
              TreeTabBarItem(title: PlanetPageSection.trash.title, activeColor: semiDarkOrangeColor),
            ],
            onPageChanged: (page) => state.changeSection(page),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: b.BottomAppBar.defaultHeight + sidePadding),
              child: Observer(
                builder: (context) {
                  log('Количество видимых точек: ${state.activeSpots.length}'.substring(0, 0));

                  return SpotsCarousel(
                    spots: state.activeSpots,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
