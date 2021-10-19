// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/icons/tree_icon.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';
import 'package:treearth/presentation/widgets/main_page/banners/tree_banner_widget.dart';
import 'package:treearth/presentation/widgets/main_page/banners/tree_banners.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  Widget _buildNotificationsButton(BuildContext context) {
    return TreeIcon(
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => Scaffold(
                appBar: TreeAppBar(
                  title: 'Уведомления',
                ),
              ))),
      icon: TreeIcons.notifications,
      size: sidePadding28,
      // Искуственно поворачивает иконку уведомлений на 15 градусов.
      rotationAngle: degreeToRadian(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Главная',
        actions: [
          _buildNotificationsButton(context),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: sidePadding8),
              TreeBanners(
                banners: [
                  TreeBannerWidget(),
                  TreeBannerWidget(),
                  TreeBannerWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
