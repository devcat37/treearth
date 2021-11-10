// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends _UserBase with _$User {
  User({
    required String id,
    required String uid,
  }) : super(id: id, uid: uid);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

abstract class _UserBase with Store {
  _UserBase({
    required this.id,
    required this.uid,
  });

  /// ID пользователя в базе данных.
  @JsonKey(name: '_id')
  final String id;

  /// ID пользователя при авторизации.
  final String uid;
}
