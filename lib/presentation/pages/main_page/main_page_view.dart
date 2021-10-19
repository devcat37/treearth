// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Главная',
      ),
    );
  }
}
