import 'package:calendar_awesome/src/cubit/calendar_cubit.dart';
import 'package:calendar_awesome/src/utils/help_class/calendar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  final PageController controller;
  final CalendarStyle calendarStyle;

  const Header({
    super.key,
    required this.controller,
    required this.calendarStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              if (controller.page != 0) {
                controller.animateToPage(
                  (controller.page! - 1).toInt(),
                  duration: calendarStyle.animationDuration,
                  curve: calendarStyle.animationCurve,
                );
              }
            },
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(Icons.arrow_back_ios, size: 15),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 3.2 / 1,
            child: BlocBuilder<CalendarCubit, CalendarState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(state.month?.name ?? ""),
                    Text(
                      state.dateInit?.year.toString() ?? "",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          InkWell(
            onTap: () => controller.nextPage(
              duration: calendarStyle.animationDuration,
              curve: calendarStyle.animationCurve,
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(Icons.arrow_forward_ios, size: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
