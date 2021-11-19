// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/data/repository/milestones/milestones_repository.dart';
import 'package:treearth/domain/models/milestone/milestone.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/states/interfaces/initializable.dart';
import 'package:treearth/internal/states/interfaces/network_state.dart';

part 'goals_and_results_state.g.dart';

class GoalsAndResultsState = _GoalsAndResultsStateBase with _$GoalsAndResultsState;

abstract class _GoalsAndResultsStateBase extends NetworkState with Store implements Initializable {
  /// Репозиторий целей и результатов.
  MilestonesRepository get repository => service<MilestonesRepository>();

  /// Цели и результаты для главной страницы.
  @observable
  ObservableList<Milestone> goalsAndResults = ObservableList();

  /// Загрузка целей и результатов с бэкэнда.
  @action
  Future<void> _loadGoalsAndResults() async {
    isLoading = true;

    /// Запрос на бэкэнд через репозиторий на получение целей и результатов.
    final apiResult = await repository.fetchMilestones();
    if (apiResult.isSuccessful) goalsAndResults = ObservableList.of(apiResult.data ?? []);
    goalsAndResults.sort((other, one) => one.type.index.compareTo(other.type.index));

    isLoading = false;
  }

  @override
  Future<void> initialize() async {
    await _loadGoalsAndResults();
  }
}
