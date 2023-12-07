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
  //theme
  static List<String> themeMode = ["Light Mode","Dark Mode"];
  static List<Icon> modeIcon = [const Icon(Icons.light_mode_sharp, color: Color(0xFF3DD598),), const Icon(Icons.dark_mode, color: Color(0xFF3DD598),)];

  //Rate Us
  static String rateUsString = "Rate Us";
  static Icon rateUsIcon = const Icon(Icons.star, color: Color(0xFF3DD598),);

  //Share With Friends
  static String shareWithFrndsString = "Share With Friends";
  static Icon shareWithFrndsIcon = const Icon(Icons.share_rounded, color: Color(0xFF3DD598),);

  //Support Us
  static String supportUsString = "Support Us";
  static Icon supportUsIcon = const Icon(Icons.auto_awesome_sharp, color: Color(0xFF3DD598),);

  //History
  static int histIndx = 0;
  static List<String> historyString = ["History: ON", "History: OFF"];
  static List<Icon> historyIcon = [const Icon(Icons.history, color: Color(0xFF3DD598),),const Icon(Icons.history_toggle_off, color: Color(0xFF3DD598),)];

  //Auto PostPone
  static int autoIndx = 0;
  static List<String> autoPostPoneString = ["Auto PostPone: ON","Auto PostPone: OFF"];
  static List<Icon> autoIcon = [const Icon(Icons.next_plan, color: Color(0xFF3DD598),),const Icon(Icons.next_plan_outlined, color: Color(0xFF3DD598),),];

  //Feed Back
  static String feedBackString = "Feed back";
  static Icon feedBackIcon = const Icon(Icons.feedback, color: Color(0xFF3DD598),);

  //Languages
  static String languagesString = "Languages";
  static Icon languagesIcon = const Icon(Icons.language, color: Color(0xFF3DD598),);

  //Privacy
  static String privacyString = "Privacy";
  static Icon privacyIcon = const Icon(Icons.shield_sharp, color: Color(0xFF3DD598),);

  //Our Other Apps
  static String ourOtherAppsString = "Our Other Apps";
  static Icon ourOtherAppsIcon = const Icon(Icons.apps, color: Color(0xFF3DD598),);

  //About Us
  static String aboutUsString = "About Us";
  static Icon aboutUsIcon = const Icon(Icons.pets_rounded, color: Colors.orange,);

  //bottom navigation bar and screen elements
  static List<Color> navBtm = [const Color(0xFF30444E),Colors.white];
  //system status bar and screen background
  static List<Color> statPage = [const Color(0xFF2A3C44),const Color(0xFFE5E5E5)];

  //Nav Bar Icon colors
  static List<List<Color>> iconColor = [[const Color(0xFF3DD598),Colors.white,Colors.white,Colors.white],[const Color(0xFF3DD598),const Color(0xFFB3B3B3),const Color(0xFFB3B3B3),const Color(0xFFB3B3B3)]];
  static List<List<Color>> initialIconColor = [[Colors.white,Colors.white,Colors.white,Colors.white],[const Color(0xFFB3B3B3),const Color(0xFFB3B3B3),const Color(0xFFB3B3B3),const Color(0xFFB3B3B3)]];
  static List<Widget> pages = const [Home(), AddTask(), History(), Settings()];

}