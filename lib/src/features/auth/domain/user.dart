import 'package:equatable/equatable.dart';

enum UserRole {
  superAdmin('super_admin'),
  pastor('pastor'),
  assistantPastor('assistant_pastor'),
  elder('elder'),
  deacon('deacon'),
  youthCommittee('youth_committee'),
  childrenCommittee('children_committee'),
  treasurer('treasurer'),
  member('member');

  final String value;
  const UserRole(this.value);

  static UserRole fromString(String role) {
    return UserRole.values.firstWhere(
      (r) => r.value == role,
      orElse: () => UserRole.member,
    );
  }

  bool get isLeadership =>
      this == UserRole.superAdmin ||
      this == UserRole.pastor ||
      this == UserRole.assistantPastor ||
      this == UserRole.treasurer;

  bool get isFinanceManager =>
      this == UserRole.superAdmin ||
      this == UserRole.pastor ||
      this == UserRole.assistantPastor ||
      this == UserRole.treasurer;
}

class User extends Equatable {
  final int id;
  final String fullName;
  final String? email;
  final String? phone;
  final UserRole role;
  final int tenantId;
  final bool isActive;

  const User({
    required this.id,
    required this.fullName,
    this.email,
    this.phone,
    required this.role,
    required this.tenantId,
    this.isActive = true,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: UserRole.fromString(json['role'] as String? ?? 'member'),
      tenantId: json['tenant_id'] as int? ?? 1,
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'role': role.value,
        'tenant_id': tenantId,
        'is_active': isActive,
      };

  @override
  List<Object?> get props => [id, fullName, email, phone, role, tenantId, isActive];
}
