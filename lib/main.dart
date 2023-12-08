import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context)=>MyTheme())
      ],
      child: Consumer<MyTheme>(
        builder:(context, val, child){
          SystemUiOverlayStyle sOverlay = SystemUiOverlayStyle(
            statusBarColor: val.statPage[val.currTheme],
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,

            systemNavigationBarColor: val.navBtm[val.currTheme],
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
                color: val.navBtm[val.currTheme],
                backgroundColor: val.statPage[val.currTheme],
                animationDuration: const Duration(milliseconds: 500),
                onTap:(index){
                  changePage(index, val);
                },
                items: [
                  Icon(Icons.home_filled, color: MyTheme.iconColor[val.currTheme][0], size: 30.0,),
                  Icon(Icons.add_circle, color: MyTheme.iconColor[val.currTheme][1], size: 30.0,),
                  Icon(Icons.history_sharp, color: MyTheme.iconColor[val.currTheme][2], size: 30.0,),
                  Icon(Icons.settings, color: MyTheme.iconColor[val.currTheme][3], size: 30.0,)
                ]

            ),
            body: MyTheme.pages[MyTheme.currPage],
          ),
        );
        }
      ),
    );
  }
  changePage(int index, MyTheme val){
    setState(() {
      MyTheme.iconColor[val.currTheme].setAll(0, MyTheme.initialIconColor[val.currTheme]);
      MyTheme.iconColor[val.currTheme][index] = const Color(0xFF3DD598);
      MyTheme.currPage = index;
    });
  }
}
