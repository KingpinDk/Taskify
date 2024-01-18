import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/class_theme.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder:(context, val, child)=> Scaffold(
        backgroundColor: val.statPage[val.currTheme],
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.modeIcon[val.currTheme], MyTheme.themeMode[val.currTheme], MyTheme.fontColor[val.currTheme], val.changeTheme),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.rateUsIcon, MyTheme.rateUsString, MyTheme.fontColor[val.currTheme],(){}),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.shareWithFrndsIcon, MyTheme.shareWithFrndsString, MyTheme.fontColor[val.currTheme],(){}),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.historyIcon[MyTheme.histIndx], MyTheme.historyString[MyTheme.histIndx], MyTheme.fontColor[val.currTheme],powHistory),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.autoIcon[MyTheme.autoIndx], MyTheme.autoPostPoneString[MyTheme.autoIndx], MyTheme.fontColor[val.currTheme],powAutoPostPone),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.supportUsIcon, MyTheme.supportUsString, MyTheme.fontColor[val.currTheme], (){}),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.feedBackIcon, MyTheme.feedBackString, MyTheme.fontColor[val.currTheme], (){}),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.languagesIcon, MyTheme.languagesString, MyTheme.fontColor[val.currTheme], (){}),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.ourOtherAppsIcon, MyTheme.ourOtherAppsString, MyTheme.fontColor[val.currTheme], (){}),
              const SizedBox(height: 10.0,),
              MyTile(val.navBtm[val.currTheme], MyTheme.aboutUsIcon, MyTheme.aboutUsString, MyTheme.fontColor[val.currTheme], (){}),
              const SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }

  void powAutoPostPone(){
    setState(() {
      MyTheme.autoIndx ^= 1;
    });
  }
  void powHistory(){
    setState(() {
      MyTheme.histIndx ^= 1;
    });
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
