import 'package:calendar_awesome/src/cubit/calendar_cubit.dart';
import 'package:calendar_awesome/src/parts/calendar_widget/calendar_widget/main_page.dart';
import 'package:calendar_awesome/src/parts/calendar_widget/utils/calendar_helper.dart';
import 'package:calendar_awesome/src/utils/help_class/calendar_style.dart';
import 'package:calendar_awesome/src/utils/help_class/custom_date.dart';
import 'package:calendar_awesome/src/utils/help_class/event_class.dart';
import 'package:calendar_awesome/src/utils/help_class/holiday_class.dart';
import 'package:calendar_awesome/src/utils/help_class/on_change_param.dart';
import 'package:calendar_awesome/src/utils/help_class/task_class.dart';
import 'package:calendar_awesome/src/utils/months/months.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarAwesome extends StatelessWidget {
  /// To determine the type, year and month of the default calendar
  /// [JalaliDate(1403,5)] & [GregorianDate(2024,9)]
  final CustomDate date;

  /// A list that takes the class [EventClass] and is shown as a dot above the days
  final List<EventClass> events;

  /// A list that takes the class [TaskClass] and is shown linearly under the days
  final List<TaskClass> tasks;

  /// A list that takes a [HolidayClass] class that displays dates as holidays
  final List<HolidayClass> holidays;

  /// Weekends are closed or not
  final bool showWeekend;

  /// The user can choose a day or not
  final bool activeSelectDate;

  /// Gets the [CalendarStyle] class to customize the UI
  final CalendarStyle calendarStyle;

  /// Custom header instead of default header
  final Widget Function(PageController controller, Month month)? header;

  /// When a day is clicked, it returns the values of that day
  final void Function(OnChangeParam onChangeParam) onChange;

  const CalendarAwesome({
    super.key,
    required this.date,
    this.events = const [],
    this.tasks = const [],
    this.holidays = const [],
    this.showWeekend = true,
    this.activeSelectDate = true,
    this.calendarStyle = const CalendarStyle(),
    this.header,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalendarCubit>(
      create: (context) => CalendarCubit(),
      child: MainPage(
        calendarHelper: CalendarHelper(
          jalali: date is JalaliDate,
          year: date.year,
          tasks: tasks,
          events: events,
          holidays: holidays,
          activeSelectDate: activeSelectDate,
          showWeekend: showWeekend,
        ),
        calendarStyle: calendarStyle,
        date: date,
        onChange: onChange,
      ),
    );
  }
}
