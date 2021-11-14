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
# Заголовок
Текст в несколько строчек, чтобы показать поведение текста.

![This is a alt text.](https://static.tildacdn.com/tild3062-6263-4536-a466-386535653733/027D3042-99B6-481E-9.jpeg "This is a sample image.")

# Заголовок
Текст в несколько строчек, чтобы показать поведение текста.

# Заголовок
Текст в несколько строчек, чтобы показать поведение текста.

![This is a alt text.](https://static.tildacdn.com/tild3062-6263-4536-a466-386535653733/027D3042-99B6-481E-9.jpeg "This is a sample image.")

# Заголовок
Текст в несколько строчек, чтобы показать поведение текста.

# Заголовок
Текст в несколько строчек, чтобы показать поведение текста.

![This is a alt text.](https://static.tildacdn.com/tild3062-6263-4536-a466-386535653733/027D3042-99B6-481E-9.jpeg "This is a sample image.")

# Заголовок
Текст в несколько строчек, чтобы показать поведение текста.
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
