import 'package:flutter/material.dart';

Widget taskTile(
    {required Icon icon,
    required Color tileColor,
    required String task,
    required VoidCallback onPressed,
    Widget trailing = const Text(""),
    String taskDesc = "Just Do it",
    Duration timeLimit = const Duration(hours: 24)}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    decoration: BoxDecoration(
        color: tileColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle),
    margin:
        const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
    child: Center(
      child: ListTile(
        leading: icon,
        trailing: trailing,
        title: Text(
          task,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          taskDesc,
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
        onTap: onPressed,
        titleTextStyle: TextStyle(fontSize: 20.0, color: Colors.white54),
      ),
    ),
  );
}
