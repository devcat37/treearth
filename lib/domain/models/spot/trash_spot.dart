// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/internal/utils/utils.dart';

class TrashSpot extends Spot {
  TrashSpot({
    required String id,
    required LatLng position,
    String imageUrl = defaultTrashImage,
  }) : super(
          id: id,
          position: position,
          imageUrl: imageUrl,
        );
}
