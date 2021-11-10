// Package imports:
import 'package:mobx/mobx.dart';

// Project imports:
import 'package:treearth/domain/models/user/user.dart';

part 'user_state.g.dart';

class UserState = _UserStateBase with _$UserState;

abstract class _UserStateBase with Store {
  @observable
  User? user;
}
