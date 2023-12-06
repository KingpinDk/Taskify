import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../class_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.statPage[MyTheme.currTheme],
      body: Center(child: Text("Home Page"))
    );
  }
}
