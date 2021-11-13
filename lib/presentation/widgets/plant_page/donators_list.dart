// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class DonatorsList extends StatelessWidget {
  const DonatorsList({Key? key}) : super(key: key);

  static const _defaultImageSize = 40.0;

  Widget _buildDonatorsImages(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < 4; i++) {
      children.add(
        Row(
          children: [
            SizedBox(width: (4 - 1 - i) * _defaultImageSize / 1.5),
            Container(
              height: _defaultImageSize,
              width: _defaultImageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: darkGreyColor,
                border: Border.all(color: buttonTextColor, width: 1.0),
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.centerLeft,
      children: children,
    );
  }

  Widget _builAdditionalDonatorsCount(BuildContext context) {
    return Text(
      '+14',
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: darkGreyColor, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildDonatorsImages(context),
        const SizedBox(width: sidePadding8),
        _builAdditionalDonatorsCount(context),
      ],
    );
  }
}
