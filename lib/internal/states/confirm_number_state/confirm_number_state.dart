// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:mobx/mobx.dart';
import 'package:phone_number/phone_number.dart';

// Project imports:
import 'package:treearth/internal/services/helpers.dart';

part 'confirm_number_state.g.dart';

class ConfirmNumberState extends _ConfirmNumberStateBase with _$ConfirmNumberState {
  ConfirmNumberState({required PhoneNumber phone}) : super(phone: phone);

  static const defaultCodeLength = 6;
}

abstract class _ConfirmNumberStateBase with Store {
  _ConfirmNumberStateBase({
    required this.phone,
  }) {
    // Автоматическая отправка кода на указанный номер телефона.
    _sendVerificationCode();
  }

  /// Номер телефона, с которым будут производиться операции.
  final PhoneNumber phone;

  /// Код, который отправляется по СМС.
  String? verificationCode;

  /// Отправка кода по СМС.
  @action
  Future<void> _sendVerificationCode() async {
    // Генерация кода.
    verificationCode = generateNDigitsCode(ConfirmNumberState.defaultCodeLength);
    log('Verification code is $verificationCode');
  }

  /// Отправка кода по СМС.
  @action
  bool verifyCode(String code) {
    if (code == verificationCode) return true;

    return false;
  }
}
