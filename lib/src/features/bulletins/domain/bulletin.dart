import 'package:equatable/equatable.dart';

class Bulletin extends Equatable {
  final int id;
  final int tenantId;
  final String title;
  final DateTime weekOf;
  final String? contentHtml;
  final String? pdfUrl;
  final bool isPublished;
  final DateTime? publishedAt;
  final int? createdById;
  final DateTime createdAt;

  const Bulletin({
    required this.id,
    required this.tenantId,
    required this.title,
    required this.weekOf,
    this.contentHtml,
    this.pdfUrl,
    this.isPublished = false,
    this.publishedAt,
    this.createdById,
    required this.createdAt,
  });

  factory Bulletin.fromJson(Map<String, dynamic> json) {
    return Bulletin(
      id: json['id'] as int,
      tenantId: json['tenant_id'] as int? ?? 1,
      title: json['title'] as String,
      weekOf: DateTime.parse(json['week_of'] as String),
      contentHtml: json['content_html'] as String?,
      pdfUrl: json['pdf_url'] as String?,
      isPublished: json['is_published'] as bool? ?? false,
      publishedAt: json['published_at'] != null
          ? DateTime.parse(json['published_at'] as String)
          : null,
      createdById: json['created_by_id'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenant_id': tenantId,
      'title': title,
      'week_of': weekOf.toIso8601String().substring(0, 10),
      'content_html': contentHtml,
      'pdf_url': pdfUrl,
      'is_published': isPublished,
      'published_at': publishedAt?.toIso8601String(),
      'created_by_id': createdById,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        tenantId,
        title,
        weekOf,
        contentHtml,
        pdfUrl,
        isPublished,
        publishedAt,
        createdById,
        createdAt,
      ];
}
