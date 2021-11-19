// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class MilestoneSkeletonWidget extends StatelessWidget {
  const MilestoneSkeletonWidget({
    Key? key,
  }) : super(key: key);

  static const defaultHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: MediaQuery.of(context).size.width - sidePadding * 2,
        height: defaultHeight,
        decoration: BoxDecoration(
          color: lightestGreyColor,
          borderRadius: borderRadius12,
        ),
      ),
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
    );
  }
}
