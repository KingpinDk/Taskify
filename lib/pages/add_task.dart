import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/class_theme.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder:(context, val, child)=> Scaffold(
        backgroundColor:val.statPage[val.currTheme],
        body: Center(
          child: Text("Add Task"),
        ),
      ),
    );
  }
}
