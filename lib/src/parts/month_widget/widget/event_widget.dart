import 'package:auto_size_text/auto_size_text.dart';
import 'package:calendar_awesome/src/utils/help_class/calendar_style.dart';
import 'package:calendar_awesome/src/utils/help_class/single_date_class.dart';
import 'package:flutter/material.dart';


class EventWidget extends StatelessWidget {
  final SingleDateClass singleDate;
  final CalendarStyle calendarStyle;

  const EventWidget(
      {super.key, required this.singleDate, required this.calendarStyle});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 7,
      right: 7,
      child: Row(
        children: List.generate(
          singleDate.events.length >4? 3 : 4,
          (index) {
            if (singleDate.events.length > 4) {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                width: 11,
                height: 11,
                decoration: BoxDecoration(
                  color: singleDate.events[index].color,
                  shape: BoxShape.circle,
                ),
                child: index == 2
                    ? AutoSizeText(
                        (singleDate.events.length - 3).toString(),
                        style: calendarStyle.todayStyle,
                        minFontSize: 8,
                      )
                    : null,
              );
            }

            if (index + 1 > singleDate.events.length) {
              return const SizedBox();
            }

            return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: singleDate.events[index].color,
                  shape: BoxShape.circle,
                ),
               );
          },
        ),
      ),
    );
  }
}
