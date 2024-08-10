import 'package:calendar_awesome/src/parts/month_widget/utils/helper/month_helper.dart';
import 'package:calendar_awesome/src/utils/help_class/single_date_class.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final MonthHelper monthHelper;
  final SingleDateClass singleDate;

  const TaskWidget({
    super.key,
    required this.monthHelper,
    required this.singleDate,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        height: 3,
        width: double.infinity,
        decoration: BoxDecoration(
          color:
          singleDate.haveTask ? monthHelper.calendarStyle.taskColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}