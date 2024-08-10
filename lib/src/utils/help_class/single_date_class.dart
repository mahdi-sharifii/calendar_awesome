import 'package:calendar_awesome/src/utils/help_class/task_class.dart';
import 'package:shamsi_date/shamsi_date.dart' show Date;
import 'event_class.dart';
import 'holiday_class.dart';

class SingleDateClass {
  final Date thisDay;
  final bool haveTask;
  final bool isToday;

  final List<EventClass> events;
  final List<TaskClass> tasks;
  final List<HolidayClass> holidays;

  const SingleDateClass({
    required this.thisDay,
    required this.events,
    required this.haveTask,
    required this.isToday,
    required this.tasks,
    required this.holidays,
  });
}
