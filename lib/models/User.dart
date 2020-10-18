import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  String username;
  String firstname;
  String lastname;
  String lang;
  int userid;
  String userpictureurl;

  User(
      {this.username,
      this.firstname,
      this.lastname,
      this.lang,
      this.userid,
      this.userpictureurl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
