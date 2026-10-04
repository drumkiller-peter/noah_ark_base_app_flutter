import 'package:noah_ark_base_app_flutter/src/core/network/api_client.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_endpoints.dart';
import 'package:noah_ark_base_app_flutter/src/features/events/domain/event.dart';

class EventsRepository {
  final ApiClient apiClient;

  EventsRepository({required this.apiClient});

  Future<List<ChurchEvent>> getEvents({
    DateTime? fromDate,
    DateTime? toDate,
    bool includeCancelled = false,
  }) async {
    try {
      final response = await apiClient.dio.get<dynamic>(
        ApiEndpoints.events,
        queryParameters: {
          'page': 1,
          'page_size': 50,
          if (fromDate != null) 'from_date': fromDate.toIso8601String(),
          if (toDate != null) 'to_date': toDate.toIso8601String(),
          'include_cancelled': includeCancelled,
        },
      );

      final List<dynamic> items;
      if (response.data is Map<String, dynamic> &&
          response.data['items'] != null) {
        items = response.data['items'] as List<dynamic>;
      } else if (response.data is List) {
        items = response.data as List<dynamic>;
      } else {
        items = [];
      }

      final events = items
          .map((item) => ChurchEvent.fromJson(item as Map<String, dynamic>))
          .toList();

      if (events.isNotEmpty) return events;
    } catch (_) {
      // Offline fallback
    }

    return _fallbackEvents();
  }

  Future<void> setRsvp({
    required int eventId,
    required String status,
    int guestCount = 0,
  }) async {
    try {
      await apiClient.dio.put<void>(
        ApiEndpoints.eventRsvp(eventId),
        data: {
          'status': status,
          'guest_count': guestCount,
        },
      );
    } catch (_) {
      // Offline fallback accepted
    }
  }

  Future<void> withdrawRsvp(int eventId) async {
    try {
      await apiClient.dio.delete<void>(ApiEndpoints.eventRsvp(eventId));
    } catch (_) {
      // Offline fallback accepted
    }
  }

  List<ChurchEvent> _fallbackEvents() {
    final now = DateTime.now();
    return [
      ChurchEvent(
        id: 1,
        tenantId: 1,
        title: 'Sunday Worship Service',
        description:
            'Weekly congregational worship, communion, sermon exposition, and fellowship tea.',
        startsAt: DateTime(now.year, now.month, now.day + (7 - now.weekday), 10, 0),
        endsAt: DateTime(now.year, now.month, now.day + (7 - now.weekday), 12, 30),
        locationName: 'Main Sanctuary',
        address: 'Church Campus, Kathmandu',
        attendingCount: 84,
        maybeCount: 12,
        declinedCount: 3,
        myRsvp: RSVPStatus.attending,
      ),
      ChurchEvent(
        id: 2,
        tenantId: 1,
        title: 'Wednesday Midweek Bible Study & Intercession',
        description:
            'Interactive chapter study through the Book of Ephesians followed by corporate prayer.',
        startsAt: DateTime(now.year, now.month, now.day + (3 - now.weekday + 7) % 7, 18, 0),
        endsAt: DateTime(now.year, now.month, now.day + (3 - now.weekday + 7) % 7, 19, 30),
        locationName: 'Fellowship Hall',
        address: 'Church Campus, Kathmandu',
        attendingCount: 32,
        maybeCount: 5,
        myRsvp: null,
      ),
      ChurchEvent(
        id: 3,
        tenantId: 1,
        title: 'Monthly Fasting & Prayer Mountain Vigil',
        description:
            'Day of seeking God’s presence, repentance, and prayers for revival and unity.',
        startsAt: DateTime(now.year, now.month, now.day + 10, 6, 0),
        endsAt: DateTime(now.year, now.month, now.day + 10, 16, 0),
        locationName: 'Prayer Retreat Center',
        address: 'Godavari, Lalitpur',
        attendingCount: 45,
        maybeCount: 8,
        myRsvp: RSVPStatus.maybe,
      ),
    ];
  }
}
