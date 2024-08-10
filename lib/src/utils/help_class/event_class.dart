import 'package:flutter/material.dart' show Color;

class EventClass<T> {
  final int id;
  final DateTime date;
  final Color color;
  final T? data;

  const EventClass({
    required this.id,
    required this.date,
    required this.color,
    this.data,
  });


  @override
  String toString() {

    return "$id $date $color $data";
  }

}
