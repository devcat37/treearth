// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

// Project imports:
import 'package:treearth/domain/models/banner/tree_banner.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/sliver_page_wrapper/sliver_page_wrapper.dart';

class BannerPageView extends StatelessWidget {
  const BannerPageView({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final TreeBanner banner;

  Widget _buildImage(BuildContext context, Uri uri, String? description, String? altText) {
    return Padding(
      padding: const EdgeInsets.only(top: sidePadding4, bottom: sidePadding16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 190.0,
            decoration: BoxDecoration(
              borderRadius: borderRadius12,
              image: DecorationImage(
                image: NetworkImage(uri.toString()),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(8, 8),
                  color: blackColor.withOpacity(0.15),
                  blurRadius: 16.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPageWrapper(
      headerImage: banner.asset,
      title: banner.title,
      content: Padding(
        padding: const EdgeInsets.only(left: sidePadding, right: sidePadding, bottom: sidePadding),
        child: MarkdownBody(
          styleSheet: MarkdownStyleSheet(
            h1: Theme.of(context).textTheme.headline3!.copyWith(color: blackColor, letterSpacing: 1.5),
            h1Padding: const EdgeInsets.only(),
            p: Theme.of(context).textTheme.bodyText1!.copyWith(color: greyPTextColor),
            pPadding: const EdgeInsets.only(bottom: sidePadding4),
          ),
          data: '''
# Сколько мусора мы производим?
Страшно подумать, но всё, что вас окружает рано или поздно превратится в мусор. Один человек производит от 400 до 500 килограммов мусора ежегодно: пластиковые пакеты, стекло, бумага, батарейки, даже бытовая техника и мебель, – всё, что стало лишним или устарело. 500 человек оставят после себя столько отходов, что они смогут заполнить доверху целый поезд метрополитена. 

# Как отходы отравляют наше будущее и настоящее?

Можем ли мы избавиться от мусора навсегда?
Выводы ученых показывают, что нет. Отходы, которые мы отправили на свалку, возвращаются в виде загрязняющих веществ. Продукты распада не только отравляют почву и воду рядом с мусорными полигонами. В виде мельчайших частиц и газов они становятся аллергенами и вредят непосредственно нам и нашим детям. Еще сильнее страдают птицы и животные. На земле, загрязненной бытовыми или промышленными отходами, никогда не будет собран безопасный урожай. И чем больше территории займут новые мусорные полигоны, тем дороже будет чистая земля, а значит – и наша будущая пища.

# Что можно сделать уже сегодня?

Что же мы можем предпринять? Уже сейчас каждый из нас может уменьшить объём мусора, если поддержит проекты по его сортировке и переработке. Второй важный шаг – это отказ от приобретения товаров одноразового использования. Их видимая дешевизна скрывает долговременные и страшные последствия.
          ''',
          extensionSet: md.ExtensionSet(
            md.ExtensionSet.gitHubFlavored.blockSyntaxes,
            [md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
          ),
          imageBuilder: (uri, description, alt) => _buildImage(context, uri, description, alt),
        ),
      ),
    );
  }
}
