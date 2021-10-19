// Flutter imports:
import 'package:flutter/material.dart' hide BottomAppBar;

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/bottom_app_bar/botom_app_bar_item.dart';
import 'package:treearth/presentation/global/bottom_app_bar/bottom_app_bar.dart';

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
      BottomAppBarItem(icon: Icons.add, activeIcon: Icons.ac_unit): Scaffold(
        backgroundColor: Colors.red,
      ),
      BottomAppBarItem(icon: Icons.home, activeIcon: Icons.ac_unit_sharp): Scaffold(
        backgroundColor: Colors.green,
      ),
      BottomAppBarItem(icon: Icons.home, activeIcon: Icons.ac_unit_sharp): Scaffold(
        backgroundColor: Colors.blue,
      ),
      BottomAppBarItem(icon: Icons.home, activeIcon: Icons.ac_unit_sharp): Scaffold(
        backgroundColor: Colors.yellow,
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
