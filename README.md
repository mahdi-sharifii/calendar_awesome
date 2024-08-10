# calendar_awesome

A customizable calendar widget (Jalali & Gregorian) for Flutter



![](https://github.com/mahdi-sharifii/calendar_awesome/example/screenshots/screenshots2.gif)



## Installation

Run this command:

```bash
flutter pub add calendar_awesome
```

or
Include instructions on how to install your library using pubspec.yaml:

```yaml
dependencies:
  calendar_awesome: ^0.0.1
```

## Simple Usage

```dart
import 'package:calendar_awesome/calendar_awesome.dart';

CalendarAwesome(
  date: const GregorianDate(2024, 8), /// or JalaliDate(1403,5) 
  onChange: (onChangeParam) {
  print(onChangeParam.date);
  print(onChangeParam.tasks);
  print(onChangeParam.events);
  print(onChangeParam.holidays);
  }
)

```

## Properties for `CalendarAwesome`

|         Property | Description                                                                                                |                  Type                  | Required | Default value   |
|-----------------:|:-----------------------------------------------------------------------------------------------------------|:--------------------------------------:|:--------:|-----------------|
|             date | To determine the type, year and month of the default calendar `GregorianDate(2024,8)`&`JalaliDate(1403,5)` |               CustomDate               |   YES    |                 |
|           events | A list that takes the class `EventClass` and is shown as a dot above the days                              |            List<EventClass>            |    no    | []              |
|            tasks | A list that takes the class `TaskClass` and is shown linearly under the days                               |            List<TaskClass>             |    no    | []              |
|         holidays | A list that takes a `HolidayClass` class that displays dates as holidays                                   |           List<HolidayClass>           |    no    | []              |
|      showWeekend | Weekends are closed or not                                                                                 |                  bool                  |    no    | true            |
| activeSelectDate | The user can choose a day or not                                                                           |                  bool                  |    no    | true            |
|    calendarStyle | Gets the `CalendarStyle` class to customize the UI                                                         |             CalendarStyle              |    no    | CalendarStyle() |
|           header | Custom header instead of default header                                                                    | Widget Function(PageController, Month) |    no    | null            |
|         onChange | When a day is clicked, it returns the values of that day                                                   |      void Function(OnChangeParam)      |   YES    |                 |

## Properties for `CalendarStyle`

|          Property | Description                                         |     Type      | Required | Default value                                      |
|------------------:|:----------------------------------------------------|:-------------:|:--------:|----------------------------------------------------|
|      weekendStyle | Style text of holidays                              |   TextStyle   |    no    | null                                               |
|      weekdayStyle | Text style of days of the week                      |   TextStyle   |    no    | null                                               |
|  textWeekdayStyle | Weekday text style                                  |   TextStyle   |    no    | TextStyle(color: Colors.black)                     |
|         direction | Left to right and right to left calendar            | TextDirection |    no    | TextDirection.ltr                                  |
|  textWeekdayAngle | Amount of weekday tax rotation                      |    double     |    no    | 0.7                                                |
|        todayColor | Today's color                                       |     Color     |    no    | Color.fromARGB(255, 70, 39, 156),                  |
|        todayStyle | Today's text style                                  |   TextStyle   |    no    | null                                               |
|         taskColor | Task color under the days                           |     Color     |    no    | Colors.greenAccent                                 |
|    selectDayWidth | The thickness of the circle around the selected day |    double     |    no    | 1.2                                                |
|       persianText | Use of Persian text                                 |     bool      |    no    | false                                              |
|   scrollDirection | Movement model between pages                        |     Axis      |    no    | null                                               |
| animationDuration | Duration animation of moving between pages          |   Duration    |    no    | null                                               |
|    animationCurve | Type of animation to move between pages             |     Curve     |    no    | null                                               |
|    selectDayColor | The color of the circle around the selected day     |     Color     |    no    | null                                               |
|      weekdaysText | List of text days of the week                       | List<String>  |    no    | ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"] |

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)