import 'package:calendar_awesome/src/utils/help_class/event_class.dart';
import 'package:calendar_awesome/src/utils/help_class/holiday_class.dart';
import 'package:calendar_awesome/src/utils/help_class/task_class.dart';
import 'package:shamsi_date/shamsi_date.dart';

class CalendarHelper {
  final List<EventClass> events;
  final List<TaskClass> tasks;
  final List<HolidayClass> holidays;
  final bool jalali;
  final int? year;
  final bool showWeekend;
  final bool activeSelectDate;

  CalendarHelper({
    this.year,
    required this.events,
    required this.tasks,
    required this.holidays,
    required this.jalali,
    required this.showWeekend,
    required this.activeSelectDate,
  });

  Date now() => jalali ? Jalali.now() : Gregorian.now();

  Date customDate(int year, {int month = 1, int day = 1}) {
    return jalali ? Jalali(year, month, day) : Gregorian(year, month, day);
  }

  Date dateTimeToDate(DateTime date) {
    return jalali ? date.toJalali() : date.toGregorian();
  }

  List<EventClass> allEventsInMon(DateTime date) {
    if (events.isNotEmpty) {
      events.sort((a, b) => a.date.compareTo(b.date));
    }
    final Date sd = dateTimeToDate(date);
    List<EventClass> myList = List.empty(growable: true);
    // int index = 0;
    for (EventClass ev in events) {
      final Date fd = dateTimeToDate(ev.date);

      if (fd.month > sd.month) {
        if (fd.year >= sd.year) {
          break;
        }
      }

      if (fd.month == sd.month) {
        if (fd.year == sd.year) {
          myList.add(ev);
        }
      }

      // index++;
    }
    // if (index != 0) {
    // events.removeRange(0, index);
    // }
    return myList;
  }

  List<TaskClass> allTaskInMon(DateTime date) {
    if (tasks.isNotEmpty) {
      tasks.sort((a, b) => a.date.compareTo(b.date));
    }
    final Date sd = dateTimeToDate(date);
    List<TaskClass> myList = List.empty(growable: true);
    // int index = 0;
    for (TaskClass ta in tasks) {
      final Date fd = dateTimeToDate(ta.date);
      if (fd.month > sd.month) {
        if (fd.year >= sd.year) {
          break;
        }
      }

      if (fd.month == sd.month) {
        if (fd.year == sd.year) {
          myList.add(ta);
        }
      }

      // index++;
    }
    // if (index != 0) {
    //   tasks.removeRange(0, index);
    // }
    return myList;
  }

  List<HolidayClass> allHolidayInMon(DateTime date) {
    if (holidays.isNotEmpty) {
      holidays.sort((a, b) => a.date.compareTo(b.date));
    }
    final Date sd = dateTimeToDate(date);

    List<HolidayClass> myList = List.empty(growable: true);
    // int index = 0;
    for (HolidayClass hd in holidays) {
      final Date fd = dateTimeToDate(hd.date);

      if (fd.month > sd.month) {
        if (fd.year >= sd.year) {
          break;
        }
      }

      if (fd.month == sd.month) {
        if (fd.year == sd.year) {
          myList.add(hd);
        }
      }

      // index++;
    }
    // if (index != 0) {
    //   holidays.removeRange(0, index);
    // }
    return myList;
  }
}
