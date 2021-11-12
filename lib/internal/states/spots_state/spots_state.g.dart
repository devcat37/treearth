// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spots_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SpotsState on _SpotsStateBase, Store {
  final _$plantSpotsAtom = Atom(name: '_SpotsStateBase.plantSpots');

  @override
  ObservableList<PlantSpot> get plantSpots {
    _$plantSpotsAtom.reportRead();
    return super.plantSpots;
  }

  @override
  set plantSpots(ObservableList<PlantSpot> value) {
    _$plantSpotsAtom.reportWrite(value, super.plantSpots, () {
      super.plantSpots = value;
    });
  }

  final _$trashSpotsAtom = Atom(name: '_SpotsStateBase.trashSpots');

  @override
  ObservableList<TrashSpot> get trashSpots {
    _$trashSpotsAtom.reportRead();
    return super.trashSpots;
  }

  @override
  set trashSpots(ObservableList<TrashSpot> value) {
    _$trashSpotsAtom.reportWrite(value, super.trashSpots, () {
      super.trashSpots = value;
    });
  }

  final _$loadSpotsAsyncAction = AsyncAction('_SpotsStateBase.loadSpots');

  @override
  Future<void> loadSpots(LatLng position) {
    return _$loadSpotsAsyncAction.run(() => super.loadSpots(position));
  }

  final _$_addSpotsAsyncAction = AsyncAction('_SpotsStateBase._addSpots');

  @override
  Future<void> _addSpots(List<Spot> spots) {
    return _$_addSpotsAsyncAction.run(() => super._addSpots(spots));
  }

  @override
  String toString() {
    return '''
plantSpots: ${plantSpots},
trashSpots: ${trashSpots}
    ''';
  }
}
