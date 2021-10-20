// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NetworkState on _NetworkState, Store {
  Computed<bool>? _$hasNetworkErrorComputed;

  @override
  bool get hasNetworkError =>
      (_$hasNetworkErrorComputed ??= Computed<bool>(() => super.hasNetworkError,
              name: '_NetworkState.hasNetworkError'))
          .value;

  final _$isLoadingAtom = Atom(name: '_NetworkState.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$errorAtom = Atom(name: '_NetworkState.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_NetworkStateActionController =
      ActionController(name: '_NetworkState');

  @override
  void clearError() {
    final _$actionInfo = _$_NetworkStateActionController.startAction(
        name: '_NetworkState.clearError');
    try {
      return super.clearError();
    } finally {
      _$_NetworkStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
hasNetworkError: ${hasNetworkError}
    ''';
  }
}
