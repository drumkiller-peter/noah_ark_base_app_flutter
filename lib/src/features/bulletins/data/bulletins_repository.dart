import 'package:drift/drift.dart';
import 'package:noah_ark_base_app_flutter/src/core/config/app_config.dart';
import 'package:noah_ark_base_app_flutter/src/core/database/app_database.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_client.dart';
import 'package:noah_ark_base_app_flutter/src/core/network/api_endpoints.dart';
import 'package:noah_ark_base_app_flutter/src/features/bulletins/domain/bulletin.dart';

class BulletinsRepository {
  final ApiClient apiClient;
  final AppDatabase database;
  final AppConfig config;

  BulletinsRepository({
    required this.apiClient,
    required this.database,
    required this.config,
  });

  Future<List<Bulletin>> fetchBulletins() async {
    try {
      final response = await apiClient.dio.get<dynamic>(
        ApiEndpoints.bulletins,
        queryParameters: {'is_published': true},
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

      final bulletins = items
          .map((item) => Bulletin.fromJson(item as Map<String, dynamic>))
          .toList();

      // Cache locally into Drift SQLite
      await _cacheBulletins(bulletins);
      return bulletins;
    } catch (_) {
      // Fallback to local SQLite cache
      final cached = await (database.select(database.cachedBulletins)
            ..where((tbl) => tbl.tenantKey.equals(config.tenantKey)))
          .get();

      if (cached.isNotEmpty) {
        return cached
            .map(
              (row) => Bulletin(
                id: row.id,
                tenantId: 1,
                title: row.title,
                weekOf: row.publicationDate,
                contentHtml: row.contentHtml,
                pdfUrl: row.pdfUrl,
                isPublished: true,
                createdAt: row.publicationDate,
              ),
            )
            .toList();
      }

      // Return default mock bulletin if offline & cache is empty
      return [
        Bulletin(
          id: 1,
          tenantId: 1,
          title: 'Sunday Worship Bulletin',
          weekOf: DateTime.now(),
          contentHtml: '''
            <h3>Order of Service</h3>
            <p><strong>Opening Hymn:</strong> Hymn 1 - Holy, Holy, Holy</p>
            <p><strong>Scripture Reading:</strong> Psalm 23</p>
            <p><strong>Sermon:</strong> Walking by Faith</p>
            <p><strong>Benediction:</strong> Numbers 6:24-26</p>
          ''',
          isPublished: true,
          createdAt: DateTime.now(),
        ),
      ];
    }
  }

  Future<List<Announcement>> fetchAnnouncements() async {
    try {
      final response = await apiClient.dio.get<dynamic>(ApiEndpoints.announcements);

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
          .map((item) => Announcement.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (_) {
      // Offline fallback announcements
      return [
        Announcement(
          id: 1,
          tenantId: 1,
          title: 'Sunday Fasting & Prayer Fellowship',
          body:
              'Join us this Saturday at 6:00 AM for church-wide intercession.',
          isUrgent: true,
          publishAt: DateTime.now(),
          createdAt: DateTime.now(),
        ),
        Announcement(
          id: 2,
          tenantId: 1,
          title: 'Youth Choir Rehearsal',
          body:
              'All youth choir participants meet at the sanctuary at 4:00 PM this Friday.',
          isUrgent: false,
          publishAt: DateTime.now(),
          createdAt: DateTime.now(),
        ),
      ];
    }
  }

  Future<void> _cacheBulletins(List<Bulletin> bulletins) async {
    for (final bulletin in bulletins) {
      await database.into(database.cachedBulletins).insertOnConflictUpdate(
            CachedBulletinsCompanion(
              id: Value(bulletin.id),
              title: Value(bulletin.title),
              publicationDate: Value(bulletin.weekOf),
              pdfUrl: Value(bulletin.pdfUrl),
              contentHtml: Value(bulletin.contentHtml),
              tenantKey: Value(config.tenantKey),
            ),
          );
    }
  }
}
