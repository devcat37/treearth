// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/helpers.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/banners_state/banners_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/icons/tree_icon.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';
import 'package:treearth/presentation/widgets/main_page/banners/tree_banner_widget.dart';
import 'package:treearth/presentation/widgets/main_page/banners/tree_banners.dart';
import 'package:treearth/presentation/widgets/main_page/banners/tree_banners_skeleton.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  BannersState get bannersState => service<BannersState>();

  Widget _buildNotificationsButton(BuildContext context) {
    return TreeIcon(
      onPressed: () => goToNotificationsPage(context),
      icon: TreeIcons.notifications,
      size: sidePadding28,

      // Искуственно поворачивает иконку уведомлений на 15 градусов.
      rotationAngle: degreeToRadian(15),
    );
  }

  Widget _buildBanners(BuildContext context) {
    return Observer(builder: (context) {
      if (bannersState.isLoading) return const TreeBannersSkeleton();
      final banners = bannersState.banners.map((e) => TreeBannerWidget(banner: e)).toList();

      return TreeBanners(banners: banners);
    });
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
              _buildBanners(context),
            ],
          ),
        ),
      ),
    );
  }
}
