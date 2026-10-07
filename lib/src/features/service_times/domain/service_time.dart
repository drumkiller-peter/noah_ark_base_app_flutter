import 'package:equatable/equatable.dart';

/// One of the church's regular weekly worship gatherings, such as
/// "Nepali Worship, Saturday 10:00 AM, Main Hall" (see `GLOSSARY.md`).
///
/// The time is the church's own wall-clock time, with no time zone, so it is
/// compared against the phone's local time as it is.
class ServiceTime extends Equatable {
  final int id;
  final String name;

  /// [DateTime.monday] to [DateTime.sunday].
  final int weekday;
  final int hour;
  final int minute;
  final String? location;

  const ServiceTime({
    required this.id,
    required this.name,
    required this.weekday,
    required this.hour,
    required this.minute,
    this.location,
  });

  /// The backend's day names, in [DateTime.weekday] order (Monday is 1).
  static const _dayNames = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday',
  ];

  factory ServiceTime.fromJson(Map<String, dynamic> json) {
    final time = (json['time'] as String).split(':');
    return ServiceTime(
      id: json['id'] as int,
      name: json['name'] as String,
      weekday: _dayNames.indexOf(json['weekday'] as String) + 1,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      location: json['location'] as String?,
    );
  }

  /// The day's name, capitalised: "Saturday".
  String get dayName {
    final name = _dayNames[weekday - 1];
    return '${name[0].toUpperCase()}${name.substring(1)}';
  }

  /// 12-hour time, such as "10:00 AM".
  String get formattedTime {
    final h = hour % 12 == 0 ? 12 : hour % 12;
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m ${hour < 12 ? 'AM' : 'PM'}';
  }

  /// When this gathering next starts, at or after [now].
  DateTime nextAfter(DateTime now) {
    final daysAhead = (weekday - now.weekday) % 7;
    final start = DateTime(
      now.year,
      now.month,
      now.day + daysAhead,
      hour,
      minute,
    );
    return start.isBefore(now) ? start.add(const Duration(days: 7)) : start;
  }

  /// The gathering in [serviceTimes] that starts soonest after [now], or
  /// `null` when the church has none.
  static ServiceTime? next(List<ServiceTime> serviceTimes, DateTime now) {
    if (serviceTimes.isEmpty) return null;
    return serviceTimes.reduce(
      (a, b) => b.nextAfter(now).isBefore(a.nextAfter(now)) ? b : a,
    );
  }

  @override
  List<Object?> get props => [id, name, weekday, hour, minute, location];
}
