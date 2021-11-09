// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';

class TreeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TreeAppBar({
    Key? key,
    this.title,
    this.backgroundColor = Colors.transparent,
    this.contentColor = blackColor,
    this.actions,
    this.canPop = true,
  }) : super(key: key);

  final String? title;
  final Color? backgroundColor;
  final Color? contentColor;
  final bool canPop;
  final List<Widget>? actions;

  @override
  _TreeAppBarState createState() => _TreeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TreeAppBarState extends State<TreeAppBar> {
  static const _appBarHeroTag = 'AppBarHeroTag';

  Widget _buildRowWrapper(BuildContext context, {Widget? child}) {
    return Container(
      height: kToolbarHeight * 1.5,
      color: widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: sidePadding, right: sidePadding),
        child: child,
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Row(
      children: [
        InkResponse(
          onTap: () => pop(context),
          child: Icon(
            TreeIcons.left_md,
            color: widget.contentColor,
          ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (canPop(context) && widget.canPop) _buildBackButton(context),
              if (widget.title != null)
                Hero(
                  tag: _appBarHeroTag,
                  child: Text(
                    widget.title!,
                    style: Theme.of(context).textTheme.headline3?.copyWith(color: widget.contentColor),
                  ),
                )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: widget.actions ?? [],
          ),
        ],
      ),
    );
  }
}
