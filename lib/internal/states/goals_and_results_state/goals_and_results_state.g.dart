// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_and_results_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoalsAndResultsState on _GoalsAndResultsStateBase, Store {
  final _$goalsAndResultsAtom =
      Atom(name: '_GoalsAndResultsStateBase.goalsAndResults');

  @override
  ObservableList<Milestone> get goalsAndResults {
    _$goalsAndResultsAtom.reportRead();
    return super.goalsAndResults;
  }

  @override
  set goalsAndResults(ObservableList<Milestone> value) {
    _$goalsAndResultsAtom.reportWrite(value, super.goalsAndResults, () {
      super.goalsAndResults = value;
    });
  }

  final _$_loadGoalsAndResultsAsyncAction =
      AsyncAction('_GoalsAndResultsStateBase._loadGoalsAndResults');

  @override
  Future<void> _loadGoalsAndResults() {
    return _$_loadGoalsAndResultsAsyncAction
        .run(() => super._loadGoalsAndResults());
  }

  @override
  String toString() {
    return '''
goalsAndResults: ${goalsAndResults}
    ''';
  }
}
