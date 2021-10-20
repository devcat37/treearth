// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/carousel_progress/carousel_progress.dart';
import 'package:treearth/presentation/widgets/main_page/banners/tree_banner_widget.dart';

class TreeBanners extends StatefulWidget {
  const TreeBanners({
    Key? key,
    required this.banners,
  }) : super(key: key);

  final List<TreeBannerWidget> banners;

  @override
  State<TreeBanners> createState() => _TreeBannersState();
}

class _TreeBannersState extends State<TreeBanners> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: TreeBannerWidget.defaultBannerHeight + sidePadding12 + sidePadding10,
      child: Column(
        children: [
          CarouselSlider(
            items: widget.banners,
            options: CarouselOptions(
                height: TreeBannerWidget.defaultBannerHeight,
                autoPlay: true,
                enlargeCenterPage: true,

                // Callback при смене элемента в carousel.
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
          const SizedBox(height: sidePadding12),
          CarouselProgress(
            pagesCount: widget.banners.length,
            currentPage: _currentIndex,
          ),
        ],
      ),
    );
  }
}
