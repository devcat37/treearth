// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/internal/utils/utils.dart';

part 'trash_spot.g.dart';

@JsonSerializable(explicitToJson: true)
class TrashSpot extends Spot {
  TrashSpot({
    required String id,
    required LatLng position,
    String? imageUrl,
  }) : super(
          id: id,
          position: position,
          imageUrl: imageUrl ?? defaultTrashImage,
        );

  factory TrashSpot.fromJson(Map<String, dynamic> json) => _$TrashSpotFromJson(json);
  Map<String, dynamic> toJson() => _$TrashSpotToJson(this);
}
