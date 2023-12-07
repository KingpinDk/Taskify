import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskify/class_theme.dart';


void main() {
  runApp(Taskify());
}

class Taskify extends StatefulWidget {
  const Taskify({super.key});

  @override
  State<Taskify> createState() => _TaskifyState();
}

class _TaskifyState extends State<Taskify> {


  @override
  Widget build(BuildContext context) {

    SystemUiOverlayStyle sOverlay = SystemUiOverlayStyle(
      statusBarColor: MyTheme.statPage[MyTheme.currTheme],
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,

      systemNavigationBarColor: MyTheme.navBtm[MyTheme.currTheme],
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,

      systemStatusBarContrastEnforced: false,
      systemNavigationBarContrastEnforced: false,
    );
    SystemChrome.setSystemUIOverlayStyle(sOverlay);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: false,
        bottomNavigationBar: CurvedNavigationBar(
            color: MyTheme.navBtm[MyTheme.currTheme],
            backgroundColor: MyTheme.statPage[MyTheme.currTheme],
            animationDuration: const Duration(milliseconds: 500),
            onTap:(index){
              changePage(index);
            },
            items: [
              Icon(Icons.home_filled, color: MyTheme.iconColor[MyTheme.currTheme][0], size: 30.0,),
              Icon(Icons.add_circle, color: MyTheme.iconColor[MyTheme.currTheme][1], size: 30.0,),
              Icon(Icons.history_sharp, color: MyTheme.iconColor[MyTheme.currTheme][2], size: 30.0,),
              Icon(Icons.settings, color: MyTheme.iconColor[MyTheme.currTheme][3], size: 30.0,)
            ]

        ),
        body: MyTheme.pages[MyTheme.currPage],
      ),
    );
  }
  changePage(int index){
    setState(() {
      MyTheme.iconColor[MyTheme.currTheme].setAll(0, MyTheme.initialIconColor[MyTheme.currTheme]);
      MyTheme.iconColor[MyTheme.currTheme][index] = const Color(0xFF3DD598);
      MyTheme.currPage = index;
    });
  }
}
