// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return AppUser(
    id: json['id'] as String,
    fullName: json['fullName'] as String,
    gender: json['gender'] as String,
    dateOfBirth: json['dateOfBirth'] as String,
    nationality: json['nationality'] as String,
    expiryDate: json['expiryDate'] as String,
  );
}

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'nationality': instance.nationality,
      'expiryDate': instance.expiryDate,
    };
