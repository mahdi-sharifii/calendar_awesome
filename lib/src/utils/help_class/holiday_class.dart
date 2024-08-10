class HolidayClass<T> {
  final int id;
  final DateTime date;
  final T? data;

  const HolidayClass({
    required this.id,
    required this.date,
    this.data,
  });
  @override
  String toString() {
    return "$id $date $data";
  }
}
