// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/create_spot_state/create_spot_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/static_map_at_object/static_map_at_object.dart';
import 'package:treearth/presentation/global/tree_carousel/tree_carousel.dart';

class CreateSpotPageView extends StatelessWidget {
  const CreateSpotPageView({
    Key? key,
  }) : super(key: key);

  CreateSpotState get state => service<CreateSpotState>();

  Widget _buildImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: borderRadius12,
      ),
      child: Center(
        child: Icon(
          Icons.camera_alt,
          size: 100.0,
          color: blackColor.withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return TreeCarousel(
      activeDotColor: state.type == MapObjectType.trash ? semiDarkOrangeColor : semiDarkGreenColor,
      items: [
        _buildImage(context),
        StaticMapAtObject(
          position: state.position,
          allowScrolling: false,
          objectType: state.type,
        ),
      ],
    );
  }

  Widget _buildSpotLocationName(BuildContext context) {
    final locationName = adressByLocation(state.position);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Расположение',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: greyTextColor, letterSpacing: 1.1)),
          const SizedBox(height: sidePadding4),
          FutureBuilder(
            future: locationName,
            builder: (context, AsyncSnapshot<Placemark?> data) {
              final location = data.data;

              final regionName = (location?.country ?? '').isNotEmpty ? location?.country : 'Неустановлено';
              final cityName = (location?.locality ?? '').isNotEmpty ? location?.locality : 'Неустановлено';
              final streetName = (location?.street ?? '').isNotEmpty ? location?.street : 'Неустановлено';

              return Text(
                '$regionName, $cityName, $streetName',
                style: Theme.of(context).textTheme.bodyText1!,
                maxLines: 2,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Создание заявки',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCarousel(context),
          const SizedBox(height: sidePadding10),
          _buildSpotLocationName(context),
        ],
      ),
    );
  }
}
