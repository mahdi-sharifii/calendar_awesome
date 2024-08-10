import 'package:calendar_awesome/src/utils/help_class/task_class.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'event_class.dart';
import 'holiday_class.dart';

class OnChangeParam {
  final Date? date;
  final List<EventClass> events;
  final List<TaskClass> tasks;
  final List<HolidayClass> holidays;

  const OnChangeParam({
    required this.date,
    required this.events,
    required this.tasks,
    required this.holidays,
  });
}
