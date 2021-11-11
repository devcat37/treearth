// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class Spot {
  const Spot({
    required this.id,
    required this.position,
  });

  /// Уникальный номер точки.
  final String id;

  /// Расположение точки на карте.
  final LatLng position;
}
