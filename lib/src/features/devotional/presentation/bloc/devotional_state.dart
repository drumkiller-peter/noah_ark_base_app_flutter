// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'devotional_bloc.dart';

enum DevotionalStatus { initial, loading, loaded, error }

class DevotionalState extends Equatable {
  final DevotionalStatus? status;
  final List<DailyQuote>? quotes;
  final String? errorFetchingQuotes;

  const DevotionalState({
    this.status = DevotionalStatus.initial,
    this.quotes,
    this.errorFetchingQuotes,
  });

  @override
  List<Object?> get props => [status, quotes, errorFetchingQuotes];

  DevotionalState copyWith({
    DevotionalStatus? status,
    List<DailyQuote>? quotes,
    String? errorFetchingQuotes,
  }) {
    return DevotionalState(
      status: status ?? this.status,
      quotes: quotes ?? this.quotes,
      errorFetchingQuotes: errorFetchingQuotes ?? this.errorFetchingQuotes,
    );
  }
}
