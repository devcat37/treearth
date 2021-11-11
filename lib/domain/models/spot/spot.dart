// Package imports:
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/utils/utils.dart';

abstract class Spot {
  Spot({
    required this.id,
    required this.position,
    this.imageUrl = defaultPlantImage,
    this.placemark,
  }) {
    // Устанавливаем адресс объекта при инициализации.
    adressByLocation(position).then((value) => placemark = value);
  }

  /// Уникальный номер точки.
  final String id;

  /// Расположение точки на карте.
  final LatLng position;

  /// Ссылка на изображение.
  final String imageUrl;

  /// Название, где находится объект.
  Placemark? placemark;
}
