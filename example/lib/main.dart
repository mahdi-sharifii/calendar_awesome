import 'package:calendar_awesome/calendar_awesome.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final DateTime _dateTime = DateTime.now();

  List<EventClass> events = [];

  List<TaskClass> tasks = [];

  List<HolidayClass> holiday = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calendar Awesome Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarAwesome(
              date: GregorianDate(_dateTime.year, _dateTime.month),
              showWeekend: true,
              activeSelectDate: true,

              holidays: [
                HolidayClass<String>(
                  id: 0,
                  date: _dateTime.add(const Duration(days: 2)),
                  data: "Holiday 1",
                ),
                HolidayClass<String>(
                  id: 1,
                  date: _dateTime.add(const Duration(days: 37)),
                  data: "Holiday 2",
                ),
              ],

              /// tasks
              tasks: [
                TaskClass<String>(
                  id: 0,
                  date: _dateTime.add(const Duration(days: 7)),
                  data: "Task 1",
                ),
                TaskClass<String>(
                  id: 1,
                  date: _dateTime.add(const Duration(days: 4)),
                  data: "Task 2",
                ),
                TaskClass<String>(
                  id: 2,
                  date: _dateTime.add(const Duration(days: 31)),
                  data: "Task 3",
                ),
              ],

              events: [
                EventClass<String>(
                  id: 0,
                  date: _dateTime.add(const Duration(days: 7)),
                  color: Colors.blue,
                  data: "Event 1",
                ),
                EventClass<String>(
                  id: 0,
                  date: _dateTime.add(const Duration(days: 7)),
                  color: Colors.orange,
                  data: "Event 2",
                ),
                EventClass<String>(
                  id: 0,
                  date: _dateTime.add(const Duration(days: 17)),
                  color: Colors.green,
                  data: "Event 3",
                ),
                EventClass<String>(
                  id: 0,
                  date: _dateTime.add(const Duration(days: 39)),
                  color: Colors.green,
                  data: "Event 4",
                ),
              ],

              calendarStyle: const CalendarStyle(
                animationDuration: Duration(seconds: 1),
                weekendStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
                weekdayStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                todayStyle: TextStyle(color: Colors.white, fontSize: 20),
                todayColor: Colors.indigo,
                textWeekdayStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                selectDayWidth: 3,
                selectDayColor: Colors.orange,
                taskColor: Colors.greenAccent,
                textWeekdayAngle: 0.2,
                scrollDirection: Axis.horizontal,
                weekdaysText: [
                  'Sun',
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thur',
                  'Fri',
                  'Sat'
                ],
                animationCurve: Curves.bounceIn,
                persianText: false,
                direction: TextDirection.ltr,
              ),
              onChange: (OnChangeParam onChangeParam) {
                setState(() {
                  events = onChangeParam.events;
                  tasks = onChangeParam.tasks;
                  holiday = onChangeParam.holidays;
                  // print(onChangeParam.date);
                });
              },
            ),
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Task List
                  Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) => MyCard(
                        text: tasks[index].data,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),

                  /// Event List
                  Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (BuildContext context, int index) => MyCard(
                        text: events[index].data,
                        color: events[index].color,
                      ),
                    ),
                  ),

                  /// Holiday List
                  Expanded(
                    child: ListView.builder(
                      itemCount: holiday.length,
                      itemBuilder: (BuildContext context, int index) => MyCard(
                        text: holiday[index].data,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String text;
  final Color color;

  const MyCard({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(milliseconds: 110),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 12,
                offset: const Offset(1, 5),
              )
            ],
            border: Border.all(color: color, width: 3)),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}

class g extends StatelessWidget {
  const g({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarAwesome(
      date: const GregorianDate(2024, 8),

      /// or JalaliDate(1403,5)
      onChange: (onChangeParam) {
        print(onChangeParam.date);
        print(onChangeParam.tasks);
        print(onChangeParam.events);
        print(onChangeParam.holidays);
      },
    );
  }
}
