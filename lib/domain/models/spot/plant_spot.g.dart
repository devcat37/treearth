// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantSpot _$PlantSpotFromJson(Map<String, dynamic> json) {
  return PlantSpot(
    id: json['id'] as String,
    position: Spot.positionFromJson(json['position'] as Map<String, dynamic>),
    title: json['title'] as String,
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$PlantSpotToJson(PlantSpot instance) => <String, dynamic>{
      'id': instance.id,
      'position': instance.position.toJson(),
      'imageUrl': instance.imageUrl,
      'title': instance.title,
    };
