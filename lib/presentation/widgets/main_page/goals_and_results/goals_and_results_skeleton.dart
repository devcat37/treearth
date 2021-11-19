// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:treearth/domain/mocks/mock_milestones.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/widgets/main_page/goals_and_results/milestone_skeleton_widget.dart';

class GoalsAndResultsSkeleton extends StatelessWidget {
  const GoalsAndResultsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            child: Container(
              height: 28.0,
              width: 226.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: borderRadius6,
              ),
            ),
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
          ),
          const SizedBox(height: sidePadding32),
          ...allMockMilestones
              .map(
                (e) => Padding(padding: const EdgeInsets.only(bottom: sidePadding16), child: MilestoneSkeletonWidget()),
              )
              .toList()
        ],
      ),
    );
  }
}
