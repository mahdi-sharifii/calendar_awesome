class TaskClass<T> {
  final int id;
  final DateTime date;
  final T? data;

  const TaskClass({
    required this.id,
    required this.date,
    this.data,
  });

  @override
  String toString() {
    return "$id $date $data";
  }
}
