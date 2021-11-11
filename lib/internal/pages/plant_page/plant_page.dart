// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/presentation/pages/plant_page/plant_page_view.dart';

class PlantPage extends StatelessWidget {
  const PlantPage({
    Key? key,
    required this.plant,
  }) : super(key: key);

  static const routeName = '/plant-page';

  final PlantSpot plant;

  @override
  Widget build(BuildContext context) {
    return PlantPageView(plant: plant);
  }
}
