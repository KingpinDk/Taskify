import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../class_theme.dart';
import '../widgets/task_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final confettiController = ConfettiController();
  bool isPlaying  = true;
  double percent = 0.5;

  @override
  void dispose() {
    // TODO: implement dispose
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    if(percent == 1.0) {
      confettiController.play();
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Consumer<MyTheme>(builder:(context, val, child)=> Scaffold(
          backgroundColor: val.statPage[val.currTheme],
          
          body: SafeArea(
            child: Column(

              children: [
                Container(
                  height: 40.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: LinearPercentIndicator(
                    percent: percent,
                    lineHeight: 20.0,
                    //width: MediaQuery.of(context).size.width-12.0,
                    //leading: Icon(Icons.account_circle),
                    animationDuration: 700,
                    animation: true,
                    barRadius: const Radius.circular(40.0),
                    progressColor: const Color(0xFF3DD598),
                    // linearStrokeCap: LinearStrokeCap.round,
                    trailing: Icon(Icons.auto_awesome_rounded),
                    center: Text((percent*100).toInt().toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    onAnimationEnd: (){
                      if(percent == 1.0) {
                        Future.delayed(Duration(seconds: 10));
                        confettiController.stop();
                      }
                    },
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        taskTile(icon: Icon(Icons.label_important,color: Colors.white,), tileColor: Color(0xFF3DD598), task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Colors.red.shade500, task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Colors.lime.shade600, task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Color(0xFF3DD598), task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Colors.red.shade500, task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Colors.lime.shade600, task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Color(0xFF3DD598), task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Colors.red.shade500, task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Colors.lime.shade600, task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Color(0xFF3DD598), task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Colors.red.shade500, task: 'Ultimate task',),
                        taskTile(icon: Icon(Icons.add_circle,color: Colors.white,), tileColor: Colors.lime.shade600, task: 'Ultimate task',),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
        ),
      ),
        ConfettiWidget(
          confettiController: confettiController,
          shouldLoop: false,
          blastDirection: pi/2,
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 15,
          emissionFrequency: 0.1,
        )
      ]
    );
  }
}
