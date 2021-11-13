// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';
import 'package:treearth/presentation/global/tree_slider/tree_slider.dart';

class PlantSpotContainer extends StatelessWidget {
  const PlantSpotContainer({
    Key? key,
    required this.plant,
    this.onPressed,
  }) : super(key: key);

  final PlantSpot plant;
  final Function()? onPressed;

  static const defaultHeight = 156.0;

  Future<String?> _getObjectLocationName() async {
    if (plant.placemark == null) {
      final locationName = await adressByLocation(plant.position);
      plant.placemark = locationName;
    }
    return plant.placemark?.street ?? plant.placemark?.locality;
  }

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
        FutureBuilder(
          future: _getObjectLocationName(),
          builder: (_, AsyncSnapshot<String?> data) {
            return Text(
              data.data ?? 'Неустановлено',
              style: style.copyWith(color: darkGreyTextColor),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTopPart(BuildContext context) {
    return Padding(
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
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Column(
      children: [
        TreeSlider(
          value: 0.4,
          thumbSize: 14.0,
          thumbBorderColor: semiDarkGreenColor,
          thumbStripColor: whiteColor,
        ),
        const SizedBox(height: sidePadding2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Цель: ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 9.0, color: greyTextColor, fontWeight: FontWeight.bold, letterSpacing: 1.1),
                  ),
                  TextSpan(
                    text: '2000₽',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 9.0, color: darkGreyColor, fontFamily: 'Inter', fontWeight: FontWeight.bold),
                  )
                ],
              ),
              overflow: TextOverflow.fade,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Осталось: ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 9.0, color: greyTextColor, fontWeight: FontWeight.bold, letterSpacing: 1.1),
                  ),
                  TextSpan(
                    text: '${(2000 * (1 - 0.4)).toInt()}₽',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 9.0, color: darkGreyColor, fontFamily: 'Inter', fontWeight: FontWeight.bold),
                  )
                ],
              ),
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMoreButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Подробнее',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 10.0, color: darkGreyColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: sidePadding2),
        Icon(Icons.play_arrow_rounded, size: 18.0, color: darkGreyColor),
      ],
    );
  }

  Widget _buildBottomPart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: sidePadding14, right: sidePadding8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 170.0,
            child: _buildSlider(context),
          ),
          _buildMoreButton(context),
        ],
      ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTopPart(context),
                Spacer(),
                _buildBottomPart(context),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
