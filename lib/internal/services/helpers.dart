// Dart imports:
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Project imports:
import 'package:treearth/internal/services/settings.dart';

/// Конвертирует градусы в радианы.
double degreeToRadian(double degree) => degree * pi / 180;

/// Конвертирует радианы в градусы.
double radianToDegree(double radian) => radian * 180 / pi;

/// Расчитывает размер текста.
Size getTextWidgetSize(String text, TextStyle style,
    {double minWidth = 0, double maxWidth = double.infinity, int maxLines = 1}) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
  )..layout(minWidth: minWidth, maxWidth: maxWidth);
  return textPainter.size;
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}

String monthToString(int month) {
  switch (month) {
    case 12:
      return 'Декабря';
    case 2:
      return 'Февраля';
    case 3:
      return 'Марта';
    case 4:
      return 'Апреля';
    case 5:
      return 'Мая';
    case 6:
      return 'Июня';
    case 7:
      return 'Июля';
    case 8:
      return 'Августа';
    case 9:
      return 'Сентября';
    case 10:
      return 'Октября';
    case 11:
      return 'Ноября';
    case 1:
    default:
      return 'Января';
  }
}

String generateNDigitsCode(int digits) {
  String code = '';
  for (int i = 0; i < digits; i++) {
    code += '${Random().nextInt(10)}';
  }
  return code;
}

Future<Placemark?> adressByLocation(LatLng location) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude, location.longitude);

  return placemarks.isNotEmpty ? placemarks.first : null;
}

double distanceBetweenPoints(LatLng first, LatLng second) {
  return sqrt(pow(first.latitude - second.latitude, 2) + pow(first.longitude - second.longitude, 2));
}

bool hasTokenExpired(String token) {
  try {
    JWT.verify(token, SecretKey(Settings.JWT_ACCESS_SECRET));
    return false;
  } on JWTError {
    return true;
  }
}
