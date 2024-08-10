import 'package:calendar_awesome/src/utils/help_class/calendar_style.dart';
import 'package:calendar_awesome/src/utils/help_class/event_class.dart';
import 'package:calendar_awesome/src/utils/help_class/holiday_class.dart';
import 'package:calendar_awesome/src/utils/help_class/single_date_class.dart';
import 'package:calendar_awesome/src/utils/help_class/task_class.dart';
import 'package:calendar_awesome/src/utils/months/months.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:flutter/material.dart';

class MonthHelper {
  final List<TaskClass> tasks;
  final List<HolidayClass> holidays;
  final List<EventClass> events;
  final bool jalali;
  final int year;
  final int month;
  final bool showWeekend;
  final CalendarStyle calendarStyle;

  MonthHelper({
    required this.jalali,
    required this.events,
    required this.tasks,
    required this.holidays,
    required this.year,
    required this.month,
    required this.showWeekend,
    required this.calendarStyle,
  });

  bool compareDate(Date? firstDate, Date secondDate) {
    if (firstDate == null) return false;
    if (firstDate.year != secondDate.year) return false;
    if (firstDate.month != secondDate.month) return false;
    return firstDate.day == secondDate.day;
  }

  Date now() => jalali ? Jalali.now() : Gregorian.now();

  Date customDate(int year, {int month = 1, int day = 1}) {
    return jalali ? Jalali(year, month, day) : Gregorian(year, month, day);
  }

  List<EventClass> eventQuery(Date date) {
    events.sort((a, b) => a.date.compareTo(b.date));
    List<EventClass> today = List.empty(growable: true);
    int index = 0;
    for (EventClass a in events) {
      if (compareDate(
          jalali ? a.date.toJalali() : a.date.toGregorian(), date)) {
        today.add(a);
        index++;
      } else if (index != 0) {
        break;
      }
    }

    if (index != 0) {
      events.removeRange(0, index);
    }

    return today;
  }

  List<TaskClass> taskQuery(Date date) {
    tasks.sort((a, b) => a.date.compareTo(b.date));
    List<TaskClass> today = List.empty(growable: true);
    int index = 0;
    for (TaskClass a in tasks) {
      if (compareDate(
          jalali ? a.date.toJalali() : a.date.toGregorian(), date)) {
        today.add(a);
        index++;
      } else if (index != 0) {
        break;
      }
    }
    if (index != 0) tasks.removeRange(0, index);
    return today;
  }

  List<HolidayClass> holidayQuery(Date date) {
    holidays.sort((a, b) => a.date.compareTo(b.date));
    List<HolidayClass> today = List.empty(growable: true);
    int index = 0;

    for (HolidayClass a in holidays) {
      if (compareDate(
          jalali ? a.date.toJalali() : a.date.toGregorian(), date)) {
        today.add(a);
        index++;
      } else if (index != 0) {
        break;
      }
    }

    if (index != 0) holidays.removeRange(0, index);
    return today;
  }

  TextStyle myTextStyle(Date date, List<HolidayClass> holidays) {
    const TextStyle style = TextStyle(fontSize: 20);
// print(date);
//     print(holidayQuery(date).isNotEmpty);
//     print(holidayQuery(date));

    if (holidays.isNotEmpty || weekend(date)) {
      return calendarStyle.weekendStyle ?? style.copyWith(color: Colors.red);
    }

    if (compareDate(now(), date)) {
      return calendarStyle.todayStyle ?? style.copyWith(color: Colors.white);
    }
    return calendarStyle.weekdayStyle ?? style.copyWith(color: Colors.black);
  }

  SingleDateClass singleDate(int index) {
    /// TODO
    final Date thisDay =
        customDate(year, month: month, day: index - (weekdayStartMon() + 5));

    final bool isToday = compareDate(thisDay, now());

    final List<TaskClass> todayTasks = taskQuery(thisDay);
    final bool haveTask = todayTasks.isNotEmpty;

    final List<EventClass> todayEvents = eventQuery(thisDay);

    final List<HolidayClass> todayHoliday = holidayQuery(thisDay);

    return SingleDateClass(
      thisDay: thisDay,
      events: todayEvents,
      haveTask: haveTask,
      isToday: isToday,
      tasks: todayTasks,
      holidays: todayHoliday,
    );
  }

  Month monDats() {
    final Date thisMonDate = customDate(year, month: month);

    final Month mon =
        MonthCreator.getMonAtID(month, thisMonDate.isLeapYear(), jalali);

    return mon;
  }

  int weekdayStartMon() {
    int weekDay = customDate(year, month: month).weekDay;

    if (jalali) return weekDay;

    if (weekDay == 7) return 1;
    return weekDay + 1;
  }

  bool weekend(Date date) {
    if (date.weekDay == 7) return showWeekend;
    if (!jalali && date.weekDay == 6) return showWeekend;
    return false;
  }
}
