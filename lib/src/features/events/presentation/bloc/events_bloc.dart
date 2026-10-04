import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/events/data/events_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/events/domain/event.dart';

// Events
abstract class EventsEvent extends Equatable {
  const EventsEvent();
  @override
  List<Object?> get props => [];
}

class EventsFetchRequested extends EventsEvent {
  final DateTime? fromDate;
  final DateTime? toDate;
  const EventsFetchRequested({this.fromDate, this.toDate});
  @override
  List<Object?> get props => [fromDate, toDate];
}

class EventRsvpSubmitted extends EventsEvent {
  final int eventId;
  final RSVPStatus status;
  final int guestCount;
  const EventRsvpSubmitted({
    required this.eventId,
    required this.status,
    this.guestCount = 0,
  });
  @override
  List<Object?> get props => [eventId, status, guestCount];
}

class EventRsvpWithdrawn extends EventsEvent {
  final int eventId;
  const EventRsvpWithdrawn({required this.eventId});
  @override
  List<Object?> get props => [eventId];
}

// States
abstract class EventsState extends Equatable {
  const EventsState();
  @override
  List<Object?> get props => [];
}

class EventsInitial extends EventsState {
  const EventsInitial();
}

class EventsLoading extends EventsState {
  const EventsLoading();
}

class EventsLoaded extends EventsState {
  final List<ChurchEvent> events;
  const EventsLoaded(this.events);
  @override
  List<Object?> get props => [events];
}

class EventsError extends EventsState {
  final String message;
  const EventsError(this.message);
  @override
  List<Object?> get props => [message];
}

// BLoC
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventsRepository repository;

  EventsBloc({required this.repository}) : super(const EventsInitial()) {
    on<EventsFetchRequested>(_onFetchRequested);
    on<EventRsvpSubmitted>(_onRsvpSubmitted);
    on<EventRsvpWithdrawn>(_onRsvpWithdrawn);
  }

  Future<void> _onFetchRequested(
    EventsFetchRequested event,
    Emitter<EventsState> emit,
  ) async {
    emit(const EventsLoading());
    try {
      final events = await repository.getEvents(
        fromDate: event.fromDate,
        toDate: event.toDate,
      );
      emit(EventsLoaded(events));
    } catch (e) {
      emit(EventsError(e.toString()));
    }
  }

  Future<void> _onRsvpSubmitted(
    EventRsvpSubmitted event,
    Emitter<EventsState> emit,
  ) async {
    if (state is EventsLoaded) {
      final currentEvents = (state as EventsLoaded).events;
      final updated = currentEvents.map((e) {
        if (e.id == event.eventId) {
          final wasAttending = e.myRsvp == RSVPStatus.attending;
          final wasMaybe = e.myRsvp == RSVPStatus.maybe;
          final wasDeclined = e.myRsvp == RSVPStatus.declined;

          var attending = e.attendingCount;
          var maybe = e.maybeCount;
          var declined = e.declinedCount;

          if (wasAttending) attending--;
          if (wasMaybe) maybe--;
          if (wasDeclined) declined--;

          if (event.status == RSVPStatus.attending) attending++;
          if (event.status == RSVPStatus.maybe) maybe++;
          if (event.status == RSVPStatus.declined) declined++;

          return e.copyWith(
            myRsvp: event.status,
            attendingCount: attending < 0 ? 0 : attending,
            maybeCount: maybe < 0 ? 0 : maybe,
            declinedCount: declined < 0 ? 0 : declined,
          );
        }
        return e;
      }).toList();

      emit(EventsLoaded(updated));
      await repository.setRsvp(
        eventId: event.eventId,
        status: event.status.value,
        guestCount: event.guestCount,
      );
    }
  }

  Future<void> _onRsvpWithdrawn(
    EventRsvpWithdrawn event,
    Emitter<EventsState> emit,
  ) async {
    if (state is EventsLoaded) {
      final currentEvents = (state as EventsLoaded).events;
      final updated = currentEvents.map((e) {
        if (e.id == event.eventId) {
          var attending = e.attendingCount;
          var maybe = e.maybeCount;
          var declined = e.declinedCount;

          if (e.myRsvp == RSVPStatus.attending) attending--;
          if (e.myRsvp == RSVPStatus.maybe) maybe--;
          if (e.myRsvp == RSVPStatus.declined) declined--;

          return e.copyWith(
            myRsvp: null,
            attendingCount: attending < 0 ? 0 : attending,
            maybeCount: maybe < 0 ? 0 : maybe,
            declinedCount: declined < 0 ? 0 : declined,
          );
        }
        return e;
      }).toList();

      emit(EventsLoaded(updated));
      await repository.withdrawRsvp(event.eventId);
    }
  }
}
