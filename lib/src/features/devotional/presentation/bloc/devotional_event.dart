part of 'devotional_bloc.dart';

abstract class DevotionalEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DevotionalFetchRequested extends DevotionalEvent {
  final bool forceRefresh;

  DevotionalFetchRequested({this.forceRefresh = false});
  @override
  List<Object?> get props => [forceRefresh];
}
