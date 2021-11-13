// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/banner/tree_banner.dart';
import 'package:treearth/presentation/pages/banner_page/banner_page_view.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({
    Key? key,
    required this.banner,
  }) : super(key: key);

  static const routeName = '/banner-page';

  final TreeBanner banner;

  @override
  Widget build(BuildContext context) {
    return BannerPageView(banner: banner);
  }
}
