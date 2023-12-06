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
  void initState() {
    // TODO: implement initState
    super.initState();
    //BOTTOM < o = AND TOP STATUS BAR
    SystemUiOverlayStyle sOverlay = const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Color(0xFF2A3C44),
      statusBarIconBrightness: Brightness.light,

      systemNavigationBarColor: Color(0xFF30444E),
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,

      systemStatusBarContrastEnforced: false,
      systemNavigationBarContrastEnforced: false,
    );
    SystemChrome.setSystemUIOverlayStyle(sOverlay);
  }
  // List<Color> iconColor = [Color(0xFF3DD598),Colors.white,Colors.white,Colors.white];
  // List<Widget> pages = const [Home(), AddTask(), History(), Settings()];
  // int currPage = 0;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: CurvedNavigationBar(
            color: Color(0xFF30444E),
            backgroundColor: Color(0xFF2A3C44),
            animationDuration: Duration(milliseconds: 500),
            onTap:(index){
              setState(() {
                MyTheme.iconColor.setAll(0, [Colors.white,Colors.white,Colors.white,Colors.white]);
                MyTheme.iconColor[index] = Color(0xFF3DD598);
                MyTheme.currPage = index;
              });
            },
            items: [
              Icon(Icons.home_filled, color: MyTheme.iconColor[0], size: 30.0,),
              Icon(Icons.add_circle, color: MyTheme.iconColor[1], size: 30.0,),
              Icon(Icons.history_sharp, color: MyTheme.iconColor[2], size: 30.0,),
              Icon(Icons.settings, color: MyTheme.iconColor[3], size: 30.0,)
            ]

        ),
        body: MyTheme.pages[MyTheme.currPage],
      ),
    );
  }
  
}
