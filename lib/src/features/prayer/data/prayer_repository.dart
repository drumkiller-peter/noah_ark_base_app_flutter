import 'package:noah_ark_base_app_flutter/src/core/network/api_client.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_endpoints.dart';
import 'package:noah_ark_base_app_flutter/src/features/prayer/domain/prayer_request.dart';

class PrayerRepository {
  final ApiClient apiClient;

  PrayerRepository({required this.apiClient});

  Future<List<PrayerRequest>> getPrayerChain() async {
    try {
      final response = await apiClient.dio.get<Map<String, dynamic>>(
        ApiEndpoints.prayers,
        queryParameters: {'page': 1, 'page_size': 50, 'is_private': false},
      );

      if (response.statusCode == 200 && response.data != null) {
        final items = (response.data!['items'] as List<dynamic>?) ?? [];
        return items
            .map((item) => PrayerRequest.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  Future<List<PrayerRequest>> getMyPrivatePrayers() async {
    try {
      final response = await apiClient.dio.get<Map<String, dynamic>>(
        ApiEndpoints.prayers,
        queryParameters: {'page': 1, 'page_size': 50, 'is_private': true},
      );

      if (response.statusCode == 200 && response.data != null) {
        final items = (response.data!['items'] as List<dynamic>?) ?? [];
        return items
            .map((item) => PrayerRequest.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  Future<PrayerRequest> createPrayerRequest({
    required String title,
    required String content,
    required bool isPrivate,
    required bool isAnonymous,
    int? assignedPastorId,
  }) async {
    final response = await apiClient.dio.post<Map<String, dynamic>>(
      ApiEndpoints.prayers,
      data: {
        'title': title,
        'content': content,
        'is_private': isPrivate,
        'is_anonymous': isAnonymous,
        'assigned_pastor_id': ?assignedPastorId,
      },
    );

    if (response.statusCode == 201 && response.data != null) {
      return PrayerRequest.fromJson(response.data!);
    }
    throw Exception('Failed to create prayer request');
  }

  Future<void> toggleIntercession(int prayerId, bool intercede) async {
    if (intercede) {
      await apiClient.dio.post<void>(ApiEndpoints.prayerIntercession(prayerId));
    } else {
      await apiClient.dio.delete<void>(ApiEndpoints.prayerIntercession(prayerId));
    }
  }
}
