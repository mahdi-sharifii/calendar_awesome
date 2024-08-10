import 'package:bloc/bloc.dart';
import 'package:calendar_awesome/src/utils/months/months.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarState());

  void init(Date date) {
    emit(
      state.copyWith(
        newMonth: MonthCreator.getMonAtID(
          date.month,
          date.isLeapYear(),
          date is Jalali,
        ),
        newDateInit: date,
        newJalali: date is Jalali,
        // newDateSelect: date,
        newController: PageController(initialPage: date.month - 1),
      ),
    );
  }

  void setDateSelect(Date date) => emit(state.copyWith(newDateSelect: date));

  void monthChange(int mon) => emit(
        state.copyWith(
          newMonth: MonthCreator.getMonAtID(
            mon,
            state.dateInit!.isLeapYear(),
            state.jalali!,
          ),
        ),
      );
}
