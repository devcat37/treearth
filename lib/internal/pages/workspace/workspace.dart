// Flutter imports:
import 'package:flutter/material.dart' hide BottomAppBar;

// Project imports:
import 'package:treearth/internal/pages/main_page/main_page.dart';
import 'package:treearth/internal/pages/profile_page/profile_page.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/main_page_state/main_page_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/bottom_app_bar/botom_app_bar_item.dart';
import 'package:treearth/presentation/global/bottom_app_bar/bottom_app_bar.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key}) : super(key: key);

  static const routeName = '/workspace';

  @override
  _WorkspaceState createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  static const _initialPage = 0;

  final PageController _pageController = PageController(initialPage: _initialPage);
  int _currentIndex = 0;

  @override
  void initState() {
    // Инициализация стейта главной страницы (баннеры и т.д).
    service<MainPageState>().initialize();

    super.initState();
  }

  Map<BottomAppBarItem, Widget> itemToPage(BuildContext context) {
    return {
      // Страница главная.
      BottomAppBarItem(
        icon: TreeIcons.lotus,
        activeIcon: TreeIcons.so_lotus,
        activeColor: lightGreenColor,
      ): const MainPage(),

      // Страница с картой объектов.
      BottomAppBarItem(
        icon: TreeIcons.earth,
        activeIcon: TreeIcons.so_earth,
        activeColor: lightBlueColor,
      ): Scaffold(
        backgroundColor: lightBlueColor,
      ),

      // Страница пока хз TODO!
      BottomAppBarItem(
        icon: TreeIcons.map,
        activeIcon: TreeIcons.so_map,
        activeColor: lightOrangeColor,
      ): Scaffold(
        backgroundColor: lightOrangeColor,
      ),

      // Страница профиля.
      BottomAppBarItem(
        icon: TreeIcons.person,
        activeIcon: TreeIcons.so_person,
        activeColor: lightPurpleColor,
      ): const ProfilePage(),
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
