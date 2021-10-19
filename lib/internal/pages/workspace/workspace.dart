// Flutter imports:
import 'package:flutter/material.dart' hide BottomAppBar;

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/bottom_app_bar/botom_app_bar_item.dart';
import 'package:treearth/presentation/global/bottom_app_bar/bottom_app_bar.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key}) : super(key: key);

  @override
  _WorkspaceState createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  static const _initialPage = 0;

  final PageController _pageController = PageController(initialPage: _initialPage);
  int _currentIndex = 0;

  Map<BottomAppBarItem, Widget> itemToPage(BuildContext context) {
    return {
      BottomAppBarItem(
        icon: TreeIcons.lotus,
        activeIcon: TreeIcons.so_lotus,
        activeColor: lightGreenColor,
      ): Scaffold(
        backgroundColor: lightGreenColor,
      ),
      BottomAppBarItem(
        icon: TreeIcons.earth,
        activeIcon: TreeIcons.so_earth,
        activeColor: lightBlueColor,
      ): Scaffold(
        backgroundColor: lightBlueColor,
      ),
      BottomAppBarItem(
        icon: TreeIcons.map,
        activeIcon: TreeIcons.so_map,
        activeColor: lightOrangeColor,
      ): Scaffold(
        backgroundColor: lightOrangeColor,
      ),
      BottomAppBarItem(
        icon: TreeIcons.person,
        activeIcon: TreeIcons.so_person,
        activeColor: lightPurpleColor,
      ): Scaffold(
        backgroundColor: lightPurpleColor,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: itemToPage(context).values.toList(),
          ),
          BottomAppBar(
            currentIndex: _currentIndex,
            items: itemToPage(context).keys.toList(),
            onPressed: (index) {
              if (index != _currentIndex) {
                setState(() {
                  if ((_currentIndex - index).abs() > 1) {
                    _pageController.jumpToPage(index);
                  } else {
                    _pageController.animateToPage(
                      index,
                      duration: halfASecond * 0.5,
                      curve: Curves.decelerate,
                    );
                  }

                  _currentIndex = index;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
