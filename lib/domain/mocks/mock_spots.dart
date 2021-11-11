// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';

final allMockPlantSpots = [
  mockPlantSpot1,
  mockPlantSpot2,
  mockPlantSpot3,
  mockPlantSpot4,
  mockPlantSpot5,
  mockPlantSpot6,
  mockPlantSpot7,
  mockPlantSpot8,
];

final allMockTrashSpots = [
  mockTrashSpot1,
  mockTrashSpot2,
  mockTrashSpot3,
  mockTrashSpot4,
  mockTrashSpot5,
  mockTrashSpot6,
  mockTrashSpot7,
  mockTrashSpot8,
];

final mockPlantSpot1 = PlantSpot(id: '12345', position: LatLng(56.858682854961096, 40.55477844182544), title: 'Пихта');
final mockPlantSpot2 = PlantSpot(id: '123456', position: LatLng(56.85779680188899, 40.55255966683722), title: 'Кедр');
final mockPlantSpot3 =
    PlantSpot(id: '123gdf45', position: LatLng(56.85924396540113, 40.53386457959286), title: 'Лиственница');
final mockPlantSpot4 =
    PlantSpot(id: '1234oui56', position: LatLng(56.859289073115924, 40.540844626845654), title: 'Ягодный куст');
final mockPlantSpot5 = PlantSpot(id: '123df45', position: LatLng(56.854321895404475, 40.53983794521936), title: 'Хвоя');
final mockPlantSpot6 = PlantSpot(id: '12as3456', position: LatLng(56.85078887708346, 40.53305114857434), title: 'Туя');
final mockPlantSpot7 =
    PlantSpot(id: '12fgd3gdf45', position: LatLng(56.85120850213872, 40.52675458200965), title: 'Дуб');
final mockPlantSpot8 =
    PlantSpot(id: '12gf34oui56', position: LatLng(56.86254599805598, 40.51792174790172), title: 'Пихта');

final mockTrashSpot1 = TrashSpot(id: '22345', position: LatLng(56.85876405175121, 40.55567369032012));
final mockTrashSpot2 = TrashSpot(id: '223456', position: LatLng(56.85789534956858, 40.55449870750053));
final mockTrashSpot3 = TrashSpot(id: '223556', position: LatLng(56.854997606276356, 40.533861546339004));
final mockTrashSpot4 = TrashSpot(id: '273556', position: LatLng(56.85554646211157, 40.53190449716214));
final mockTrashSpot5 = TrashSpot(id: '2234645', position: LatLng(56.857724350098415, 40.53253981763109));
final mockTrashSpot6 = TrashSpot(id: '223df456', position: LatLng(56.85784268442294, 40.54371622328341));
final mockTrashSpot7 = TrashSpot(id: '22334556', position: LatLng(56.86063956863069, 40.5178019158921));
final mockTrashSpot8 = TrashSpot(id: '2734w556', position: LatLng(56.86175826373885, 40.52632195752494));
