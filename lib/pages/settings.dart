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
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: MyTheme.navBtm[MyTheme.currTheme],
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.rectangle
              ),
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Center(
                child: ListTile(
                  leading: MyTheme.modeIcon[MyTheme.currTheme],
                  title: Text(MyTheme.themeMode[MyTheme.currTheme]),
                  onTap: changeTheme,
                  titleTextStyle: TextStyle(
                      fontSize: 20.0,
                    color: MyTheme.fontColor[MyTheme.currTheme]
                  ),

                ),
              ),
            )
          ],
        )
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
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Move to Next Page"), duration: Duration(milliseconds: 300),));
  }
}
