// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet_page_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlanetPageState on _PlanetPageStateBase, Store {
  Computed<CameraPosition>? _$cameraPositionComputed;

  @override
  CameraPosition get cameraPosition => (_$cameraPositionComputed ??=
          Computed<CameraPosition>(() => super.cameraPosition,
              name: '_PlanetPageStateBase.cameraPosition'))
      .value;
  Computed<ObservableSet<Spot>>? _$activeSpotsComputed;

  @override
  ObservableSet<Spot> get activeSpots => (_$activeSpotsComputed ??=
          Computed<ObservableSet<Spot>>(() => super.activeSpots,
              name: '_PlanetPageStateBase.activeSpots'))
      .value;

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

  final _$plantSpotsAtom = Atom(name: '_PlanetPageStateBase.plantSpots');

  @override
  ObservableSet<PlantSpot> get plantSpots {
    _$plantSpotsAtom.reportRead();
    return super.plantSpots;
  }

  @override
  set plantSpots(ObservableSet<PlantSpot> value) {
    _$plantSpotsAtom.reportWrite(value, super.plantSpots, () {
      super.plantSpots = value;
    });
  }

  final _$trashSpotsAtom = Atom(name: '_PlanetPageStateBase.trashSpots');

  @override
  ObservableSet<TrashSpot> get trashSpots {
    _$trashSpotsAtom.reportRead();
    return super.trashSpots;
  }

  @override
  set trashSpots(ObservableSet<TrashSpot> value) {
    _$trashSpotsAtom.reportWrite(value, super.trashSpots, () {
      super.trashSpots = value;
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

  @override
  String toString() {
    return '''
plantSpots: ${plantSpots},
trashSpots: ${trashSpots},
section: ${section},
cameraPosition: ${cameraPosition},
activeSpots: ${activeSpots}
    ''';
  }
}
