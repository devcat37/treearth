// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/banner/tree_banner.dart';
import 'package:treearth/presentation/global/sliver_page_wrapper/sliver_page_wrapper.dart';

class BannerPageView extends StatelessWidget {
  const BannerPageView({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final TreeBanner banner;

  @override
  Widget build(BuildContext context) {
    return SliverPageWrapper(
      headerImage: banner.asset,
      title: banner.title,
    );
  }
}
