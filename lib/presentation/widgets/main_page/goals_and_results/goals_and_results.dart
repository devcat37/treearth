// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/milestone/milestone.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/widgets/main_page/goals_and_results/milestone_widget.dart';

class GoalsAndResults extends StatelessWidget {
  const GoalsAndResults({
    Key? key,
    this.goalsAndResults = const [],
  }) : super(key: key);

  final List<Milestone> goalsAndResults;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Цели и результаты',
              style: Theme.of(context).textTheme.headline3?.copyWith(color: blackColor),
            ),
          ),
          const SizedBox(height: sidePadding32),
          ...goalsAndResults
              .map(
                (e) => Padding(
                    padding: const EdgeInsets.only(bottom: sidePadding16), child: MilestoneWidget(milestone: e)),
              )
              .toList()
        ],
      ),
    );
  }
}
