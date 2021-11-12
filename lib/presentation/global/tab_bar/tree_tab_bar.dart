// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/tab_bar/tree_tab_bar_item.dart';
import 'package:treearth/presentation/global/tab_bar_controller/tree_tab_bar_controller.dart';

class TreeTabBar extends StatefulWidget {
  const TreeTabBar({
    Key? key,
    required this.items,
    required this.controller,
    this.onPageChanged,
  }) : super(key: key);

  static const defaultHeight = 56.0;

  final List<TreeTabBarItem> items;
  final TreeTabBarController controller;
  final Function(int)? onPageChanged;

  @override
  _TreeTabBarState createState() => _TreeTabBarState();
}

class _TreeTabBarState extends State<TreeTabBar> {
  @override
  void initState() {
    widget.controller.addListener(() {
      if (mounted) setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }

  Widget _buildItem(BuildContext context, {required int index, required String title, Color color = lightGreenColor}) {
    final style = Theme.of(context).textTheme.bodyText2!.copyWith(color: blackColor);
    final widgetSize = getTextWidgetSize(title, style);

    return GestureDetector(
      onTap: () {
        // Вызов callback'а при смене страницы.
        if (widget.onPageChanged != null && index != widget.controller.currentPage) widget.onPageChanged!(index);

        widget.controller.changePage(index);
      },
      child: Container(
        width: widgetSize.width + sidePadding16 * 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title, style: style),
            const SizedBox(height: sidePadding4),
            Container(
              width: double.infinity,
              height: sidePadding4,
              decoration: BoxDecoration(
                color: widget.controller.currentPage == index ? color : Colors.transparent,
                borderRadius: borderRadius2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TreeTabBar.defaultHeight,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: sidePadding24, left: sidePadding48, right: sidePadding48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              widget.items.length,
              (index) => _buildItem(
                context,
                index: index,
                title: widget.items.elementAt(index).title,
                color: widget.items.elementAt(index).activeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
