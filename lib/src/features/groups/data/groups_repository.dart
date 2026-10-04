import 'package:noah_ark_base_app_flutter/src/core/network/api_client.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_endpoints.dart';
import 'package:noah_ark_base_app_flutter/src/features/groups/domain/group.dart';

class GroupsRepository {
  final ApiClient apiClient;

  GroupsRepository({required this.apiClient});

  Future<List<Group>> fetchGroups() async {
    try {
      final response = await apiClient.dio.get<dynamic>(ApiEndpoints.groups);

      final List<dynamic> items;
      if (response.data is Map<String, dynamic> &&
          response.data['items'] != null) {
        items = response.data['items'] as List<dynamic>;
      } else if (response.data is List) {
        items = response.data as List<dynamic>;
      } else {
        items = [];
      }

      return items
          .map((item) => Group.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      // Offline fallback groups
      return [
        Group(
          id: 1,
          tenantId: 1,
          name: 'Young Adults Fellowship',
          description:
              'Weekly fellowship, Bible study, and outreach for university students and young working professionals.',
          groupType: GroupType.bibleStudy,
          meetingSchedule: 'Every Saturday, 4:00 PM',
          meetingLocation: 'Sanctuary Upper Hall',
          memberCount: 28,
          isMember: true,
          createdAt: DateTime.now(),
        ),
        Group(
          id: 2,
          tenantId: 1,
          name: 'Church Worship & Praise Choir',
          description:
              'Vocalists and instrumentalists leading Sunday worship in English and Nepali hymns.',
          groupType: GroupType.choir,
          meetingSchedule: 'Every Friday, 5:30 PM',
          meetingLocation: 'Sanctuary Main Stage',
          memberCount: 16,
          isMember: false,
          createdAt: DateTime.now(),
        ),
        Group(
          id: 3,
          tenantId: 1,
          name: 'Grace Community Outreach',
          description:
              'Monthly neighborhood medical camp, food distribution, and hospital visitation ministry.',
          groupType: GroupType.outreach,
          meetingSchedule: 'First Saturday of every month',
          meetingLocation: 'Community Center',
          memberCount: 42,
          isMember: false,
          createdAt: DateTime.now(),
        ),
        Group(
          id: 4,
          tenantId: 1,
          name: 'Women’s Intercessory Prayer Circle',
          description:
              'Dedicated mothers and sisters gathering for fervent prayer for our families, churches, and nation.',
          groupType: GroupType.ministry,
          meetingSchedule: 'Every Tuesday, 10:00 AM',
          meetingLocation: 'Prayer Room 2',
          memberCount: 19,
          isMember: false,
          createdAt: DateTime.now(),
        ),
      ];
    }
  }

  Future<void> joinGroup(int groupId) async {
    try {
      await apiClient.dio.post<dynamic>('${ApiEndpoints.groups}/$groupId/join');
    } catch (_) {
      // Tolerant fallback for local mock
    }
  }

  Future<void> leaveGroup(int groupId) async {
    try {
      await apiClient.dio.delete<dynamic>('${ApiEndpoints.groups}/$groupId/leave');
    } catch (_) {
      // Tolerant fallback for local mock
    }
  }
}
