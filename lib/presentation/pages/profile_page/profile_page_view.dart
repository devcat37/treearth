// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Профиль',
      ),
    );
  }
}
