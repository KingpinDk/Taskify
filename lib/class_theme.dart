import 'package:flutter/material.dart';
import 'package:taskify/pages/add_task.dart';
import 'package:taskify/pages/home.dart';
import 'package:taskify/pages/settings.dart';
import 'package:taskify/pages/history.dart';

class MyTheme{
  static int currTheme = 1;
  static int currPage = 0;

  //settings page Font Color
  static List<Color> fontColor = [Colors.white,Colors.black];

  //settings page options
  static List<String> themeMode = ["Dark Mode","Light Mode"];
  static List<Icon> modeIcon = [const Icon(Icons.dark_mode, color: Color(0xFF3DD598),), const Icon(Icons.light_mode_sharp, color: Color(0xFF3DD598),)];

  //
  static List<Color> navBtm = [const Color(0xFF30444E),Colors.white];
  static List<Color> statPage = [const Color(0xFF2A3C44),const Color(0xFFE5E5E5)];

  //Nav Bar Icon colors
  static List<List<Color>> iconColor = [[const Color(0xFF3DD598),Colors.white,Colors.white,Colors.white],[const Color(0xFFB3B3B3),const Color(0xFFB3B3B3),const Color(0xFFB3B3B3),const Color(0xFFB3B3B3)]];
  static List<List<Color>> initialIconColor = [[Colors.white,Colors.white,Colors.white,Colors.white],[const Color(0xFFB3B3B3),const Color(0xFFB3B3B3),const Color(0xFFB3B3B3),const Color(0xFFB3B3B3)]];
  static List<Widget> pages = const [Home(), AddTask(), History(), Settings()];

}