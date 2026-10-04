import 'package:equatable/equatable.dart';

class Hymn extends Equatable {
  final int id;
  final int hymnNumber;
  final String titleEn;
  final String titleNe;
  final String lyricsEn;
  final String lyricsNe;
  final String? audioUrl;
  final String? videoUrl;
  final bool isBookmarked;

  const Hymn({
    required this.id,
    required this.hymnNumber,
    required this.titleEn,
    required this.titleNe,
    required this.lyricsEn,
    required this.lyricsNe,
    this.audioUrl,
    this.videoUrl,
    this.isBookmarked = false,
  });

  factory Hymn.fromJson(Map<String, dynamic> json) {
    return Hymn(
      id: json['id'] as int,
      hymnNumber: json['hymn_number'] as int? ?? json['number'] as int? ?? 1,
      titleEn: json['title_en'] as String? ?? '',
      titleNe: json['title_ne'] as String? ?? '',
      lyricsEn: json['lyrics_en'] as String? ?? '',
      lyricsNe: json['lyrics_ne'] as String? ?? '',
      audioUrl: json['audio_url'] as String?,
      videoUrl: json['video_url'] as String?,
      isBookmarked: json['is_bookmarked'] as bool? ?? false,
    );
  }

  Hymn copyWith({bool? isBookmarked}) {
    return Hymn(
      id: id,
      hymnNumber: hymnNumber,
      titleEn: titleEn,
      titleNe: titleNe,
      lyricsEn: lyricsEn,
      lyricsNe: lyricsNe,
      audioUrl: audioUrl,
      videoUrl: videoUrl,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  List<Object?> get props => [
        id,
        hymnNumber,
        titleEn,
        titleNe,
        lyricsEn,
        lyricsNe,
        audioUrl,
        videoUrl,
        isBookmarked,
      ];
}
