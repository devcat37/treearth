// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BannersState on _BannersStateBase, Store {
  final _$bannersAtom = Atom(name: '_BannersStateBase.banners');

  @override
  ObservableList<TreeBanner> get banners {
    _$bannersAtom.reportRead();
    return super.banners;
  }

  @override
  set banners(ObservableList<TreeBanner> value) {
    _$bannersAtom.reportWrite(value, super.banners, () {
      super.banners = value;
    });
  }

  final _$_loadBannersAsyncAction =
      AsyncAction('_BannersStateBase._loadBanners');

  @override
  Future<void> _loadBanners() {
    return _$_loadBannersAsyncAction.run(() => super._loadBanners());
  }

  @override
  String toString() {
    return '''
banners: ${banners}
    ''';
  }
}
