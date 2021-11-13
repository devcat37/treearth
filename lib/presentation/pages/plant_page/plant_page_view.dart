// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/static_map_at_object/static_map_at_object.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';
import 'package:treearth/presentation/global/tree_carousel/tree_carousel.dart';
import 'package:treearth/presentation/widgets/plant_page/donators_list.dart';

class PlantPageView extends StatelessWidget {
  const PlantPageView({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantSpot plant;

  Widget _buildDefaultImagePlate(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius12,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          height: 30.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: borderRadius12,
            gradient: LinearGradient(
              colors: [whiteColor.withOpacity(0.1), notificationBackgroundWarningColor.withOpacity(0.2)],
            ),
          ),
          child: Center(
            child: Text(
              'Стандартное\nИзображение'.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: whiteColor,
                    fontSize: 8.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlantTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Посадите растение:\n',
              style: Theme.of(context).textTheme.headline3!.copyWith(color: blackColor),
            ),
            TextSpan(
              text: plant.title,
              style: Theme.of(context).textTheme.headline3!.copyWith(color: lightGreenColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlantSubtitle(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(height: 20 / 14);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: style.copyWith(color: lightGreyTextColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: plant.id,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius12,
              image: DecorationImage(
                image: NetworkImage(plant.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // if (plant.imageUrl == defaultPlantImage)
        //   Positioned(
        //     top: sidePadding16,
        //     right: sidePadding16,
        //     child: _buildDefaultImagePlate(context),
        //   ),
      ],
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return TreeCarousel(
      items: [
        _buildImage(context),
        StaticMapAtObject(
          position: plant.position,
          allowScrolling: false,
        ),
      ],
    );
  }

  Widget _buildBottomDonatePlate(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 80.0 + MediaQuery.of(context).padding.bottom,
          color: buttonTextColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: sidePadding28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DonatorsList(),
              _buildDonateButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDonateButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 100.0,
        height: 48.0,
        decoration: BoxDecoration(
          color: semiDarkGreenColor,
          borderRadius: borderRadius12,
        ),
        child: Center(
          child: Text(
            'DONATE',
            style: Theme.of(context).textTheme.button!.copyWith(color: whiteColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Посадить дерево',
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: sidePadding8),
                _buildCarousel(context),
                const SizedBox(height: sidePadding12),
                _buildPlantTitle(context),
                const SizedBox(height: sidePadding16),
                _buildPlantSubtitle(context),
              ],
            ),
          ),
          _buildBottomDonatePlate(context),
        ],
      ),
    );
  }
}
