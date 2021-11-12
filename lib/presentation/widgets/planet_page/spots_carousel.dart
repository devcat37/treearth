// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/planet_page_state/planet_page_state.dart';
import 'package:treearth/presentation/widgets/planet_page/plant_spot_container.dart';
import 'package:treearth/presentation/widgets/planet_page/trash_spot_container.dart';

class SpotsCarousel extends StatefulWidget {
  const SpotsCarousel({
    Key? key,
    this.spots = const {},
  }) : super(key: key);

  final Iterable<Spot> spots;

  @override
  _SpotsCarouselState createState() => _SpotsCarouselState();
}

class _SpotsCarouselState extends State<SpotsCarousel> {
  PlanetPageState get state => service<PlanetPageState>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: state.carouselController,
      items: widget.spots
          .map(
            (spot) => spot is PlantSpot
                ? PlantSpotContainer(plant: spot, onPressed: () => goToPlantingPage(context, spot))
                : TrashSpotContainer(trash: spot as TrashSpot, onPressed: () => goToTrashPage(context, spot)),
          )
          .toList(),
      options: CarouselOptions(
        // Высота виджета в зависимости от типа.
        height: widget.spots.any((element) => element is PlantSpot)
            ? PlantSpotContainer.defaultHeight
            : TrashSpotContainer.defaultHeight,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        enableInfiniteScroll: false,

        // Callback при смене элемента в carousel.
        onPageChanged: (index, _) {
          final CameraPosition newCameraPosition =
              CameraPosition(target: state.activeSpots.elementAt(index).position, zoom: 15.0, tilt: 0, bearing: 0);
          final CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newCameraPosition);

          state.mapController.animateCamera(cameraUpdate);
        },
      ),
    );
  }
}
