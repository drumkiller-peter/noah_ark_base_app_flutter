import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/devotional/data/devotional_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/devotional/domain/daily_quote.dart';

// Events
abstract class DevotionalEvent extends Equatable {
  const DevotionalEvent();
  @override
  List<Object?> get props => [];
}

class DevotionalFetchRequested extends DevotionalEvent {
  final bool forceRefresh;
  const DevotionalFetchRequested({this.forceRefresh = false});
  @override
  List<Object?> get props => [forceRefresh];
}

// States
abstract class DevotionalState extends Equatable {
  const DevotionalState();
  @override
  List<Object?> get props => [];
}

class DevotionalInitial extends DevotionalState {
  const DevotionalInitial();
}

class DevotionalLoading extends DevotionalState {
  const DevotionalLoading();
}

class DevotionalLoaded extends DevotionalState {
  final List<DailyQuote> quotes;
  const DevotionalLoaded(this.quotes);
  @override
  List<Object?> get props => [quotes];
}

class DevotionalError extends DevotionalState {
  final String message;
  const DevotionalError(this.message);
  @override
  List<Object?> get props => [message];
}

// BLoC
class DevotionalBloc extends Bloc<DevotionalEvent, DevotionalState> {
  final DevotionalRepository repository;

  DevotionalBloc({required this.repository})
      : super(const DevotionalInitial()) {
    on<DevotionalFetchRequested>(_onFetchRequested);
  }

  Future<void> _onFetchRequested(
    DevotionalFetchRequested event,
    Emitter<DevotionalState> emit,
  ) async {
    emit(const DevotionalLoading());
    try {
      final quotes = await repository.getDailyQuotes(forceRefresh: event.forceRefresh);
      emit(DevotionalLoaded(quotes));
    } catch (e) {
      emit(DevotionalError(e.toString()));
    }
  }
}
