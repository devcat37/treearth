// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet_page_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlanetPageState on _PlanetPageStateBase, Store {
  Computed<ObservableList<PlantSpot>>? _$plantSpotsComputed;

  @override
  ObservableList<PlantSpot> get plantSpots => (_$plantSpotsComputed ??=
          Computed<ObservableList<PlantSpot>>(() => super.plantSpots,
              name: '_PlanetPageStateBase.plantSpots'))
      .value;
  Computed<ObservableList<TrashSpot>>? _$trashSpotsComputed;

  @override
  ObservableList<TrashSpot> get trashSpots => (_$trashSpotsComputed ??=
          Computed<ObservableList<TrashSpot>>(() => super.trashSpots,
              name: '_PlanetPageStateBase.trashSpots'))
      .value;
  Computed<ObservableList<Spot>>? _$activeSpotsComputed;

  @override
  ObservableList<Spot> get activeSpots => (_$activeSpotsComputed ??=
          Computed<ObservableList<Spot>>(() => super.activeSpots,
              name: '_PlanetPageStateBase.activeSpots'))
      .value;

  final _$cameraPositionAtom =
      Atom(name: '_PlanetPageStateBase.cameraPosition');

  @override
  CameraPosition get cameraPosition {
    _$cameraPositionAtom.reportRead();
    return super.cameraPosition;
  }

  @override
  set cameraPosition(CameraPosition value) {
    _$cameraPositionAtom.reportWrite(value, super.cameraPosition, () {
      super.cameraPosition = value;
    });
  }

  final _$_targetCoordinatesAtom =
      Atom(name: '_PlanetPageStateBase._targetCoordinates');

  @override
  LatLng get _targetCoordinates {
    _$_targetCoordinatesAtom.reportRead();
    return super._targetCoordinates;
  }

  @override
  set _targetCoordinates(LatLng value) {
    _$_targetCoordinatesAtom.reportWrite(value, super._targetCoordinates, () {
      super._targetCoordinates = value;
    });
  }

  final _$sectionAtom = Atom(name: '_PlanetPageStateBase.section');

  @override
  PlanetPageSection get section {
    _$sectionAtom.reportRead();
    return super.section;
  }

  @override
  set section(PlanetPageSection value) {
    _$sectionAtom.reportWrite(value, super.section, () {
      super.section = value;
    });
  }

  final _$changeSectionAsyncAction =
      AsyncAction('_PlanetPageStateBase.changeSection');

  @override
  Future<void> changeSection(int sectionIndex) {
    return _$changeSectionAsyncAction
        .run(() => super.changeSection(sectionIndex));
  }

  final _$onTapMarkerAsyncAction =
      AsyncAction('_PlanetPageStateBase.onTapMarker');

  @override
  Future<void> onTapMarker(String markerId) {
    return _$onTapMarkerAsyncAction.run(() => super.onTapMarker(markerId));
  }

  final _$onCameraPositionChangedAsyncAction =
      AsyncAction('_PlanetPageStateBase.onCameraPositionChanged');

  @override
  Future<void> onCameraPositionChanged(CameraPosition position) {
    return _$onCameraPositionChangedAsyncAction
        .run(() => super.onCameraPositionChanged(position));
  }

  @override
  String toString() {
    return '''
cameraPosition: ${cameraPosition},
section: ${section},
plantSpots: ${plantSpots},
trashSpots: ${trashSpots},
activeSpots: ${activeSpots}
    ''';
  }
}
