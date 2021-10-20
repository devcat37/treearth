// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/carousel_progress/carousel_progress.dart';
import 'package:treearth/presentation/widgets/main_page/banners/tree_banner_widget.dart';

class TreeBannersSkeleton extends StatelessWidget {
  const TreeBannersSkeleton({Key? key}) : super(key: key);

  Widget _buildBannerSkeleton(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: TreeBannerWidget.defaultBannerHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: borderRadius32,
        ),
      ),
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Количество скелетонов баннеров.
    const itemsCount = 3;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: TreeBannerWidget.defaultBannerHeight + sidePadding12 + sidePadding10,
      child: Column(
        children: [
          CarouselSlider(
            items: List.generate(itemsCount, (index) => _buildBannerSkeleton(context)),
            options: CarouselOptions(
              height: TreeBannerWidget.defaultBannerHeight,
              autoPlay: true,
              autoPlayInterval: aSecond,
              enlargeCenterPage: true,
            ),
          ),
          const SizedBox(height: sidePadding12),
          Shimmer.fromColors(
            child: CarouselProgress(
              pagesCount: itemsCount,
              currentPage: 0,
            ),
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
          ),
        ],
      ),
    );
  }
}
