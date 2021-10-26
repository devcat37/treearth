// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationsState on _NotificationsStateBase, Store {
  final _$notificationsAtom =
      Atom(name: '_NotificationsStateBase.notifications');

  @override
  ObservableList<Notification> get notifications {
    _$notificationsAtom.reportRead();
    return super.notifications;
  }

  @override
  set notifications(ObservableList<Notification> value) {
    _$notificationsAtom.reportWrite(value, super.notifications, () {
      super.notifications = value;
    });
  }

  final _$_loadNotificationsAsyncAction =
      AsyncAction('_NotificationsStateBase._loadNotifications');

  @override
  Future<void> _loadNotifications() {
    return _$_loadNotificationsAsyncAction
        .run(() => super._loadNotifications());
  }

  @override
  String toString() {
    return '''
notifications: ${notifications}
    ''';
  }
}
