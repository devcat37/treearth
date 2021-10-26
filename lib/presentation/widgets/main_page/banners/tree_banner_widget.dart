// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/banner/tree_banner.dart';
import 'package:treearth/internal/utils/infrastructure.dart';

class TreeBannerWidget extends StatelessWidget {
  const TreeBannerWidget({
    Key? key,
    required this.banner,
  }) : super(key: key);

  static const defaultBannerHeight = 180.0;

  final TreeBanner banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TreeBannerWidget.defaultBannerHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: borderRadius32,
      ),
    );
  }
}
