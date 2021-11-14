// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_mobx/flutter_mobx.dart';

// Project imports:
import 'package:treearth/domain/models/spot/plant_spot.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/donation_state/donation_state.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';
import 'package:treearth/presentation/global/tree_slider/tree_slider.dart';

class PlantDonationPage extends StatefulWidget {
  const PlantDonationPage({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final PlantSpot plant;

  @override
  State<PlantDonationPage> createState() => _PlantDonationPageState();
}

class _PlantDonationPageState extends State<PlantDonationPage> {
  DonationState get donationState => service<DonationState>();

  double _value = 0.0;

  Widget _buildOneTimeDonationButton(BuildContext context) {
    return Observer(
      builder: (_) => TreeButton(
        onPressed: () => donationState.changeDonationType(DonationType.oneTime),
        height: 40.0,
        width: (MediaQuery.of(context).size.width - sidePadding * 3) / 2,
        title: 'Единовременно',
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
        titleColor: donationState.type == DonationType.oneTime ? whiteColor : blackColor,
        isOutlined: donationState.type == DonationType.oneTime ? false : true,
      ),
    );
  }

  Widget _buildMonthlyDonationButton(BuildContext context) {
    return Observer(
      builder: (_) => TreeButton(
        onPressed: () => donationState.changeDonationType(DonationType.monthly),
        height: 40.0,
        width: (MediaQuery.of(context).size.width - sidePadding * 3) / 2,
        title: 'Ежемесячно',
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
        isOutlined: donationState.type == DonationType.monthly ? false : true,
        titleColor: donationState.type == DonationType.monthly ? whiteColor : blackColor,
      ),
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                text: 'Сумма: ',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: greyTextColor, fontWeight: FontWeight.bold, letterSpacing: 1.1),
              ),
              TextSpan(
                text: '${(5000 * _value).toInt()}₽',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: darkGreyColor, fontFamily: 'Inter', fontWeight: FontWeight.bold, letterSpacing: 1.1),
              ),
            ]),
          ),
        ),
        const SizedBox(height: sidePadding6),
        TreeSlider(
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
        const SizedBox(height: sidePadding6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0₽',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: darkGreyColor, fontFamily: 'Inter', fontWeight: FontWeight.bold),
            ),
            Text(
              '5000₽',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: darkGreyColor, fontFamily: 'Inter', fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(sidePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Способ поддержки',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: greyTextColor, fontWeight: FontWeight.bold, letterSpacing: 1.1),
                  ),
                ),
                const SizedBox(height: sidePadding12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildOneTimeDonationButton(context),
                    _buildMonthlyDonationButton(context),
                  ],
                ),
                const SizedBox(height: sidePadding32),
                _buildSlider(context),
                const SizedBox(height: sidePadding32),
                TreeButton(
                  onPressed: () {},
                  height: 40.0,
                  width: MediaQuery.of(context).size.width - sidePadding * 2,
                  title: 'Пожертвовать',
                  titleColor: whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
