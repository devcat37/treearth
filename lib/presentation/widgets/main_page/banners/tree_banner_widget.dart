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

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Text(
        banner.subtitle.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: whiteColor, fontSize: 10.0, letterSpacing: 2.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Text(
        banner.title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: whiteColor, fontSize: 20.0, height: 24 / 20),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOverlayGradient(BuildContext context) {
    return Container(
      height: TreeBannerWidget.defaultBannerHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: borderRadius32,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            blackColor.withOpacity(0.6),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: borderRadius32,
      child: Ink(
        height: TreeBannerWidget.defaultBannerHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: borderRadius32,
            image: DecorationImage(
              image: AssetImage(banner.asset),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.15),
                blurRadius: 16.0,
                offset: Offset(12, 12),
              ),
            ]),
        child: Stack(
          children: [
            _buildOverlayGradient(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSubtitle(context),
                const SizedBox(height: sidePadding10),
                _buildTitle(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
