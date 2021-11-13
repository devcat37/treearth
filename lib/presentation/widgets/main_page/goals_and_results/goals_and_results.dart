// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class GoalsAndResults extends StatelessWidget {
  const GoalsAndResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sidePadding),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Цели и результаты',
              style: Theme.of(context).textTheme.headline3?.copyWith(color: blackColor),
            ),
          ),
        ],
      ),
    );
  }
}
