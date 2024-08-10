import 'package:calendar_awesome/src/cubit/calendar_cubit.dart';
import 'package:calendar_awesome/src/parts/calendar_widget/utils/calendar_helper.dart';
import 'package:calendar_awesome/src/parts/calendar_widget/widget/header.dart';
import 'package:calendar_awesome/src/parts/month_widget/month_widget/month_widget.dart';
import 'package:calendar_awesome/src/parts/month_widget/utils/helper/month_helper.dart';
import 'package:calendar_awesome/src/utils/help_class/calendar_style.dart';
import 'package:calendar_awesome/src/utils/help_class/custom_date.dart';
import 'package:calendar_awesome/src/utils/help_class/on_change_param.dart';
import 'package:calendar_awesome/src/utils/months/months.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  final CalendarHelper calendarHelper;
  final CalendarStyle calendarStyle;
  final CustomDate date;
  final Widget Function(PageController controller, Month month)? header;
  final void Function(OnChangeParam onChangeParam) onChange;

  const MainPage({
    super.key,
    required this.calendarHelper,
    required this.calendarStyle,
    required this.date,
    this.header,
    required this.onChange,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CalendarCubit>(context).init(widget.calendarHelper
        .customDate(widget.date.year, month: widget.date.month));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.calendarStyle.direction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<CalendarCubit, CalendarState>(
            buildWhen: (p, c) =>
                (p.controller != c.controller || p.month != c.month),
            builder: (context, state) {
              if (state.controller == null) return const SizedBox();

              if (widget.header != null) {
                return widget.header!(state.controller!, state.month!);
              }

              return Header(
                controller: state.controller!,
                calendarStyle: widget.calendarStyle,
              );
            },
          ),
          AspectRatio(
            aspectRatio: 1,
            child: BlocBuilder<CalendarCubit, CalendarState>(
              buildWhen: (p, c) => p.dateInit != c.dateInit,
              builder: (context, state) {
                if (state.month != null) {
                  return PageView.builder(
                    scrollDirection: widget.calendarStyle.scrollDirection,
                    onPageChanged: (v) {
                      BlocProvider.of<CalendarCubit>(context)
                          .monthChange(v + 1);
                    },
                    controller: state.controller,
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      final DateTime date = widget.calendarHelper
                          .customDate(
                            widget.calendarHelper.year ??
                                widget.calendarHelper.now().year,
                            month: index + 1,
                          )
                          .toDateTime();

                      return MonthWidget(
                        monthHelper: MonthHelper(
                          jalali: widget.calendarHelper.jalali,
                          events: widget.calendarHelper.allEventsInMon(date),
                          holidays: widget.calendarHelper.allHolidayInMon(date),
                          tasks: widget.calendarHelper.allTaskInMon(date),
                          year: widget.calendarHelper.year ??
                              widget.calendarHelper.now().year,
                          showWeekend: widget.calendarHelper.showWeekend,
                          month: index + 1,
                          calendarStyle: widget.calendarStyle,
                        ),
                        onChange: widget.onChange,
                        activeSelectDate:
                            widget.calendarHelper.activeSelectDate,
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
