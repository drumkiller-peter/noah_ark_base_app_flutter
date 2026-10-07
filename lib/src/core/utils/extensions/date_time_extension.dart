import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String toDoWMDFormat() {
    return DateFormat('EEEE, MMMM d').format(this);
  }
}
