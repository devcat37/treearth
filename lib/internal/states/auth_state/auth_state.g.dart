// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthState on _AuthStateBase, Store {
  final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthStateBase.signInWithGoogle');

  @override
  Future<bool> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$signInWithPhoneNumberAsyncAction =
      AsyncAction('_AuthStateBase.signInWithPhoneNumber');

  @override
  Future<bool> signInWithPhoneNumber() {
    return _$signInWithPhoneNumberAsyncAction
        .run(() => super.signInWithPhoneNumber());
  }

  final _$authorizeAsyncAction = AsyncAction('_AuthStateBase.authorize');

  @override
  Future<bool> authorize({String? userId, bool? isNew = false}) {
    return _$authorizeAsyncAction
        .run(() => super.authorize(userId: userId, isNew: isNew));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
