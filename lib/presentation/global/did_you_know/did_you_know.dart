// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class DidYouKnow extends StatelessWidget {
  const DidYouKnow({Key? key}) : super(key: key);

  static const heroTag = 'DidYouKnowHeroTag';

  Widget _buildFactAboutPlantsText(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(colors: greenGradient1).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sidePadding24 * 2),
        child: Text(
          'Что деревья выделяют фитонциды',
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/splash/trees.svg'),
        Text(
          'А ты знал?',
          style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: sidePadding6),
        _buildFactAboutPlantsText(context),
      ],
    );
  }
}
