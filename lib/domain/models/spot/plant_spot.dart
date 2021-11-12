// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/internal/utils/utils.dart';

part 'plant_spot.g.dart';

@JsonSerializable(explicitToJson: true)
class PlantSpot extends Spot {
  PlantSpot({
    required String id,
    required LatLng position,
    required this.title,
    String? imageUrl,
  }) : super(
          id: id,
          position: position,
          imageUrl: imageUrl ?? defaultPlantImage,
        );

  factory PlantSpot.fromJson(Map<String, dynamic> json) => _$PlantSpotFromJson(json);
  Map<String, dynamic> toJson() => _$PlantSpotToJson(this);

  /// Название растения / дерева / куста и т.д.
  final String title;
}
