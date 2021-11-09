// Flutter imports:
import 'package:flutter/material.dart';

class PinController with ChangeNotifier {
  PinController({
    this.onChanged,
    this.length = 4,
  });

  final Function()? onChanged;

  /// Длина пин-кода.
  final int length;

  /// Введенный пользователем пин-код.
  String? pin;

  void addValue(String value) {
    String newPin = '${pin ?? ''}$value';
    if (newPin.length > length) newPin = newPin.substring(0, length);

    pin = newPin;
    notifyListeners();
  }

  void removeLast() {
    if (pin?.isNotEmpty ?? false) {
      String newPin = pin?.substring(0, pin!.length - 1) ?? '';

      pin = newPin;
      notifyListeners();
    }
  }
}
