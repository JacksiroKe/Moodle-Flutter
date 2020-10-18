// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => new Token(
    token: json['token'] as String,
    privatetoken: json['privatetoken'] as String);

abstract class _$TokenSerializerMixin {
  String get token;
  String get privatetoken;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'token': token,
    'privatetoken': privatetoken,
  };

}
