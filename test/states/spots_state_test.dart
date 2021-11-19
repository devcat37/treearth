// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/domain/models/spot/spot.dart';
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/utils/utils.dart';

const plantSpotJson = {
  'id': 'dfgdfgdfg',
  'position': {
    'latitude': 56.01323452,
    'longtitude': 18.0435367,
  },
  'type': 'PLANT',
  'title': 'Пихта',
  'imageUrl': defaultPlantImage,
};

const trashSpotJson = {
  'id': 'dfgdfgdfg',
  'position': {
    'latitude': 56.01323452,
    'longtitude': 18.0435367,
  },
  'type': 'TRASH',
  'imageUrl': defaultTrashImage,
};

void main() {
  group('Тесты стейта Spots', () {
    test('Проверка парсинга PlantSpot из json', () {
      final plant = PlantSpot.fromJson(plantSpotJson);

      expect(plant.position.runtimeType, LatLng);
      expect(plant.title, 'Пихта');
    });

    test('Проверка парсинга TrashSpot из json', () {
      final trash = TrashSpot.fromJson(plantSpotJson);

      expect(trash.position.runtimeType, LatLng);
    });

    test('Проверка парсинга через Spot', () {
      final trash = Spot.fromJson(trashSpotJson);

      expect(trash.runtimeType, TrashSpot);
    });
  });
}
