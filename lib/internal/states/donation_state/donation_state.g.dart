// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DonationState on _DonationStateBase, Store {
  final _$typeAtom = Atom(name: '_DonationStateBase.type');

  @override
  DonationType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(DonationType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  @override
  String toString() {
    return '''
type: ${type}
    ''';
  }
}
