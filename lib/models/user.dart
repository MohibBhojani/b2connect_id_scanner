import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class AppUser {
  String id;
  String fullName;
  String gender;
  String dateOfBirth;
  String nationality;
  String expiryDate;

  AppUser({
    this.id = "",
    this.fullName = "",
    this.gender = "",
    this.dateOfBirth = "",
    this.nationality = "",
    this.expiryDate = "",
  });

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
