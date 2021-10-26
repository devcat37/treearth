// Dart imports:
import 'dart:math';

/// Конвертирует градусы в радианы.
double degreeToRadian(double degree) => degree * pi / 180;

/// Конвертирует радианы в градусы.
double radianToDegree(double radian) => radian * 180 / pi;

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
