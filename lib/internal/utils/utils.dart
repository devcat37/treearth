// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Начальная позиция камеры. Указывает на г. Тейково.
const LatLng initialCameraCoordinates = LatLng(56.852429788108054, 40.53087642118375);

class Utils {
  static BitmapDescriptor? plantIcon;
  static BitmapDescriptor? trashIcon;

  static Future<void> loadMapPoints() async {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48, 48)), 'assets/map/map_point_plant.png')
        .then((value) {
      plantIcon = value;
    });

    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48, 48)), 'assets/map/map_point_trash.png')
        .then((value) {
      trashIcon = value;
    });
  }
}
