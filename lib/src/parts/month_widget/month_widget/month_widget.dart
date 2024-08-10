import 'package:calendar_awesome/src/cubit/calendar_cubit.dart';
import 'package:calendar_awesome/src/parts/month_widget/utils/helper/month_helper.dart';
import 'package:calendar_awesome/src/parts/month_widget/widget/event_widget.dart';
import 'package:calendar_awesome/src/parts/month_widget/widget/task_widget.dart';
import 'package:calendar_awesome/src/utils/help_class/on_change_param.dart';
import 'package:calendar_awesome/src/utils/help_class/single_date_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class MonthWidget extends StatelessWidget {
  final MonthHelper monthHelper;
  final List<String> daysWeek; /////////////
  final bool activeSelectDate;

  final void Function(OnChangeParam param) onChange;

  const MonthWidget({
    super.key,
    required this.onChange,
    required this.monthHelper,
    // this.colorToday = ,
    // this.dateSelectColor = const Color.fromARGB(255, 70, 39, 156),
    this.daysWeek = const [],
    required this.activeSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(5),
        itemCount: 49,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemBuilder: (context, index) {
          if (index < 7) {
            return Center(
              child: Transform.rotate(
                angle: monthHelper.calendarStyle.textWeekdayAngle,
                child: AutoSizeText(
                  monthHelper.calendarStyle.weekdaysText[index],
                  style: monthHelper.calendarStyle.textWeekdayStyle,
                  maxLines: 1,
                ),
              ),
            );
          }

          final int wd = monthHelper.weekdayStartMon();
          final int md = monthHelper.monDats().days;

          /// TODO
          ///             WD  Mi
          if (index > 5 + wd && index < 6 + wd + md) {
            final SingleDateClass singleDate = monthHelper.singleDate(index);

            return IgnorePointer(
              ignoring: !activeSelectDate,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<CalendarCubit>(context)
                      .setDateSelect(singleDate.thisDay);
                },
                child: Stack(
                  children: [
                    BlocConsumer<CalendarCubit, CalendarState>(
                      listenWhen: (p, c) {
                        if (p.dateSelect != c.dateSelect) {
                          return monthHelper.compareDate(
                              c.dateSelect, singleDate.thisDay);
                        }

                        return false;
                      },
                      buildWhen: (p, c) {
                        if (p.dateSelect != c.dateSelect) {
                          if (monthHelper.compareDate(
                              p.dateSelect, singleDate.thisDay)) return true;

                          return monthHelper.compareDate(
                              c.dateSelect, singleDate.thisDay);
                        }
                        return false;
                      },
                      listener: (context, state) {
                        onChange(
                          OnChangeParam(
                            date: state.dateSelect,
                            events: singleDate.events,
                            tasks: singleDate.tasks,
                            holidays: singleDate.holidays,
                          ),
                        );
                      },
                      builder: (context, state) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: singleDate.isToday
                                ? monthHelper.calendarStyle.todayColor
                                : null,
                            border: monthHelper.compareDate(
                                    state.dateSelect, singleDate.thisDay)
                                ? Border.all(
                                    color: monthHelper
                                        .calendarStyle.selectDayColor,
                                    width: monthHelper
                                        .calendarStyle.selectDayWidth,
                                  )
                                : null,
                          ),
                          child: Text(
                            monthHelper.calendarStyle.persianText
                                ? (index - (wd + 5)).toString().toPersianDigit()
                                : (index - (wd + 5)).toString(),

                            /// style
                            style: monthHelper.myTextStyle(
                                singleDate.thisDay, singleDate.holidays),
                          ),
                        );
                      },
                    ),

                    ///  green line bottom "Task"

                    TaskWidget(
                        monthHelper: monthHelper, singleDate: singleDate),

                    /// dot "Event"
                    EventWidget(
                      singleDate: singleDate,
                      calendarStyle: monthHelper.calendarStyle,
                    )
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
