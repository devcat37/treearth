// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';

class TreeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TreeAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.transparent,
    this.contentColor = blackColor,
  }) : super(key: key);

  final String title;
  final Color? backgroundColor;
  final Color? contentColor;

  @override
  _TreeAppBarState createState() => _TreeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TreeAppBarState extends State<TreeAppBar> {
  Widget _buildRowWrapper(BuildContext context, {Widget? child}) {
    return Container(
      height: kToolbarHeight * 2,
      child: Padding(
        padding: const EdgeInsets.only(left: sidePadding, bottom: sidePadding12),
        child: child,
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Row(
      children: [
        Icon(
          TreeIcons.left_md,
          color: widget.contentColor,
        ),
        const SizedBox(width: sidePadding16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRowWrapper(
      context,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (canPop(context)) _buildBackButton(context),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline3?.copyWith(color: widget.contentColor),
          ),
        ],
      ),
    );
  }
}
