// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  tenantId: (json['tenantId'] as num).toInt(),
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'phone': instance.phone,
  'role': _$UserRoleEnumMap[instance.role]!,
  'tenantId': instance.tenantId,
  'isActive': instance.isActive,
};

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'superAdmin',
  UserRole.pastor: 'pastor',
  UserRole.admin: 'admin',
  UserRole.treasurer: 'treasurer',
  UserRole.youthLeader: 'youthLeader',
  UserRole.elder: 'elder',
  UserRole.member: 'member',
};
