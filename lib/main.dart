import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:taskify/Services/notification_services.dart';
import 'package:taskify/class_theme.dart';
import 'package:taskify/task.dart';
import 'package:taskify/widgets/curved_navigation_bar.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox("ThemeMode");
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const Taskify());
}

class Taskify extends StatefulWidget {
  const Taskify({super.key});

  @override
  State<Taskify> createState() => _TaskifyState();
}

class _TaskifyState extends State<Taskify> {
  int right = 0, left = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MyTheme())],
      child: Consumer<MyTheme>(builder: (context, val, child) {
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
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF3DD598)),
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              extendBody: false,
              extendBodyBehindAppBar: false,
              bottomNavigationBar: CurvedNavigationBar(
                  color: val.navBtm[val.currTheme],
                  backgroundColor: val.statPage[val.currTheme],
                  animationDuration: const Duration(milliseconds: 500),
                  onTap: (index) {
                    changePage(index, val);
                  },
                  items: [
                    Icon(
                      Icons.home_filled,
                      color: MyTheme.iconColor[val.currTheme][0],
                      size: 30.0,
                    ),
                    Icon(
                      Icons.add_circle,
                      color: MyTheme.iconColor[val.currTheme][1],
                      size: 30.0,
                    ),
                    Icon(
                      Icons.history_sharp,
                      color: MyTheme.iconColor[val.currTheme][2],
                      size: 30.0,
                    ),
                    Icon(
                      Icons.settings,
                      color: MyTheme.iconColor[val.currTheme][3],
                      size: 30.0,
                    )
                  ]),
              body: MyTheme.pages[val.currPage]),
        );
      }),
    );
  }

  changePage(int index, MyTheme val) {
    setState(() {
      MyTheme.iconColor[val.currTheme]
          .setAll(0, MyTheme.initialIconColor[val.currTheme]);
      MyTheme.iconColor[val.currTheme][index] = const Color(0xFF3DD598);
      val.currPage = index;
    });
  }
}
