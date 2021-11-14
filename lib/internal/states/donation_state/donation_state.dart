// Package imports:
import 'package:mobx/mobx.dart';

part 'donation_state.g.dart';

enum DonationType {
  /// Единоразовое пожертвование.
  oneTime,

  /// Ежемесячное пожертвование.
  monthly,
}

class DonationState = _DonationStateBase with _$DonationState;

abstract class _DonationStateBase with Store {
  /// Частота пожертвования.
  @observable
  DonationType type = DonationType.monthly;

  @action
  void changeDonationType(DonationType type) {
    this.type = type;
  }
}
