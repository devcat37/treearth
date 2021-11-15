// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/presentation/global/static_map_at_object/static_map_at_object.dart';

part 'create_spot_state.g.dart';

class CreateSpotState = _CreateSpotStateBase with _$CreateSpotState;

abstract class _CreateSpotStateBase with Store {
  _CreateSpotStateBase({
    required this.position,
    required this.type,
  });

  final LatLng position;
  final MapObjectType type;
}
