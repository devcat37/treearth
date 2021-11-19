// Package imports:
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/services/settings.dart';
import 'package:treearth/internal/utils/utils.dart';

abstract class Spot {
  Spot({
    required this.id,
    required this.position,
    this.imageUrl = defaultPlantImage,
    this.placemark,
  });

  factory Spot.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'PLANT')
      return PlantSpot.fromJson(json);
    else if (json['type'] == 'TRASH') return TrashSpot.fromJson(json);

    throw UnsupportedError('Данный тип точки не поддерживается');
  }

  /// Уникальный номер точки.
  final String id;

  /// Расположение точки на карте.
  @JsonKey(fromJson: positionFromJson)
  final LatLng position;

  /// Ссылка на изображение.
  final String imageUrl;

  /// Название, где находится объект.
  @JsonKey(ignore: true)
  Placemark? placemark;

  /// Преобразование json в LatLng.
  static LatLng positionFromJson(Map<String, dynamic> json) {
    return LatLng(json[Settings.latitudeKey], json[Settings.longtitudeKey]);
  }
}
