import 'package:equatable/equatable.dart';

class Sermon extends Equatable {
  final int id;
  final int tenantId;
  final String title;
  final String preacher;
  final DateTime preachedOn;
  final String youtubeVideoId;
  final String? description;
  final String thumbnailUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Sermon({
    required this.id,
    required this.tenantId,
    required this.title,
    required this.preacher,
    required this.preachedOn,
    required this.youtubeVideoId,
    this.description,
    required this.thumbnailUrl,
    required this.createdAt,
    this.updatedAt,
  });

  String get youtubeUrl => 'https://www.youtube.com/watch?v=$youtubeVideoId';

  static final fallback = Sermon(
    id: 1,
    tenantId: 1,
    title: 'The Sermon on the Mount: True Righteousness',
    preacher: 'Rev. Ramesh Tamang',
    preachedOn: DateTime(2026, 9, 27),
    youtubeVideoId: 'dQw4w9WgXcQ',
    description:
        'A verse-by-verse exposition of Matthew 5. Exploring Christ’s call to inward purity and divine grace.',
    thumbnailUrl: 'https://i.ytimg.com/vi/dQw4w9WgXcQ/hqdefault.jpg',
    createdAt: DateTime(2026, 9, 27),
  );

  factory Sermon.fromJson(Map<String, dynamic> json) {
    final videoId = json['youtube_video_id'] as String;
    return Sermon(
      id: json['id'] as int,
      tenantId: json['tenant_id'] as int? ?? 1,
      title: json['title'] as String,
      preacher: json['preacher'] as String,
      preachedOn: DateTime.parse(json['preached_on'] as String),
      youtubeVideoId: videoId,
      description: json['description'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String? ??
          'https://i.ytimg.com/vi/$videoId/hqdefault.jpg',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenant_id': tenantId,
      'title': title,
      'preacher': preacher,
      'preached_on': preachedOn.toIso8601String().substring(0, 10),
      'youtube_video_id': youtubeVideoId,
      'description': description,
      'thumbnail_url': thumbnailUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        tenantId,
        title,
        preacher,
        preachedOn,
        youtubeVideoId,
        description,
        thumbnailUrl,
        createdAt,
        updatedAt,
      ];
}
