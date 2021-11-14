// Package imports:
import 'package:mobx/mobx.dart';

part 'donation_state.g.dart';

enum DonationType {
  /// Единоразовое пожертвование.
  oneTime,

  /// Ежемесячное пожертвование.
  monthly,
}

class DonationState extends _DonationStateBase with _$DonationState {
  /// Максимальная сумма пожертвования.
  static const maxDonationValue = 5000;
}

abstract class _DonationStateBase with Store {
  /// Частота пожертвования.
  @observable
  DonationType type = DonationType.monthly;

  /// Выбранная сумма пожертвования.
  int _donationValue = 0;

  void setDonationValue(int value) {
    _donationValue = value;
  }

  @action
  void changeDonationType(DonationType type) {
    this.type = type;
  }
}
