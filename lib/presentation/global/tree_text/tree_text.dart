// Flutter imports:
import 'package:flutter/material.dart';

class TreeText extends StatelessWidget {
  const TreeText(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;

  List<Widget> _dividedTextWidgets(BuildContext context) {
    final matches = RegExp(r'[0-9]+|[a-z]+|[A-Z]+').allMatches(text);
    final substrings = matches.map((e) => text.substring(e.start, e.end));

    return substrings.map((e) {
      final isDigit = num.tryParse(e) != null;
      final fontFamily = isDigit ? 'Inter' : 'Raleway';

      print(isDigit);
      return Text(
        e,
        style: style?.copyWith(fontFamily: fontFamily) ?? TextStyle(fontFamily: fontFamily),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: _dividedTextWidgets(context),
      ),
    );
  }
}
