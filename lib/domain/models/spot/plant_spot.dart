// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/models/spot/spot.dart';

class PlantSpot extends Spot {
  const PlantSpot({
    required String id,
    required LatLng position,
  }) : super(
          id: id,
          position: position,
        );
}
