// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends _UserBase with _$User {
  User({
    required String id,
    required String uid,
    bool? isVolunteer = false,
    bool? isNew = true,
  }) : super(
          id: id,
          uid: uid,
          isVolunteer: isVolunteer ?? false,
          isNew: isNew ?? false,
        );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

abstract class _UserBase with Store {
  _UserBase({
    required this.id,
    required this.uid,
    this.isVolunteer = false,
    this.isNew = true,
  });

  /// ID пользователя в базе данных.
  @JsonKey(name: 'id')
  final String id;

  /// ID пользователя при авторизации.
  final String uid;

  /// Есть ли у пользователя привилегии волонтерства.
  final bool isVolunteer;

  /// Первый раз пользователь авторизировался или нет.
  final bool isNew;
}
