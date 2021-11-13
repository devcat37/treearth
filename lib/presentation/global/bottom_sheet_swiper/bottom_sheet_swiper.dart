// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class BottomSheetSwiper extends StatelessWidget {
  const BottomSheetSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: borderRadius2,
      ),
    );
  }
}
