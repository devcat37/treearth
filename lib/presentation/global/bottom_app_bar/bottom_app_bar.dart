// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/bottom_app_bar/botom_app_bar_item.dart';

class BottomAppBar extends StatefulWidget {
  const BottomAppBar({
    Key? key,
    this.currentIndex = 0,
    this.items = const [],
    this.onPressed,
  }) : super(key: key);

  static const defaultHeight = 116.0;

  final List<BottomAppBarItem> items;
  final int currentIndex;
  final Function(int)? onPressed;

  @override
  State<BottomAppBar> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBar> {
  double _itemPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = widget.items.isNotEmpty ? BottomAppBarItem.defaultWidth + sidePadding18 : null;
    final itemPadding = (screenWidth - widget.items.length * (itemWidth ?? 0)) / (widget.items.length + 1);

    return itemPadding;
  }

  /// Оболочка над item в bottom app bar.
  Widget _itemWrapper(BottomAppBarItem item) {
    return Container(
      height: BottomAppBarItem.defaultWidth + sidePadding18,
      width: BottomAppBarItem.defaultWidth + sidePadding18,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius32,
        child: InkResponse(
          onTap: () {
            // Calling onPressed callback.
            if (widget.onPressed != null) widget.onPressed!(widget.items.indexOf(item));
          },
          customBorder: const CircleBorder(),
          highlightColor: Colors.black12,
          splashColor: Colors.transparent,
          child: item,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BottomAppBar.defaultHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: radiusCircular32, topRight: radiusCircular32),
        color: whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: sidePadding18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (index) {
            final item = widget.items.elementAt(index);
            // При перерисовке ставим активность айтему.
            item.setActive(index == widget.currentIndex);

            final padding = index != widget.items.length - 1 ? _itemPadding(context) : 0.0;
            return Padding(
              padding: EdgeInsets.only(right: padding),
              child: _itemWrapper(item),
            );
          }),
        ),
      ),
    );
  }
}
