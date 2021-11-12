// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/spot/trash_spot.dart';
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/utils/infrastructure.dart';

class TrashSpotContainer extends StatelessWidget {
  const TrashSpotContainer({
    Key? key,
    required this.trash,
    this.onPressed,
  }) : super(key: key);

  static const defaultHeight = 112.0;

  final TrashSpot trash;
  final Function()? onPressed;

  Future<String?> _getObjectLocationName() async {
    if (trash.placemark == null) {
      final locationName = await adressByLocation(trash.position);
      trash.placemark = locationName;
    }
    return trash.placemark?.street ?? trash.placemark?.locality;
  }

  Widget _buildImage(BuildContext context) {
    return Hero(
      tag: trash.id,
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: greyTextColor.withOpacity(0.25),
          borderRadius: borderRadius12,
          image: DecorationImage(
            image: NetworkImage(trash.imageUrl),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Загрязненность',
          style: style.copyWith(color: lightGreyTextColor, letterSpacing: 1.1),
        ),
        const SizedBox(height: sidePadding2),
        Text(
          'Высокая',
          style: style.copyWith(color: notificationTextNegativeColor),
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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius12,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius12,
          child: Container(
            height: defaultHeight,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [whiteColor.withOpacity(0.0), semiDarkOrangeColor.withOpacity(0.1)],
              ),
              borderRadius: borderRadius12,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: sidePadding14, top: sidePadding14, bottom: sidePadding14, right: sidePadding8),
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
          ),
        ),
      ),
    );
  }
}
