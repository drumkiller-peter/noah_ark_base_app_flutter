import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole {
  superAdmin('super_admin'),
  pastor('pastor'),
  admin('admin'),
  treasurer('treasurer'),
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
    required String fullName,
    String? email,
    String? phone,
    required UserRole role,
    required int tenantId,
    @Default(true) bool isActive,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
