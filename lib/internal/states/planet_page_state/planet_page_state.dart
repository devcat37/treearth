// Package imports:
import 'package:carousel_slider/carousel_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/domain/mocks/mock_spots.dart';
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';
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
  /// Контроллер. Вынесен в стейт для управления при нажатии на маркер.
  final CarouselController carouselController = CarouselController();

  late GoogleMapController mapController;

  /// Начальное положение камеры в зависимости от локации пользователя.
  ///
  /// Локация может определяться автоматически, либо если нет доступа к GPS, то вручную.
  @computed
  CameraPosition get cameraPosition => CameraPosition(target: _targetCoordinates, zoom: 15.0, tilt: 0, bearing: 0);

  /// Начальные координаты камеры.
  @observable
  LatLng _targetCoordinates = initialCameraCoordinates;

  /// Набор точек растительности, с которыми можно взаимодействовать.
  @observable
  ObservableList<PlantSpot> plantSpots = ObservableList.of(allMockPlantSpots);

  /// Набор точек мусора, с которыми можно взаимодействовать.
  @observable
  ObservableList<TrashSpot> trashSpots = ObservableList.of(allMockTrashSpots);

  @computed
  ObservableList<Spot> get activeSpots =>
      ObservableList.of(section == PlanetPageSection.plants ? plantSpots : trashSpots);

  /// Текущий выбранный раздел на странице.
  ///
  /// От него зависит какие данные о точках нужно подгружать (либо о точках с растительностью, либо о точках с мусором).
  @observable
  PlanetPageSection section = PlanetPageSection.plants;

  @action
  Future<void> changeSection(int sectionIndex) async {
    section = PlanetPageSection.values.elementAt(sectionIndex);
  }

  Future<void> onTapMarker(String markerId) async {
    carouselController.animateToPage(activeSpots.indexWhere((spot) => spot.id == markerId),
        duration: defaultAnimationDuration * 2);
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
