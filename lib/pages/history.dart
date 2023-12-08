import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../class_theme.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder:(context, val, child)=> Scaffold(
        backgroundColor: val.statPage[val.currTheme],
        body: Center(
          child:Text("History")
        ),
      ),
    );
  }
}
