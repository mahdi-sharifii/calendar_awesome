import 'package:flutter/material.dart';

class CalendarStyle {
  /// Style text of holidays
  final TextStyle? weekendStyle;

  /// Text style of days of the week
  final TextStyle? weekdayStyle;

  /// Weekday text style
  final TextStyle textWeekdayStyle;

  /// Left to right and right to left calendar
  final TextDirection direction;

  /// Task color under the days
  final Color taskColor;

  /// The thickness of the circle around the selected day
  final double selectDayWidth;

  // final double todayColorOpacity;
  /// Use of Persian text
  final bool persianText;

  /// Movement model between pages
  final Axis scrollDirection;

  /// Duration animation of moving between pages
  final Duration animationDuration;

  /// Type of animation to move between pages
  final Curve animationCurve;

  /// Today's text style
  final TextStyle? todayStyle;

  /// Amount of weekday text rotation
  final double textWeekdayAngle;

  /// Today's color
  final Color todayColor;

  ///  The color of the circle around the selected day
  final Color selectDayColor;

  /// List of text days of the week
  final List<String> weekdaysText;

  const CalendarStyle({
    this.weekendStyle,
    this.weekdayStyle,
    this.textWeekdayStyle = const TextStyle(color: Colors.black),
    this.direction = TextDirection.ltr,
    this.textWeekdayAngle = 0.7,
    this.todayColor = const Color.fromARGB(255, 70, 39, 156),
    this.todayStyle,
    this.taskColor = Colors.greenAccent,
    this.selectDayWidth = 1.2,
    this.persianText = false,
    this.scrollDirection = Axis.horizontal,
    this.animationDuration = const Duration(milliseconds: 800),
    this.animationCurve = Curves.easeOutCubic,
    this.selectDayColor = const Color.fromARGB(255, 70, 39, 156),
    this.weekdaysText = const [
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thur",
      "Fri",
      "Sat"
    ],
  });
}
