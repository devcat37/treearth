// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:treearth/internal/services/app_redirects.dart';
import 'package:treearth/internal/utils/infrastructure.dart';
import 'package:treearth/presentation/global/tree_button/tree_button.dart';

enum DialogType { singleButton, multipleButton }

class TreeDialog extends StatelessWidget {
  const TreeDialog({
    Key? key,
    required this.title,
    required this.content,
    this.successButtonTitle,
    this.cancelButtonTitle,
    this.onSuccessPressed,
    this.onCancelPressed,
    this.themeColor,
    this.type = DialogType.multipleButton,
  }) : super(key: key);

  const TreeDialog.logout({
    Key? key,
    this.onSuccessPressed,
    this.onCancelPressed,
  })  : title = 'Выход из аккаунта',
        content = 'Вы действительно хотите выйти из аккаунта?',
        successButtonTitle = 'Выйти',
        cancelButtonTitle = null,
        themeColor = null,
        type = DialogType.multipleButton;

  const TreeDialog.newPlantSpot({
    Key? key,
    this.onSuccessPressed,
    this.onCancelPressed,
    this.themeColor,
  })  : title = 'Создание заявки',
        content =
            'Вы можете создать заявку на озеленение в этой точке. Для этого вам нужно будет прикрепить фотографию местности и выбрать растение, которое вы желаете посадить',
        successButtonTitle = 'Создать заявку',
        cancelButtonTitle = null,
        type = DialogType.multipleButton;

  final String title;
  final String content;

  final String? successButtonTitle;
  final String? cancelButtonTitle;

  final DialogType type;

  final Function()? onSuccessPressed;
  final Function()? onCancelPressed;

  final Color? themeColor;

  Widget _buildButtons(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final buttonWidth = (constraints.maxWidth - sidePadding12) / 2;
      return Container(
        height: 40.0,
        child: Row(
          mainAxisAlignment:
              type == DialogType.multipleButton ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            if (type == DialogType.multipleButton)
              TreeButton.outlined(
                onPressed: () {
                  if (onCancelPressed != null) {
                    return onCancelPressed!();
                  }
                  return pop(context);
                },
                height: 40.0,
                width: buttonWidth,
                title: cancelButtonTitle ?? 'Отмена',
                color: themeColor,
              ),
            TreeButton(
              onPressed: () {
                if (onSuccessPressed != null) {
                  return onSuccessPressed!();
                }
                return pop(context);
              },
              height: 40.0,
              width: buttonWidth,
              title: successButtonTitle ?? 'Да',
              titleColor: whiteColor,
              color: themeColor,
            )
          ],
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20.0),
        ),
        const SizedBox(height: sidePadding12),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: lightGreyTextColor),
        ),
        const SizedBox(height: sidePadding),
        _buildButtons(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dialog(
            shape: RoundedRectangleBorder(borderRadius: borderRadius16),
            child: Padding(
              padding: const EdgeInsets.all(sidePadding),
              child: _buildContent(context),
            ),
          ),
        ],
      ),
    );
  }
}
