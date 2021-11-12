// Package imports:
import 'package:carousel_slider/carousel_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/domain/mocks/mock_spots.dart';
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';
import 'package:treearth/internal/states/spots_state/spots_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/internal/utils/utils.dart';

part 'planet_page_state.g.dart';

enum PlanetPageSection {
  /// Раздел с озеленением.
  plants,

  /// Раздел с уборкой мусора.
  trash,
}

class PlanetPageState = _PlanetPageStateBase with _$PlanetPageState;

abstract class _PlanetPageStateBase with Store {
  SpotsState get spotsState => service<SpotsState>();

  /// Контроллер. Вынесен в стейт для управления при нажатии на маркер.
  final CarouselController carouselController = CarouselController();

  late GoogleMapController mapController;

  /// Начальное положение камеры в зависимости от локации пользователя.
  ///
  /// Локация может определяться автоматически, либо если нет доступа к GPS, то вручную.
  @observable
  CameraPosition cameraPosition = CameraPosition(target: initialCameraCoordinates, zoom: 15.0, tilt: 0, bearing: 0);

  /// Начальные координаты камеры.
  @observable
  LatLng _targetCoordinates = initialCameraCoordinates;

  /// Набор точек растительности, с которыми можно взаимодействовать.
  @computed
  ObservableList<PlantSpot> get plantSpots => spotsState.plantSpots;

  /// Набор точек мусора, с которыми можно взаимодействовать.
  @computed
  ObservableList<TrashSpot> get trashSpots => spotsState.trashSpots;

  @computed
  ObservableList<Spot> get activeSpots => section == PlanetPageSection.plants ? plantSpots : trashSpots;

  /// Текущий выбранный раздел на странице.
  ///
  /// От него зависит какие данные о точках нужно подгружать (либо о точках с растительностью, либо о точках с мусором).
  @observable
  PlanetPageSection section = PlanetPageSection.plants;

  @observable
  LatLng _lastFetchPosititon = initialCameraCoordinates;

  @action
  Future<void> changeSection(int sectionIndex) async {
    section = PlanetPageSection.values.elementAt(sectionIndex);
  }

  @action
  Future<void> onTapMarker(String markerId) async {
    carouselController.animateToPage(activeSpots.indexWhere((spot) => spot.id == markerId),
        duration: defaultAnimationDuration * 2);
  }

  @action
  Future<void> onCameraPositionChanged(CameraPosition position) async {
    cameraPosition = cameraPosition;

    // Ограничение на количество запросов.
    if (distanceBetweenPoints(position.target, _lastFetchPosititon) >= Settings.defaultSearchSpotRadius / 2) {
      spotsState.loadSpots(position.target);
      _lastFetchPosititon = position.target;
    }
  }
}

extension PlanetPageSectionExt on PlanetPageSection {
  String get title {
    switch (this) {
      case PlanetPageSection.plants:
        return 'Озеленение';
      case PlanetPageSection.trash:
        return 'Уборка мусора';
    }
  }
}
