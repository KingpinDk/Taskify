import 'package:flutter/material.dart';
import 'package:taskify/pages/add_task.dart';
import 'package:taskify/pages/home.dart';
import 'package:taskify/pages/settings.dart';
import 'package:taskify/pages/history.dart';

class MyTheme{
  static int currTheme = 0;
  static int currPage = 0;
  static List<String> themeMode = ["Dark Mode","Light Mode"];
  static List<Color> iconColor = [Color(0xFF3DD598),Colors.white,Colors.white,Colors.white];
  static List<Widget> pages = const [Home(), AddTask(), History(), Settings()];
  static List<Icon> mode = [const Icon(Icons.dark_mode, color: Color(0xFF3DD598),), const Icon(Icons.light_mode_sharp, color: Color(0xFF3DD598),)];
}