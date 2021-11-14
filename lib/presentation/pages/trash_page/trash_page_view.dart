// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/static_map_at_object/static_map_at_object.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';
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

  Widget _buildTrashTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Согласись,\n',
              style: Theme.of(context).textTheme.headline3!.copyWith(color: semiDarkOrangeColor),
            ),
            TextSpan(
              text: 'выглядит неприятно?',
              style: Theme.of(context).textTheme.headline3!.copyWith(color: blackColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTrashSubtitle(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(height: 20 / 14);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:
                  'Помоги городу вместе с друзьями: очисти грязный объект, загрузи фото-отчет, и тогда картинка здесь поменяется на ',
              style: style.copyWith(color: lightGreyTextColor),
            ),
            TextSpan(
              text: 'привлекательную',
              style: style.copyWith(color: semiDarkOrangeColor),
            ),
            TextSpan(
              text: ', а в городе станет на одну грязную точку меньше!',
              style: style.copyWith(color: lightGreyTextColor),
            ),
          ],
        ),
      ),
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

  Widget _buildBottomPart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(sidePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TreeButton(
                width: (MediaQuery.of(context).size.width - 3 * sidePadding) / 2,
                height: 40.0,
                color: semiDarkOrangeColor,
                title: 'Фото-отчет',
                titleColor: whiteColor,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
              ),
              TreeButton.outlined(
                width: (MediaQuery.of(context).size.width - 3 * sidePadding) / 2,
                height: 40.0,
                color: semiDarkOrangeColor,
                title: 'Позвать друга',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: sidePadding8),
                _buildCarousel(context),
                const SizedBox(height: sidePadding12),
                _buildTrashTitle(context),
                const SizedBox(height: sidePadding16),
                _buildTrashSubtitle(context),
              ],
            ),
            _buildBottomPart(context),
          ],
        ),
      ),
    );
  }
}
