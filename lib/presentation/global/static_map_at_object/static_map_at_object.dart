// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/mocks/mock_uuid.dart';
import 'package:treearth/internal/services/helpers.dart';

/// Виды объектов на карте.
enum MapObjectType {
  /// Точка с растительностью.
  plant,

  /// Точка с мусором.
  trash,
}

class StaticMapAtObject extends StatefulWidget {
  const StaticMapAtObject({
    Key? key,
    required this.position,
    this.allowScrolling = true,
    this.objectType = MapObjectType.plant,
  }) : super(key: key);

  final LatLng position;
  final bool allowScrolling;
  final MapObjectType objectType;

  @override
  _StaticMapAtObjectState createState() => _StaticMapAtObjectState();
}

class _StaticMapAtObjectState extends State<StaticMapAtObject> {
  late GoogleMapController mapController;

  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    String value = await DefaultAssetBundle.of(context).loadString('assets/map_style.json');
    mapController.setMapStyle(value);
  }

  Future<Set<Marker>> _createMarker() async {
    final BitmapDescriptor plantIcon =
        BitmapDescriptor.fromBytes(await getBytesFromAsset('assets/map/map_point_plant.png', 96));
    final BitmapDescriptor trashIcon =
        BitmapDescriptor.fromBytes(await getBytesFromAsset('assets/map/map_point_trash.png', 96));

    return {
      Marker(
        markerId: MarkerId(uuid.v4()),
        position: widget.position,
        icon: widget.objectType == MapObjectType.plant ? plantIcon : trashIcon,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _createMarker(),
      builder: (_, AsyncSnapshot<Set<Marker>> snapshot) => GoogleMap(
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        scrollGesturesEnabled: widget.allowScrolling,
        compassEnabled: false,
        cameraTargetBounds: CameraTargetBounds(LatLngBounds(
          // Ограничение передвижения камеры.
          northeast: LatLng(widget.position.latitude + 0.001, widget.position.longitude + 0.001),
          southwest: LatLng(widget.position.latitude - 0.001, widget.position.longitude - 0.001),
        )),
        initialCameraPosition: CameraPosition(target: widget.position, zoom: 17.0, tilt: 0, bearing: 0),
        onMapCreated: onMapCreated,
        markers: snapshot.data ?? {},
      ),
    );
  }
}
