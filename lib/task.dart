import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late String priority;
  @HiveField(3)
  late DateTime? date;
  @HiveField(4)
  late TimeOfDay? time;
  @HiveField(5)
  late bool isNotify;
  @HiveField(6)
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
