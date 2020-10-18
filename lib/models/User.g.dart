// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => new User(
    username: json['username'] as String,
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    lang: json['lang'] as String,
    userid: json['userid'] as int,
    userpictureurl: json['userpictureurl'] as String);

abstract class _$UserSerializerMixin {
  String get username;
  String get firstname;
  String get lastname;
  String get lang;
  int get userid;
  String get userpictureurl;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'username': username,
    'firstname': firstname,
    'lastname': lastname,
    'lang': lang,
    'userid': userid,
    'userpictureurl': userpictureurl
  };

}
