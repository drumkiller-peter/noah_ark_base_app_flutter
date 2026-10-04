import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/app_theme.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/church_colors.dart';
import 'package:noah_ark_base_app_flutter/src/features/events/domain/event.dart';
import 'package:noah_ark_base_app_flutter/src/features/events/presentation/bloc/events_bloc.dart';

enum EventTimeFilter {
  upcoming('All Upcoming'),
  thisWeek('This Week'),
  past('Past Events');

  final String label;
  const EventTimeFilter(this.label);
}

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  EventTimeFilter _selectedFilter = EventTimeFilter.upcoming;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Church Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<EventsBloc>().add(const EventsFetchRequested()),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips: Timeframe based per ADR 0004 (sections retired)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: EventTimeFilter.values.map((filter) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(filter.label),
                      selected: _selectedFilter == filter,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _selectedFilter = filter);
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: BlocBuilder<EventsBloc, EventsState>(
              builder: (context, state) {
                if (state is EventsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is EventsLoaded) {
                  final filteredEvents = _applyTimeFilter(state.events, _selectedFilter);

                  if (filteredEvents.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.event_busy_rounded, size: 48, color: context.churchColors.textMuted),
                            const SizedBox(height: 12),
                            Text(
                              'No ${_selectedFilter.label.toLowerCase()} scheduled.',
                              style: TextStyle(fontSize: 16, color: context.churchColors.textMuted),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      final event = filteredEvents[index];
                      return _buildEventCard(context, event);
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  List<ChurchEvent> _applyTimeFilter(List<ChurchEvent> events, EventTimeFilter filter) {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final weekEnd = todayStart.add(const Duration(days: 7));

    switch (filter) {
      case EventTimeFilter.upcoming:
        return events.where((e) => e.startsAt.isAfter(todayStart.subtract(const Duration(hours: 4)))).toList();
      case EventTimeFilter.thisWeek:
        return events
            .where((e) =>
                e.startsAt.isAfter(todayStart.subtract(const Duration(hours: 4))) &&
                e.startsAt.isBefore(weekEnd))
            .toList();
      case EventTimeFilter.past:
        return events.where((e) => e.startsAt.isBefore(todayStart)).toList();
    }
  }

  Widget _buildEventCard(BuildContext context, ChurchEvent event) {
    final theme = Theme.of(context);
    final colors = context.churchColors;
    final dateStr = DateFormat('EEEE, MMMM d, yyyy').format(event.startsAt);
    final timeStr = DateFormat('h:mm a').format(event.startsAt);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: AppTheme.sanctuaryCard(colors),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateTile(colors, event.startsAt),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: colors.primary.withAlpha(25),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            'CHURCH-WIDE',
                            style: AppTheme.trackingBadge(color: colors.primary, fontSize: 9.5),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          timeStr,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      event.title,
                      style: AppTheme.serif(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        color: colors.text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dateStr,
                      style: theme.textTheme.bodySmall?.copyWith(color: colors.textMuted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (event.description != null && event.description!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              event.description!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
          if (event.location != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 16, color: colors.secondary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    event.location!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ],
          Divider(height: 24, color: colors.border.withValues(alpha: 0.5)),
          Row(
            children: [
              Icon(Icons.people_alt_outlined, size: 18, color: colors.primary),
              const SizedBox(width: 6),
              Text(
                '${event.attendingCount} attending',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
              if (event.maybeCount > 0) ...[
                const SizedBox(width: 8),
                Text(
                  '(${event.maybeCount} maybe)',
                  style: TextStyle(fontSize: 12, color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
              const Spacer(),
              _buildRsvpButton(context, event),
            ],
          ),
        ],
      ),
    );
  }

  /// The day as a small calendar tile: month above a serif day number.
  Widget _buildDateTile(ChurchColors colors, DateTime date) {
    return Container(
      width: 56,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            DateFormat('MMM').format(date).toUpperCase(),
            style: AppTheme.trackingBadge(color: colors.primary, fontSize: 10),
          ),
          const SizedBox(height: 2),
          Text(
            DateFormat('d').format(date),
            style: AppTheme.serif(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.1,
              color: colors.text,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRsvpButton(BuildContext context, ChurchEvent event) {
    final status = event.myRsvp;

    if (status == null) {
      return FilledButton.tonal(
        onPressed: () => _showRsvpDialog(context, event),
        child: const Text('RSVP'),
      );
    }

    final isAttending = status == RSVPStatus.attending;
    final isMaybe = status == RSVPStatus.maybe;

    return OutlinedButton.icon(
      icon: Icon(
        isAttending ? Icons.check_circle : (isMaybe ? Icons.help : Icons.cancel),
        size: 16,
        color: isAttending ? context.churchColors.success : (isMaybe ? context.churchColors.warning : context.churchColors.error),
      ),
      label: Text(status.label),
      onPressed: () => _showRsvpDialog(context, event),
    );
  }

  void _showRsvpDialog(BuildContext context, ChurchEvent event) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.churchColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'RSVP: ${event.title}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Let the pastoral team know if you will be attending this event:'),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.check_circle, color: context.churchColors.success),
                title: const Text('Attending'),
                selected: event.myRsvp == RSVPStatus.attending,
                onTap: () {
                  context.read<EventsBloc>().add(
                        EventRsvpSubmitted(
                           eventId: event.id,
                          status: RSVPStatus.attending,
                        ),
                      );
                  Navigator.pop(bottomSheetContext);
                },
              ),
              ListTile(
                leading: Icon(Icons.help_outline, color: context.churchColors.warning),
                title: const Text('Maybe'),
                selected: event.myRsvp == RSVPStatus.maybe,
                onTap: () {
                  context.read<EventsBloc>().add(
                        EventRsvpSubmitted(
                          eventId: event.id,
                          status: RSVPStatus.maybe,
                        ),
                      );
                  Navigator.pop(bottomSheetContext);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel_outlined, color: context.churchColors.error),
                title: const Text('Declined'),
                selected: event.myRsvp == RSVPStatus.declined,
                onTap: () {
                  context.read<EventsBloc>().add(
                        EventRsvpSubmitted(
                          eventId: event.id,
                          status: RSVPStatus.declined,
                        ),
                      );
                  Navigator.pop(bottomSheetContext);
                },
              ),
              if (event.myRsvp != null) ...[
                const Divider(),
                TextButton(
                  onPressed: () {
                    context.read<EventsBloc>().add(
                          EventRsvpWithdrawn(eventId: event.id),
                        );
                    Navigator.pop(bottomSheetContext);
                  },
                  child: Text('Withdraw My RSVP', style: TextStyle(color: context.churchColors.textMuted)),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
