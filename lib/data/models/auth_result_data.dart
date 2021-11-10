// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:treearth/domain/models/user/user.dart';

part 'auth_result_data.g.dart';

@JsonSerializable()
class AuthResultData {
  const AuthResultData({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  final String accessToken;
  final String refreshToken;
  final User user;

  factory AuthResultData.fromJson(Map<String, dynamic> json) => _$AuthResultDataFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResultDataToJson(this);
}
