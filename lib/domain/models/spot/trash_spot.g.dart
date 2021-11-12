// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashSpot _$TrashSpotFromJson(Map<String, dynamic> json) {
  return TrashSpot(
    id: json['id'] as String,
    position: Spot.positionFromJson(json['position'] as Map<String, dynamic>),
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$TrashSpotToJson(TrashSpot instance) => <String, dynamic>{
      'id': instance.id,
      'position': instance.position.toJson(),
      'imageUrl': instance.imageUrl,
    };
