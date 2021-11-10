// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_number_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfirmNumberState on _ConfirmNumberStateBase, Store {
  final _$_sendVerificationCodeAsyncAction =
      AsyncAction('_ConfirmNumberStateBase._sendVerificationCode');

  @override
  Future<void> _sendVerificationCode() {
    return _$_sendVerificationCodeAsyncAction
        .run(() => super._sendVerificationCode());
  }

  final _$_ConfirmNumberStateBaseActionController =
      ActionController(name: '_ConfirmNumberStateBase');

  @override
  bool verifyCode(String code) {
    final _$actionInfo = _$_ConfirmNumberStateBaseActionController.startAction(
        name: '_ConfirmNumberStateBase.verifyCode');
    try {
      return super.verifyCode(code);
    } finally {
      _$_ConfirmNumberStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
