// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/internal/utils/utils.dart';

class PlantSpot extends Spot {
  PlantSpot({
    required String id,
    required LatLng position,
    required this.title,
    String imageUrl = defaultPlantImage,
  }) : super(
          id: id,
          position: position,
          imageUrl: imageUrl,
        );

  /// Название растения / дерева / куста и т.д.
  final String title;
}
