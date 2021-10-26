// Flutter imports:
import 'package:flutter/material.dart';

const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF000000);
const lightGreyColor = Color(0xFFDADADA);

const lightGreenColor = Color(0xFFA6D331);
const lightYellowColor = Color(0xFFFAE315);
const lightBlueColor = Color(0xFF85C4FF);
const lightOrangeColor = Color(0xFFFFB673);
const lightRedColor = Color(0xFFFA1515);
const lightPurpleColor = Color(0xFFB66DFF);

const semiDarkGreenColor = Color(0xFF8BB72D);
const semiDarkYellowColor = Color(0xFFFFC700);
const semiDarkRedColor = Color(0xFFCE1900);

const darkGreyColor = Color(0xFF5D5A58);

const notificationReadColor = Color(0xFFE39B47);

const buttonTextColor = Color(0xFFCDEA7A);

const notificationTextPositiveColor = Color(0xFF688C1C);
const notificationTextWarningColor = Color(0xFF635114);
const notificationTextNegativeColor = Color(0xFF8C231C);

const notificationIconPositiveColor = Color(0xFF9CD300);
const notificationIconWarningColor = Color(0xFFFF9900);
const notificationIconNegativeColor = Color(0xFFFF0000);

const notificationBackgroundPositiveColor = Color(0xFFB6E13D);
const notificationBackgroundWarningColor = Color(0xFFFFC700);
const notificationBackgroundNegativeColor = Color(0xFFCC0909);

final notificationIconPositiveGradient = [
  lightGreenColor.withOpacity(0.1),
  semiDarkGreenColor.withOpacity(0.3),
];

final notificationIconWarningGradient = [
  lightYellowColor.withOpacity(0.1),
  semiDarkYellowColor.withOpacity(0.3),
];

final notificationIconNegativeGradient = [
  lightRedColor.withOpacity(0.1),
  semiDarkRedColor.withOpacity(0.3),
];

/// Градиент уведомлений на фоне (зеленый).
final notificationBackgroundPositiveGradient = [
  whiteColor.withOpacity(0.0),
  notificationBackgroundPositiveColor.withOpacity(0.1)
];

/// Градиент уведомлений на фоне (желтый).
final notificationBackgroundWarningGradient = [
  whiteColor.withOpacity(0.0),
  notificationBackgroundWarningColor.withOpacity(0.1)
];

/// Градиент уведомлений на фоне (красный).
final notificationBackgroundNegativeGradient = [
  whiteColor.withOpacity(0.0),
  notificationBackgroundNegativeColor.withOpacity(0.1)
];

final shimmerBaseColor = Colors.grey.shade100;
final shimmerHighlightColor = Colors.grey.shade300;

const greenGradient1 = [lightGreenColor, semiDarkGreenColor];

// Paddings.
const sidePadding = sidePadding24;
const sidePadding4 = 4.0;
const sidePadding6 = 6.0;
const sidePadding8 = 8.0;
const sidePadding10 = 10.0;
const sidePadding12 = 12.0;
const sidePadding16 = 16.0;
const sidePadding18 = 18.0;
const sidePadding24 = 24.0;
const sidePadding28 = 28.0;
const sidePadding32 = 32.0;
const sidePadding40 = 40.0;
const sidePadding64 = 64.0;

const defaultKeyboardHeight = 290.0;

// Border radiuses.
final borderRadius12 = BorderRadius.circular(12.0);
final borderRadius32 = BorderRadius.circular(32.0);

// Radiuses.
const radiusCircular32 = Radius.circular(32.0);

// Durations.
const defaultAnimationDuration = Duration(milliseconds: 250);
const halfASecond = Duration(milliseconds: 500);
const aSecond = Duration(seconds: 1);
