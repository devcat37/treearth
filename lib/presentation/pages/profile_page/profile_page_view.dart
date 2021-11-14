// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/user_state/user_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/app_bar/tree_app_bar.dart';
import 'package:treearth/presentation/global/icons/tree_icon.dart';
import 'package:treearth/presentation/global/icons/tree_icons.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  UserState get userState => service<UserState>();

  Widget _buildVolunteerPlate(BuildContext context) {
    return Container(
      height: 28.0,
      width: 72.0,
      decoration: BoxDecoration(
        borderRadius: borderRadius12,
        gradient: LinearGradient(
          colors: notificationBackgroundPositiveGradient,
        ),
      ),
      child: Center(
        child: Text(
          'ВОЛОНТЕР',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 10.0, fontWeight: FontWeight.bold, color: semiDarkGreenColor),
        ),
      ),
    );
  }

  Widget _buildBecomeVolunteerPlate(BuildContext context) {
    return Container(
      height: 28.0,
      width: 121.0,
      decoration: BoxDecoration(
        borderRadius: borderRadius12,
        gradient: LinearGradient(
          colors: notificationBackgroundWarningGradient,
        ),
      ),
      child: Center(
        child: Text(
          'СТАТЬ ВОЛОНТЕРОМ',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 10.0, fontWeight: FontWeight.bold, color: semiDarkOrangeColor.withOpacity(0.8)),
        ),
      ),
    );
  }

  Widget _buildSettingsButton(BuildContext context) {
    return TreeIcon(
      onPressed: () => goToSettingsPage(context),
      icon: TreeIcons.settings,
    );
  }

  Widget _buildUserImage(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: minimalLightGreyColor,
      ),
      child: Image.asset('assets/profile/smiles/smiling-face-with-sunglasses.png'),
    );
  }

  Widget _buildUserName(BuildContext context) {
    return Text(
      'Егор Федоров',
      style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20.0),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildUserRank(BuildContext context) {
    return Text(
      'Новенький',
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16.0, color: lightGreyColor),
    );
  }

  Widget _buildProfileInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUserImage(context),
          const SizedBox(width: sidePadding18),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserName(context),
                const SizedBox(height: sidePadding4),
                _buildUserRank(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TreeAppBar(
        title: 'Профиль',
        canPop: false,
        actions: [
          userState.user!.isVolunteer ? _buildVolunteerPlate(context) : _buildBecomeVolunteerPlate(context),
          _buildSettingsButton(context),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: sidePadding12, bottom: sidePadding),
        child: Column(
          children: [
            _buildProfileInformation(context),
          ],
        ),
      ),
    );
  }
}
