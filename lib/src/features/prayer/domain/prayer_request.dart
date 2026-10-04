import 'package:equatable/equatable.dart';

enum PrayerStatus {
  open('open'),
  answered('answered'),
  closed('closed');

  final String value;
  const PrayerStatus(this.value);

  static PrayerStatus fromString(String val) {
    return PrayerStatus.values.firstWhere(
      (s) => s.value == val,
      orElse: () => PrayerStatus.open,
    );
  }
}

class PastoralPrayerNote extends Equatable {
  final int id;
  final int pastorId;
  final String pastorName;
  final String? note;
  final DateTime createdAt;

  const PastoralPrayerNote({
    required this.id,
    required this.pastorId,
    required this.pastorName,
    this.note,
    required this.createdAt,
  });

  factory PastoralPrayerNote.fromJson(Map<String, dynamic> json) {
    return PastoralPrayerNote(
      id: json['id'] as int,
      pastorId: json['pastor_id'] as int,
      pastorName: json['pastor_name'] as String? ?? 'Pastor',
      note: json['note'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  @override
  List<Object?> get props => [id, pastorId, pastorName, note, createdAt];
}

class PrayerRequest extends Equatable {
  final int id;
  final String title;
  final String content;
  final bool isPrivate;
  final bool isAnonymous;
  final int? assignedPastorId;
  final String? authorName;
  final PrayerStatus status;
  final int intercessionCount;
  final bool hasInterceded;
  final List<PastoralPrayerNote> pastoralNotes;
  final DateTime createdAt;

  const PrayerRequest({
    required this.id,
    required this.title,
    required this.content,
    this.isPrivate = false,
    this.isAnonymous = false,
    this.assignedPastorId,
    this.authorName,
    this.status = PrayerStatus.open,
    this.intercessionCount = 0,
    this.hasInterceded = false,
    this.pastoralNotes = const [],
    required this.createdAt,
  });

  factory PrayerRequest.fromJson(Map<String, dynamic> json) {
    final rawNotes = (json['pastoral_notes'] as List<dynamic>?) ?? [];
    return PrayerRequest(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      isPrivate: json['is_private'] as bool? ?? false,
      isAnonymous: json['is_anonymous'] as bool? ?? false,
      assignedPastorId: json['assigned_pastor_id'] as int?,
      authorName: json['author_name'] as String?,
      status: PrayerStatus.fromString(json['status'] as String? ?? 'open'),
      intercessionCount: json['intercession_count'] as int? ?? 0,
      hasInterceded: json['has_interceded'] as bool? ?? false,
      pastoralNotes: rawNotes
          .map((n) => PastoralPrayerNote.fromJson(n as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  PrayerRequest copyWith({
    int? intercessionCount,
    bool? hasInterceded,
    PrayerStatus? status,
  }) {
    return PrayerRequest(
      id: id,
      title: title,
      content: content,
      isPrivate: isPrivate,
      isAnonymous: isAnonymous,
      assignedPastorId: assignedPastorId,
      authorName: authorName,
      status: status ?? this.status,
      intercessionCount: intercessionCount ?? this.intercessionCount,
      hasInterceded: hasInterceded ?? this.hasInterceded,
      pastoralNotes: pastoralNotes,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        isPrivate,
        isAnonymous,
        assignedPastorId,
        authorName,
        status,
        intercessionCount,
        hasInterceded,
        pastoralNotes,
        createdAt,
      ];
}
