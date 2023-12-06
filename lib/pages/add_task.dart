import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/class_theme.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.statPage[MyTheme.currTheme],
      body: Center(
        child: Text("Add Task"),
      ),
    );
  }
}
