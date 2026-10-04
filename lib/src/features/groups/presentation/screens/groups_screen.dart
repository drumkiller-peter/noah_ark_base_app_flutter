import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/app_theme.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/church_colors.dart';
import 'package:noah_ark_base_app_flutter/src/features/groups/domain/group.dart';
import 'package:noah_ark_base_app_flutter/src/features/groups/presentation/bloc/groups_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<GroupsBloc>().add(const RefreshGroups());
            },
          ),
        ],
      ),
      body: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, state) {
          if (state is GroupsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GroupsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: context.churchColors.error),
                    const SizedBox(height: 12),
                    Text('Failed to load groups: ${state.message}'),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () {
                        context.read<GroupsBloc>().add(const LoadGroups());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is GroupsLoaded) {
            return Column(
              children: [
                // Filter chips
                SizedBox(
                  height: 52,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: const Text('All Fellowships'),
                          selected: state.selectedType == null,
                          onSelected: (_) {
                            context
                                .read<GroupsBloc>()
                                .add(const FilterGroupsByType(null));
                          },
                        ),
                      ),
                      ...GroupType.values.map(
                        (type) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(type.label),
                            selected: state.selectedType == type,
                            onSelected: (_) {
                              context.read<GroupsBloc>().add(
                                    FilterGroupsByType(
                                      state.selectedType == type ? null : type,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 1),

                // Groups list
                Expanded(
                  child: state.filteredGroups.isEmpty
                      ? const Center(
                          child: Text('No groups found for this category.'),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            context
                                .read<GroupsBloc>()
                                .add(const RefreshGroups());
                          },
                          child: ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: state.filteredGroups.length,
                            itemBuilder: (context, index) {
                              final group = state.filteredGroups[index];
                              return _buildGroupCard(context, group);
                            },
                          ),
                        ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildGroupCard(BuildContext context, Group group) {
    final theme = Theme.of(context);
    final badgeColor = _getGroupTypeColor(context, group.groupType);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: AppTheme.sanctuaryCard(context.churchColors),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Title & Category badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    group.name,
                    style: AppTheme.serif(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      color: context.churchColors.text,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeColor.withAlpha(25),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: badgeColor.withAlpha(100)),
                  ),
                  child: Text(
                    group.groupType.label.toUpperCase(),
                    style: AppTheme.trackingBadge(color: badgeColor, fontSize: 9.5),
                  ),
                ),
              ],
            ),

            if (group.description != null && group.description!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                group.description!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],

            const SizedBox(height: 14),

            // Meeting schedule & location
            if (group.meetingSchedule != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 16, color: context.churchColors.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        group.meetingSchedule!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            if (group.meetingLocation != null)
              Row(
                children: [
                  Icon(Icons.place_outlined, size: 16, color: context.churchColors.secondary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      group.meetingLocation!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),

            Divider(height: 24, color: context.churchColors.border.withValues(alpha: 0.5)),

            // Action row: Member count + Join/Leave button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.groups_outlined, size: 18, color: context.churchColors.textMuted),
                    const SizedBox(width: 6),
                    Text(
                      '${group.memberCount} members',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (group.materialUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.menu_book, size: 16),
                          label: const Text('Study Material'),
                          onPressed: () => _openUrl(group.materialUrl!),
                        ),
                      ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            group.isMember ? theme.colorScheme.surfaceContainerHighest : context.churchColors.primary,
                        foregroundColor: group.isMember ? theme.colorScheme.onSurface : context.churchColors.onPrimary,
                      ),
                      onPressed: () {
                        context
                            .read<GroupsBloc>()
                            .add(ToggleGroupMembership(group.id));
                      },
                      child: Text(group.isMember ? 'Joined' : 'Join Group'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getGroupTypeColor(BuildContext context, GroupType type) {
    switch (type) {
      case GroupType.bibleStudy:
        return context.churchColors.primary;
      case GroupType.choir:
        return context.churchColors.warning;
      case GroupType.outreach:
        return context.churchColors.secondary;
      case GroupType.ministry:
        return context.churchColors.info;
      case GroupType.other:
        return context.churchColors.error;
    }
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
