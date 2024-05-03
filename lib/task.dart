import 'package:flutter/material.dart';

class Task {
  late String title;
  late String description;
  late String priority;
  late DateTime? date;
  late TimeOfDay? time;
  late bool isNotify;
  late bool isCompleted;

  Task({
    required this.date,
    required this.time,
    required this.description,
    required this.isNotify,
    required this.title,
    required this.isCompleted,
    required this.priority,
  });
}
