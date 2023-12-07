import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskify/class_theme.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.statPage[MyTheme.currTheme],
      body: SafeArea(
        child: ListView(

          children: [
            const SizedBox(height: 10.0,),
            MyTile(MyTheme.navBtm[MyTheme.currTheme], MyTheme.modeIcon[MyTheme.currTheme], MyTheme.themeMode[MyTheme.currTheme], MyTheme.fontColor[MyTheme.currTheme], changeTheme),
            const SizedBox(height: 10.0,),
            MyTile(MyTheme.navBtm[MyTheme.currTheme], MyTheme.rateUsIcon, MyTheme.rateUsString, MyTheme.fontColor[MyTheme.currTheme],(){}),
            const SizedBox(height: 10.0,),
            MyTile(MyTheme.navBtm[MyTheme.currTheme], MyTheme.shareWithFrndsIcon, MyTheme.shareWithFrndsString, MyTheme.fontColor[MyTheme.currTheme],(){}),
            const SizedBox(height: 10.0,),
            MyTile(MyTheme.navBtm[MyTheme.currTheme], MyTheme.historyIcon[MyTheme.histIndx], MyTheme.historyString[MyTheme.histIndx], MyTheme.fontColor[MyTheme.currTheme],(){}),
            const SizedBox(height: 10.0,),
            MyTile(MyTheme.navBtm[MyTheme.currTheme], MyTheme.modeIcon[MyTheme.currTheme], MyTheme.themeMode[MyTheme.currTheme], MyTheme.fontColor[MyTheme.currTheme],(){}),
            const SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }

  void changeTheme(){
    setState(() {
      if(MyTheme.currTheme == 0) {
        MyTheme.currTheme = 1;
      } else {
        MyTheme.currTheme = 0;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Move to next page for Complete changes"), duration: Duration(milliseconds: 600),));
  }

  Widget MyTile(Color tileColor, Icon icon, String str, Color fontColor, function){
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: tileColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle
      ),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Center(
        child: ListTile(
          leading: icon,
          title: Text(str),
          onTap: function,
          titleTextStyle: TextStyle(
              fontSize: 20.0,
              color: fontColor
          ),

        ),
      ),
    );
  }
}
