// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/data/repository/spots/spots_repository.dart';
import 'package:treearth/domain/mocks/mock_spots.dart';
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/interfaces/initializable.dart';
import 'package:treearth/internal/states/interfaces/network_state.dart';
import 'package:treearth/internal/utils/utils.dart';

part 'spots_state.g.dart';

class SpotsState = _SpotsStateBase with _$SpotsState;

abstract class _SpotsStateBase extends NetworkState with Store implements Initializable {
  SpotsRepository get repository => service<SpotsRepository>();

  /// Набор точек растительности, с которыми можно взаимодействовать.
  @observable
  ObservableList<PlantSpot> plantSpots = ObservableList();

  /// Набор точек мусора, с которыми можно взаимодействовать.
  @observable
  ObservableList<TrashSpot> trashSpots = ObservableList();

  /// Загрузка точек возле этой позиции из аргумента *position*.
  @action
  Future<void> loadSpots(LatLng position) async {
    isLoading = true;
    final result = await repository.loadSpotsInRadius(position.latitude, position.longitude);
    if (result.isSuccessful) _addSpots(result.data ?? []);

    isLoading = false;
  }

  @action
  Future<void> _addSpots(List<Spot> spots) async {
    trashSpots.clear();
    plantSpots.clear();

    spots.forEach((spot) {
      if (spot is PlantSpot) {
        plantSpots.add(spot);
      } else if (spot is TrashSpot) {
        trashSpots.add(spot);
      }
    });
  }

  @override
  Future<void> initialize() async {
    await loadSpots(initialCameraCoordinates);
  }
}
