import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget taskTile({required Icon icon, required Color tileColor, required String task, String taskDesc = "Just Do it", Duration timeLimit = const Duration(hours: 24)}){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.0),

    decoration: BoxDecoration(
        color: tileColor,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle
    ),
    margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
    child: Center(
      child: ListTile(
        leading: icon,
        title: Text(task, style: TextStyle(color: Colors.white),),
        subtitle: Text(taskDesc, style: TextStyle(color: Colors.white54),),
        onTap: (){},
        titleTextStyle: TextStyle(
            fontSize: 20.0,
            color: Colors.white54
        ),

      ),
    ),
  );
}