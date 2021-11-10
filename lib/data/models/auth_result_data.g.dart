// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_result_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResultData _$AuthResultDataFromJson(Map<String, dynamic> json) {
  return AuthResultData(
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthResultDataToJson(AuthResultData instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };
