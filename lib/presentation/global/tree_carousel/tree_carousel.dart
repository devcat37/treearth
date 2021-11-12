// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/carousel_progress/carousel_progress.dart';

class TreeCarousel extends StatefulWidget {
  const TreeCarousel({
    Key? key,
    this.items = const [],
    this.activeDotColor = lightGreenColor,
  }) : super(key: key);

  final List<Widget> items;
  final Color activeDotColor;

  @override
  _TreeCarouselState createState() => _TreeCarouselState();
}

class _TreeCarouselState extends State<TreeCarousel> {
  final PageController controller = PageController();

  int _currentIndex = 0;

  Widget _buildCarousel(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: sidePadding),
        decoration: BoxDecoration(
          borderRadius: borderRadius12,
          color: greyTextColor,
        ),
        child: ClipRRect(
          borderRadius: borderRadius12,
          child: PageView(
            controller: controller,
            children: widget.items,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarousel(context),
        const SizedBox(height: sidePadding12),
        SmoothPageIndicator(
          controller: controller,
          count: widget.items.length,
          effect: WormEffect(
            activeDotColor: widget.activeDotColor,
            dotColor: lightGreyColor,
            dotHeight: CarouselProgress.defaultSize,
            dotWidth: CarouselProgress.defaultSize,
            spacing: sidePadding6,
          ),
        ),
      ],
    );
  }
}
