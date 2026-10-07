import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole {
  @JsonValue('super_admin')
  superAdmin('super_admin'),
  @JsonValue('pastor')
  pastor('pastor'),
  admin('admin'),
  treasurer('treasurer'),
  @JsonValue('youth_leader')
  youthLeader('youth_leader'),
  elder('elder'),
  member('member');

  final String value;
  const UserRole(this.value);

  static UserRole fromString(String role) {
    return UserRole.values.firstWhere(
      (r) => r.value == role,
      orElse: () => UserRole.member,
    );
  }

  /// Pastors and Admins manage tenant-owned content and accounts; Super Admin manages all.
  bool get canManageContent =>
      this == UserRole.superAdmin ||
      this == UserRole.pastor ||
      this == UserRole.admin;

  /// Pastors, Admins, and Treasurers hold general church leadership / workspace access.
  bool get isLeadership =>
      this == UserRole.superAdmin ||
      this == UserRole.pastor ||
      this == UserRole.admin ||
      this == UserRole.treasurer;

  /// Treasurers, Pastors, and Super Admin manage giving ledger and funds. Admins do not.
  bool get isFinanceManager =>
      this == UserRole.superAdmin ||
      this == UserRole.pastor ||
      this == UserRole.treasurer;

  /// Pastors, Admins, and Youth Leaders post church-wide Events.
  bool get canPostChurchEvents =>
      this == UserRole.superAdmin ||
      this == UserRole.pastor ||
      this == UserRole.admin ||
      this == UserRole.youthLeader;

  /// Pastors, Admins, and Youth Leaders create Groups.
  bool get canCreateGroups => canPostChurchEvents;

  /// Pastors and Super Admin can access Private Prayer Requests. Admins cannot.
  bool get canAccessPrivatePrayers =>
      this == UserRole.superAdmin || this == UserRole.pastor;

  /// Self-deletion is available to members without management rights.
  bool get canSelfDeleteAccount =>
      this != UserRole.superAdmin &&
      this != UserRole.pastor &&
      this != UserRole.admin;
}

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    @JsonKey(name: 'tenant_id') required int tenantId,
    @JsonKey(name: 'full_name') required String fullName,
    required String email,
    String? phone,
    required UserRole role,
    @JsonKey(name: 'language_preference') required String languagePreference,
    @JsonKey(name: 'privacy_settings') required PrivacySettings privacySettings,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class PrivacySettings with _$PrivacySettings {
  const factory PrivacySettings({
    @JsonKey(name: 'show_email') required bool showEmail,
    @JsonKey(name: 'show_phone') required bool showPhone,
    @JsonKey(name: 'show_in_directory') required bool showInDirectory,
    @JsonKey(name: 'give_anonymously') required bool giveAnonymously,
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);
}
