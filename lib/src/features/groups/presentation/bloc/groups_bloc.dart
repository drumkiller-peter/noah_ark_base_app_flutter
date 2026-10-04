import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/features/groups/data/groups_repository.dart';
import 'package:noah_ark_base_app_flutter/src/features/groups/domain/group.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();

  @override
  List<Object?> get props => [];
}

class LoadGroups extends GroupsEvent {
  const LoadGroups();
}

class RefreshGroups extends GroupsEvent {
  const RefreshGroups();
}

class FilterGroupsByType extends GroupsEvent {
  final GroupType? groupType;

  const FilterGroupsByType(this.groupType);

  @override
  List<Object?> get props => [groupType];
}

class ToggleGroupMembership extends GroupsEvent {
  final int groupId;

  const ToggleGroupMembership(this.groupId);

  @override
  List<Object?> get props => [groupId];
}

abstract class GroupsState extends Equatable {
  const GroupsState();

  @override
  List<Object?> get props => [];
}

class GroupsInitial extends GroupsState {
  const GroupsInitial();
}

class GroupsLoading extends GroupsState {
  const GroupsLoading();
}

class GroupsLoaded extends GroupsState {
  final List<Group> allGroups;
  final List<Group> filteredGroups;
  final GroupType? selectedType;

  const GroupsLoaded({
    required this.allGroups,
    required this.filteredGroups,
    this.selectedType,
  });

  @override
  List<Object?> get props => [allGroups, filteredGroups, selectedType];
}

class GroupsError extends GroupsState {
  final String message;

  const GroupsError(this.message);

  @override
  List<Object?> get props => [message];
}

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final GroupsRepository repository;

  GroupsBloc({required this.repository}) : super(const GroupsInitial()) {
    on<LoadGroups>(_onLoadGroups);
    on<RefreshGroups>(_onRefreshGroups);
    on<FilterGroupsByType>(_onFilterByType);
    on<ToggleGroupMembership>(_onToggleMembership);
  }

  Future<void> _onLoadGroups(
    LoadGroups event,
    Emitter<GroupsState> emit,
  ) async {
    emit(const GroupsLoading());
    try {
      final groups = await repository.fetchGroups();
      emit(
        GroupsLoaded(
          allGroups: groups,
          filteredGroups: groups,
        ),
      );
    } catch (e) {
      emit(GroupsError(e.toString()));
    }
  }

  Future<void> _onRefreshGroups(
    RefreshGroups event,
    Emitter<GroupsState> emit,
  ) async {
    try {
      final groups = await repository.fetchGroups();
      final currentType =
          state is GroupsLoaded ? (state as GroupsLoaded).selectedType : null;

      final filtered = currentType == null
          ? groups
          : groups.where((g) => g.groupType == currentType).toList();

      emit(
        GroupsLoaded(
          allGroups: groups,
          filteredGroups: filtered,
          selectedType: currentType,
        ),
      );
    } catch (e) {
      emit(GroupsError(e.toString()));
    }
  }

  void _onFilterByType(
    FilterGroupsByType event,
    Emitter<GroupsState> emit,
  ) {
    if (state is GroupsLoaded) {
      final current = state as GroupsLoaded;
      final filtered = event.groupType == null
          ? current.allGroups
          : current.allGroups
              .where((g) => g.groupType == event.groupType)
              .toList();

      emit(
        GroupsLoaded(
          allGroups: current.allGroups,
          filteredGroups: filtered,
          selectedType: event.groupType,
        ),
      );
    }
  }

  Future<void> _onToggleMembership(
    ToggleGroupMembership event,
    Emitter<GroupsState> emit,
  ) async {
    if (state is GroupsLoaded) {
      final current = state as GroupsLoaded;
      final index = current.allGroups.indexWhere((g) => g.id == event.groupId);
      if (index == -1) return;

      final targetGroup = current.allGroups[index];
      final newIsMember = !targetGroup.isMember;
      final newMemberCount =
          targetGroup.memberCount + (newIsMember ? 1 : -1);

      final updatedGroup = targetGroup.copyWith(
        isMember: newIsMember,
        memberCount: newMemberCount < 0 ? 0 : newMemberCount,
      );

      final updatedAll = List<Group>.from(current.allGroups);
      updatedAll[index] = updatedGroup;

      final updatedFiltered = current.selectedType == null
          ? updatedAll
          : updatedAll
              .where((g) => g.groupType == current.selectedType)
              .toList();

      emit(
        GroupsLoaded(
          allGroups: updatedAll,
          filteredGroups: updatedFiltered,
          selectedType: current.selectedType,
        ),
      );

      // Perform background API call
      if (newIsMember) {
        await repository.joinGroup(event.groupId);
      } else {
        await repository.leaveGroup(event.groupId);
      }
    }
  }
}
