// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Notification on _NotificationBase, Store {
  final _$isReadAtom = Atom(name: '_NotificationBase.isRead');

  @override
  bool get isRead {
    _$isReadAtom.reportRead();
    return super.isRead;
  }

  @override
  set isRead(bool value) {
    _$isReadAtom.reportWrite(value, super.isRead, () {
      super.isRead = value;
    });
  }

  @override
  String toString() {
    return '''
isRead: ${isRead}
    ''';
  }
}
