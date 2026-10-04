import 'package:equatable/equatable.dart';

enum GroupType {
  bibleStudy('bible_study', 'Bible Study'),
  ministry('ministry', 'Ministry'),
  choir('choir', 'Choir & Worship'),
  outreach('outreach', 'Outreach & Missions'),
  other('other', 'Fellowship');

  final String value;
  final String label;
  const GroupType(this.value, this.label);

  static GroupType fromString(String val) {
    return GroupType.values.firstWhere(
      (e) => e.value == val,
      orElse: () => GroupType.other,
    );
  }
}

enum GroupRole {
  leader('leader', 'Leader'),
  coLeader('co_leader', 'Co-Leader'),
  member('member', 'Member');

  final String value;
  final String label;
  const GroupRole(this.value, this.label);

  static GroupRole fromString(String val) {
    return GroupRole.values.firstWhere(
      (e) => e.value == val,
      orElse: () => GroupRole.member,
    );
  }
}

class MinistryGroup extends Equatable {
  final int id;
  final int tenantId;
  final String name;
  final String? description;
  final GroupType groupType;
  final String? meetingSchedule;
  final String? meetingLocation;
  final String? materialUrl;
  final int? leaderId;
  final bool isActive;
  final int memberCount;
  final bool isMember;
  final DateTime createdAt;

  const MinistryGroup({
    required this.id,
    required this.tenantId,
    required this.name,
    this.description,
    this.groupType = GroupType.bibleStudy,
    this.meetingSchedule,
    this.meetingLocation,
    this.materialUrl,
    this.leaderId,
    this.isActive = true,
    this.memberCount = 0,
    this.isMember = false,
    required this.createdAt,
  });

  factory MinistryGroup.fromJson(Map<String, dynamic> json) {
    return MinistryGroup(
      id: json['id'] as int,
      tenantId: json['tenant_id'] as int? ?? 1,
      name: json['name'] as String,
      description: json['description'] as String?,
      groupType: GroupType.fromString(json['group_type'] as String? ?? 'bible_study'),
      meetingSchedule: json['meeting_schedule'] as String?,
      meetingLocation: json['meeting_location'] as String?,
      materialUrl: json['material_url'] as String?,
      leaderId: json['leader_id'] as int?,
      isActive: json['is_active'] as bool? ?? true,
      memberCount: json['member_count'] as int? ?? 0,
      isMember: json['is_member'] as bool? ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
    );
  }

  MinistryGroup copyWith({
    bool? isMember,
    int? memberCount,
  }) {
    return MinistryGroup(
      id: id,
      tenantId: tenantId,
      name: name,
      description: description,
      groupType: groupType,
      meetingSchedule: meetingSchedule,
      meetingLocation: meetingLocation,
      materialUrl: materialUrl,
      leaderId: leaderId,
      isActive: isActive,
      memberCount: memberCount ?? this.memberCount,
      isMember: isMember ?? this.isMember,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tenantId,
        name,
        description,
        groupType,
        meetingSchedule,
        meetingLocation,
        materialUrl,
        leaderId,
        isActive,
        memberCount,
        isMember,
        createdAt,
      ];
}

class GroupMember extends Equatable {
  final int id;
  final int groupId;
  final int userId;
  final String? fullName;
  final GroupRole groupRole;
  final DateTime joinedAt;

  const GroupMember({
    required this.id,
    required this.groupId,
    required this.userId,
    this.fullName,
    required this.groupRole,
    required this.joinedAt,
  });

  factory GroupMember.fromJson(Map<String, dynamic> json) {
    return GroupMember(
      id: json['id'] as int,
      groupId: json['group_id'] as int,
      userId: json['user_id'] as int,
      fullName: json['full_name'] as String?,
      groupRole: GroupRole.fromString(json['group_role'] as String? ?? 'member'),
      joinedAt: json['joined_at'] != null
          ? DateTime.parse(json['joined_at'] as String)
          : DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [id, groupId, userId, fullName, groupRole, joinedAt];
}
