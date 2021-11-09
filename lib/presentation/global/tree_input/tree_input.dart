// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/utils/infrastructure.dart';

class TreeInput extends StatelessWidget {
  const TreeInput({
    Key? key,
    this.title,
    this.hintText,
    this.width,
    this.autoFocus = false,
    this.controller,
    this.keyboardType = TextInputType.name,
  }) : super(key: key);

  static const defaultHeight = 70.0;
  static const inputDefaulthHeight = 50.0;

  final double? width;
  final String? title;
  final String? hintText;
  final bool autoFocus;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: sidePadding),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: greyTextColor, fontSize: 14.0),
            ),
          ),
          const SizedBox(height: sidePadding5),
        ],
        Container(
          height: inputDefaulthHeight,
          width: width ?? (MediaQuery.of(context).size.width - sidePadding32 * 2),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: borderRadius12,
            border: Border.all(width: 2.0, color: semiDarkGreenColor),
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            autofocus: autoFocus,
            controller: controller,
            style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400, fontFamily: 'Inter'),
            cursorColor: lightGreenColor,
            cursorHeight: 28.0,
            decoration: InputDecoration(
              hintText: hintText ?? title ?? 'Текстовое поле',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: sidePadding),
            ),
          ),
        ),
      ],
    );
  }
}
