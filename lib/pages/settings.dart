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
      backgroundColor: Color(0xFF2A3C44),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFF30444E),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.rectangle
              ),
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Center(
                child: ListTile(
                  leading: MyTheme.mode[MyTheme.currTheme],
                  title: Text(MyTheme.themeMode[MyTheme.currTheme]),
                  onTap: changeTheme,
                  titleTextStyle: TextStyle(
                      fontSize: 20.0
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
  }
}
