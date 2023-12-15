import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../class_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final confettiController = ConfettiController();
  bool isPlaying  = true;
  double percent = 1.0;

  @override
  void dispose() {
    // TODO: implement dispose
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(percent == 1.0) {
      confettiController.play();
    }
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Consumer<MyTheme>(builder:(context, val, child)=> Scaffold(
            backgroundColor: val.statPage[val.currTheme],
          body: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 20),
              child: LinearPercentIndicator(
                percent: percent,
                lineHeight: 20.0,
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
