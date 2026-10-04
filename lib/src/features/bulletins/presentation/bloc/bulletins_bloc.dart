import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/bulletins/data/bulletins_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/bulletins/domain/bulletin.dart';

abstract class BulletinsEvent extends Equatable {
  const BulletinsEvent();

  @override
  List<Object?> get props => [];
}

class LoadBulletins extends BulletinsEvent {
  const LoadBulletins();
}

class RefreshBulletins extends BulletinsEvent {
  const RefreshBulletins();
}

class SelectBulletin extends BulletinsEvent {
  final Bulletin bulletin;

  const SelectBulletin(this.bulletin);

  @override
  List<Object?> get props => [bulletin];
}

abstract class BulletinsState extends Equatable {
  const BulletinsState();

  @override
  List<Object?> get props => [];
}

class BulletinsInitial extends BulletinsState {
  const BulletinsInitial();
}

class BulletinsLoading extends BulletinsState {
  const BulletinsLoading();
}

class BulletinsLoaded extends BulletinsState {
  final List<Bulletin> bulletins;
  final List<Announcement> announcements;
  final Bulletin? selectedBulletin;

  const BulletinsLoaded({
    required this.bulletins,
    required this.announcements,
    this.selectedBulletin,
  });

  List<Announcement> get urgentAnnouncements =>
      announcements.where((a) => a.isUrgent).toList();

  List<Announcement> get regularAnnouncements =>
      announcements.where((a) => !a.isUrgent).toList();

  @override
  List<Object?> get props => [bulletins, announcements, selectedBulletin];
}

class BulletinsError extends BulletinsState {
  final String message;

  const BulletinsError(this.message);

  @override
  List<Object?> get props => [message];
}

class BulletinsBloc extends Bloc<BulletinsEvent, BulletinsState> {
  final BulletinsRepository repository;

  BulletinsBloc({required this.repository}) : super(const BulletinsInitial()) {
    on<LoadBulletins>(_onLoadBulletins);
    on<RefreshBulletins>(_onRefreshBulletins);
    on<SelectBulletin>(_onSelectBulletin);
  }

  Future<void> _onLoadBulletins(
    LoadBulletins event,
    Emitter<BulletinsState> emit,
  ) async {
    emit(const BulletinsLoading());
    try {
      final bulletins = await repository.fetchBulletins();
      final announcements = await repository.fetchAnnouncements();
      emit(
        BulletinsLoaded(
          bulletins: bulletins,
          announcements: announcements,
          selectedBulletin: bulletins.isNotEmpty ? bulletins.first : null,
        ),
      );
    } catch (e) {
      emit(BulletinsError(e.toString()));
    }
  }

  Future<void> _onRefreshBulletins(
    RefreshBulletins event,
    Emitter<BulletinsState> emit,
  ) async {
    try {
      final bulletins = await repository.fetchBulletins();
      final announcements = await repository.fetchAnnouncements();
      final currentSelected = state is BulletinsLoaded
          ? (state as BulletinsLoaded).selectedBulletin
          : null;

      emit(
        BulletinsLoaded(
          bulletins: bulletins,
          announcements: announcements,
          selectedBulletin: currentSelected ??
              (bulletins.isNotEmpty ? bulletins.first : null),
        ),
      );
    } catch (e) {
      emit(BulletinsError(e.toString()));
    }
  }

  void _onSelectBulletin(
    SelectBulletin event,
    Emitter<BulletinsState> emit,
  ) {
    if (state is BulletinsLoaded) {
      final current = state as BulletinsLoaded;
      emit(
        BulletinsLoaded(
          bulletins: current.bulletins,
          announcements: current.announcements,
          selectedBulletin: event.bulletin,
        ),
      );
    }
  }
}
