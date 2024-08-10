part of 'calendar_cubit.dart';

class CalendarState {
  Date? dateSelect;
  Month? month;
  Date? dateInit;
  bool? jalali;
  final PageController? controller;

  CalendarState({
    this.dateSelect,
    this.dateInit,
    this.month,
    this.jalali,
    this.controller,
  });

  CalendarState copyWith({
    Date? newDateSelect,
    Month? newMonth,
    Date? newDateInit,
    bool? newJalali,
    PageController? newController,
  }) {
    return CalendarState(
      dateSelect: newDateSelect ?? dateSelect,
      month: newMonth ?? month,
      jalali: newJalali ?? jalali,
      dateInit: newDateInit ?? dateInit,
      controller: newController ?? controller,
    );
  }
}
