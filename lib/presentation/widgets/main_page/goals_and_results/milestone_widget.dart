// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/domain/models/milestone/milestone.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';

class MilestoneWidget extends StatefulWidget {
  const MilestoneWidget({
    Key? key,
    required this.milestone,
  }) : super(key: key);

  final Milestone milestone;

  static const defaultHeight = 50.0;

  @override
  State<MilestoneWidget> createState() => _MilestoneWidgetState();
}

class _MilestoneWidgetState extends State<MilestoneWidget> {
  bool _isExpanded = false;

  Widget _buildIcon(BuildContext context) {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        color: widget.milestone.type == MilestoneType.goal
            ? semiDarkYellowColor.withOpacity(0.2)
            : semiDarkGreenColor.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          widget.milestone.type == MilestoneType.goal ? TreeIcons.warning : Icons.done,
          size: 18.0,
          color:
              widget.milestone.type == MilestoneType.goal ? semiDarkYellowColor.withOpacity(0.5) : semiDarkGreenColor,
        ),
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: defaultAnimationDuration,
          height: _isExpanded ? 5.0 : 0.0,
          width: 200.0,
          decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: borderRadius2,
          ),
        ),
        AnimatedContainer(
          duration: defaultAnimationDuration,
          height: _isExpanded ? 5.0 : 0.0,
          width: 200 * (widget.milestone.reached / widget.milestone.toReach),
          decoration: BoxDecoration(
            color:
                widget.milestone.type == MilestoneType.goal ? semiDarkYellowColor.withOpacity(0.5) : semiDarkGreenColor,
            borderRadius: borderRadius2,
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: sidePadding16, right: sidePadding16, top: sidePadding10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.milestone.content,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      color: widget.milestone.type == MilestoneType.goal
                          ? notificationTextWarningColor
                          : notificationTextPositiveColor,
                    ),
              ),
              _buildIcon(context),
            ],
          ),
          const SizedBox(height: sidePadding6),
          _buildProgressBar(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        _isExpanded = !_isExpanded;
      }),
      child: AnimatedContainer(
        duration: defaultAnimationDuration,
        width: MediaQuery.of(context).size.width - sidePadding * 2,
        height: _isExpanded ? MilestoneWidget.defaultHeight + 17.0 : MilestoneWidget.defaultHeight,
        decoration: BoxDecoration(
          color: lightestGreyColor,
          borderRadius: borderRadius12,
        ),
        child: _buildContent(context),
      ),
    );
  }
}
