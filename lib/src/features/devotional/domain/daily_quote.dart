import 'package:equatable/equatable.dart';

class DailyQuote extends Equatable {
  final int id;
  final String content;
  final String? authorName;
  final String? date;
  final String? imageUrl;

  const DailyQuote({
    required this.id,
    required this.content,
    this.authorName,
    this.date,
    this.imageUrl,
  });

  /// Curated default Scripture of the Day fallback when device is offline or unseeded.
  static const fallback = DailyQuote(
    id: 0,
    content:
        'Do not be anxious about anything, but in every situation, by prayer and petition, with thanksgiving, present your requests to God. And the peace of God, which transcends all understanding, will guard your hearts and your minds in Christ Jesus.',
    authorName: 'Philippians 4:6-7',
    date: 'Daily Inspiration',
  );

  factory DailyQuote.fromJson(Map<String, dynamic> json) {
    String? resolvedAuthor;
    if (json['author'] != null && json['author'] is Map<String, dynamic>) {
      resolvedAuthor = (json['author'] as Map<String, dynamic>)['name'] as String?;
    } else {
      resolvedAuthor = json['author_name'] as String?;
    }

    return DailyQuote(
      id: json['id'] as int,
      content: json['content'] as String,
      authorName: resolvedAuthor,
      date: json['date'] as String?,
      imageUrl: json['image_uri'] as String? ?? json['image_url'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, content, authorName, date, imageUrl];
}
