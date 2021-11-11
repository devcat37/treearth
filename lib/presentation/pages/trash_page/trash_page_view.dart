// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/static_map_at_object/static_map_at_object.dart';
import 'package:treearth/presentation/global/tree_carousel/tree_carousel.dart';

class TrashPageView extends StatelessWidget {
  const TrashPageView({
    Key? key,
    required this.trash,
  }) : super(key: key);

  final TrashSpot trash;

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: trash.id,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius12,
              image: DecorationImage(
                image: NetworkImage(trash.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return TreeCarousel(
      activeDotColor: semiDarkOrangeColor,
      items: [
        _buildImage(context),
        StaticMapAtObject(
          position: trash.position,
          allowScrolling: false,
          objectType: MapObjectType.trash,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Убрать мусор',
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: sidePadding8),
            _buildCarousel(context),
            const SizedBox(height: sidePadding12),
          ],
        ),
      ),
    );
  }
}
