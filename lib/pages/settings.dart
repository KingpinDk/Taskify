import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taskify/class_theme.dart';
import 'package:url_launcher/url_launcher.dart';

typedef SnackBarDisplayer = void Function(SnackBar);

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder: (context, val, child) => Scaffold(
        backgroundColor: val.statPage[val.currTheme],
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.modeIcon[val.currTheme],
                  MyTheme.themeMode[val.currTheme],
                  MyTheme.fontColor[val.currTheme],
                  val.changeTheme),
              const SizedBox(
                height: 10.0,
              ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.historyIcon[MyTheme.histIndx],
                  MyTheme.historyString[MyTheme.histIndx],
                  MyTheme.fontColor[val.currTheme],
                  powHistory),
              const SizedBox(
                height: 10.0,
              ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.rateUsIcon,
                  MyTheme.rateUsString,
                  MyTheme.fontColor[val.currTheme],
                  rateUs),
              const SizedBox(
                height: 10.0,
              ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.shareWithFrndsIcon,
                  MyTheme.shareWithFrndsString,
                  MyTheme.fontColor[val.currTheme],
                  shareApp),
              const SizedBox(
                height: 10.0,
              ),
              // MyTile(
              //     val.navBtm[val.currTheme],
              //     MyTheme.autoIcon[MyTheme.autoIndx],
              //     MyTheme.autoPostPoneString[MyTheme.autoIndx],
              //     MyTheme.fontColor[val.currTheme],
              //     powAutoPostPone),
              // const SizedBox(
              //   height: 10.0,
              // ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.supportUsIcon,
                  MyTheme.supportUsString,
                  MyTheme.fontColor[val.currTheme],
                  () {}),
              const SizedBox(
                height: 10.0,
              ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.feedBackIcon,
                  MyTheme.feedBackString,
                  MyTheme.fontColor[val.currTheme],
                  feedBack),
              const SizedBox(
                height: 10.0,
              ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.languagesIcon,
                  MyTheme.languagesString,
                  MyTheme.fontColor[val.currTheme], () {
                ScaffoldMessenger.of(context).showSnackBar(
                    customSnack("More Languages Will be added soon!!"));
              }),
              const SizedBox(
                height: 10.0,
              ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.ourOtherAppsIcon,
                  MyTheme.ourOtherAppsString,
                  MyTheme.fontColor[val.currTheme],
                  otherApps),
              const SizedBox(
                height: 10.0,
              ),
              MyTile(
                  val.navBtm[val.currTheme],
                  MyTheme.aboutUsIcon,
                  MyTheme.aboutUsString,
                  MyTheme.fontColor[val.currTheme],
                  aboutDev),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void feedBack() {
    String mailUrl = "mailto:simplykingpin@gmail.com";
    _launchURL(mailUrl);
  }

  void otherApps() {
    _launchURL("https://github.com/KingpinDk/Taskify");
  }

  void rateUs() {
    _launchURL("https://github.com/KingpinDk/Taskify");
  }

  void shareApp() async {
    var urlPreview = "https://github.com/KingpinDk/Taskify";
    await Share.share(
        "Hey!! Checkout this awesome Task Manager app \n\n$urlPreview");
  }

  Future<void> _launchURL(url) async {
    await launchUrl(Uri.parse(url));
    // if (await canLaunchUrl(Uri.parse(url))) {
    //
    // } else {
    //   showSnackBar(customSnack("Sorry! Something went wrong try again!!"));
    // }
  }

  void aboutDev() {
    _launchURL("https://dharanikumaran.netlify.app/");
  }

  // void powAutoPostPone() {
  //   setState(() {
  //     MyTheme.autoIndx ^= 1;
  //   });
  // }

  void powHistory() {
    setState(() {
      MyTheme.histIndx ^= 1;
    });
    var box = Hive.box("ThemeMode");
    box.put("histIndx", MyTheme.histIndx);
  }

  SnackBar customSnack(str) {
    return SnackBar(
      margin: const EdgeInsets.all(5.0),
      behavior: SnackBarBehavior.floating,
      content: Center(child: Text(str)),
      duration: Durations.long1,
    );
  }

  Widget MyTile(
      Color tileColor, Icon icon, String str, Color fontColor, function) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: tileColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Center(
        child: ListTile(
          leading: icon,
          title: Text(str),
          onTap: function,
          titleTextStyle: TextStyle(fontSize: 20.0, color: fontColor),
        ),
      ),
    );
  }
}
