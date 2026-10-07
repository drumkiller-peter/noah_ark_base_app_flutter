// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  tenantId: (json['tenant_id'] as num).toInt(),
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  languagePreference: json['language_preference'] as String,
  privacySettings: PrivacySettings.fromJson(
    json['privacy_settings'] as Map<String, dynamic>,
  ),
  isActive: json['is_active'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'tenant_id': instance.tenantId,
  'full_name': instance.fullName,
  'email': instance.email,
  'phone': instance.phone,
  'role': _$UserRoleEnumMap[instance.role]!,
  'language_preference': instance.languagePreference,
  'privacy_settings': instance.privacySettings,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
};

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'super_admin',
  UserRole.pastor: 'pastor',
  UserRole.admin: 'admin',
  UserRole.treasurer: 'treasurer',
  UserRole.youthLeader: 'youth_leader',
  UserRole.elder: 'elder',
  UserRole.member: 'member',
};

_PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) =>
    _PrivacySettings(
      showEmail: json['show_email'] as bool,
      showPhone: json['show_phone'] as bool,
      showInDirectory: json['show_in_directory'] as bool,
      giveAnonymously: json['give_anonymously'] as bool,
    );

Map<String, dynamic> _$PrivacySettingsToJson(_PrivacySettings instance) =>
    <String, dynamic>{
      'show_email': instance.showEmail,
      'show_phone': instance.showPhone,
      'show_in_directory': instance.showInDirectory,
      'give_anonymously': instance.giveAnonymously,
    };
