// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/utils/infrastructure.dart';

class PlantSpotContainer extends StatelessWidget {
  const PlantSpotContainer({
    Key? key,
    required this.plant,
    this.onPressed,
  }) : super(key: key);

  final PlantSpot plant;
  final Function()? onPressed;

  static const defaultHeight = 140.0;

  Widget _buildImage(BuildContext context) {
    return Hero(
      tag: plant.id,
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: greyTextColor.withOpacity(0.25),
          borderRadius: borderRadius12,
          image: DecorationImage(
            image: NetworkImage(plant.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildInformation(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Название',
          style: style.copyWith(color: lightGreyTextColor, letterSpacing: 1.1),
        ),
        const SizedBox(height: sidePadding2),
        Text(
          plant.title,
          style: style.copyWith(color: notificationTextPositiveColor),
        ),
        const SizedBox(height: sidePadding6),
        Text(
          'Расположение',
          style: style.copyWith(color: lightGreyTextColor, letterSpacing: 1.1),
        ),
        const SizedBox(height: sidePadding2),
        Text(
          plant.placemark?.street ?? plant.placemark?.subAdministrativeArea ?? 'Неустановлено',
          style: style.copyWith(color: darkGreyTextColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius12,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: InkWell(
          borderRadius: borderRadius12,
          onTap: onPressed,
          child: Container(
            height: defaultHeight,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [whiteColor.withOpacity(0.0), lightGreenColor.withOpacity(0.1)],
              ),
              borderRadius: borderRadius12,
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: sidePadding14, left: sidePadding14, right: sidePadding8),
                child: Row(
                  children: [
                    Row(
                      children: [
                        _buildImage(context),
                        const SizedBox(width: sidePadding10),
                        _buildInformation(context),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
