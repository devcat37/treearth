// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class CarouselProgress extends StatelessWidget {
  const CarouselProgress({
    Key? key,
    required this.pagesCount,
    required this.currentPage,
  }) : super(key: key);

  static const defaultSize = 10.0;

  final int pagesCount;
  final int currentPage;

  Widget _buildProgressCircle(BuildContext context, {bool isActive = false}) {
    return AnimatedContainer(
      duration: defaultAnimationDuration,
      height: defaultSize,
      width: defaultSize,
      decoration: BoxDecoration(
        color: isActive ? lightGreenColor : lightGreyColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pagesCount, (index) {
        final isActive = index == currentPage;

        if (index != pagesCount - 1)
          return Row(
            children: [
              _buildProgressCircle(context, isActive: isActive),
              const SizedBox(width: sidePadding6),
            ],
          );
        return _buildProgressCircle(context, isActive: isActive);
      }),
    );
  }
}
