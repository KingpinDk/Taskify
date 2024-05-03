import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
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
  bool isPlaying = true;

  //double percent = 1.0;

  @override
  void dispose() {
    // TODO: implement dispose
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Consumer<MyTheme>(
        builder: (context, val, child) => Scaffold(
            backgroundColor: val.statPage[val.currTheme],
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                      height: 40.0,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: const Center(
                        child: Text(
                          "Taskify",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3DD598)),
                        ),
                      )
                      // LinearPercentIndicator(
                      //   percent: val.taskPercent,
                      //   lineHeight: 20.0,
                      //   //width: MediaQuery.of(context).size.width-12.0,
                      //   //leading: Icon(Icons.account_circle),
                      //   animationDuration: 700,
                      //   animation: true,
                      //   barRadius: const Radius.circular(40.0),
                      //   progressColor: const Color(0xFF3DD598),
                      //   // linearStrokeCap: LinearStrokeCap.round,
                      //   trailing: Icon(Icons.auto_awesome_rounded),
                      //   center: Text(
                      //     (val.taskPercent * 100).toInt().toString() + '%',
                      //     style: TextStyle(
                      //         color: Colors.white, fontWeight: FontWeight.bold),
                      //   ),
                      //   onAnimationEnd: () {
                      //     if (val.taskPercent == 1.0) {
                      //       Future.delayed(Duration(seconds: 10));
                      //       val.taskPercent = 0.0;
                      //       confettiController.stop();
                      //     }
                      //   },
                      // ),
                      ),
                  Flexible(
                    child: (val.taskList.isEmpty)
                        ? Center(
                            child: Image.asset(
                              "lib/assets/home_page_fill.png",
                              height: 500,
                              width: 500,
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: val.taskList.length,
                            itemBuilder: (BuildContext context, int index) {
                              TimeOfDay? time;
                              DateTime? date;
                              bool showDateHeader = index == 0 ||
                                  val.taskList[index - 1].date?.day !=
                                      val.taskList[index].date?.day ||
                                  val.taskList[index - 1].date?.month !=
                                      val.taskList[index].date?.month ||
                                  val.taskList[index - 1].date?.year !=
                                      val.taskList[index].date?.year;
                              return Column(
                                children: [
                                  if (showDateHeader)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 16.0),
                                      child: Container(
                                        width: 300,
                                        padding: EdgeInsets.all(9.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: val.navBtm[val.currTheme],
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${val.taskList[index].date?.day} / ${val.taskList[index].date?.month} / ${val.taskList[index].date?.year}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                color: Color(0xFF3DD598)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  taskTile(
                                    icon: Icon(
                                      Icons.label_important,
                                      color: Colors.white,
                                    ),
                                    tileColor: (val.taskList[index].priority ==
                                            "Medium")
                                        ? Color(0xFF3DD598)
                                        : (val.taskList[index].priority ==
                                                "Low")
                                            ? Colors.lime.shade600
                                            : Colors.red.shade500,
                                    task: val.taskList[index].title +
                                        index.toString(),
                                    taskDesc: val.taskList[index].description,
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder:
                                              (BuildContext context) =>
                                                  AlertDialog(
                                                    backgroundColor: val
                                                        .navBtm[val.currTheme],
                                                    title: Text(
                                                      "Never Give Up!!",
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: MyTheme
                                                                  .fontColor[
                                                              val.currTheme]),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () async {
                                                          bool showConfetti = (index ==
                                                                  0) ||
                                                              (val
                                                                          .taskList[index -
                                                                              1]
                                                                          .date
                                                                          ?.day !=
                                                                      val
                                                                          .taskList[
                                                                              index]
                                                                          .date
                                                                          ?.day ||
                                                                  val
                                                                          .taskList[index -
                                                                              1]
                                                                          .date
                                                                          ?.month !=
                                                                      val
                                                                          .taskList[
                                                                              index]
                                                                          .date
                                                                          ?.month ||
                                                                  val
                                                                          .taskList[index -
                                                                              1]
                                                                          .date
                                                                          ?.year !=
                                                                      val
                                                                          .taskList[
                                                                              index]
                                                                          .date
                                                                          ?.year);
                                                          showConfetti = showConfetti &&
                                                              ((index ==
                                                                      val.taskList
                                                                              .length -
                                                                          1) ||
                                                                  (val
                                                                              .taskList[index +
                                                                                  1]
                                                                              .date
                                                                              ?.day !=
                                                                          val
                                                                              .taskList[
                                                                                  index]
                                                                              .date
                                                                              ?.day ||
                                                                      val.taskList[index + 1].date?.month !=
                                                                          val
                                                                              .taskList[
                                                                                  index]
                                                                              .date
                                                                              ?.month ||
                                                                      val.taskList[index + 1].date?.year !=
                                                                          val
                                                                              .taskList[index]
                                                                              .date
                                                                              ?.year));
                                                          if (MyTheme
                                                                  .histIndx ==
                                                              0) {
                                                            val.historyTaskList
                                                                .add(
                                                                    val.taskList[
                                                                        index]);
                                                          }

                                                          val.delete(index,
                                                              val.taskList);
                                                          Navigator.of(context)
                                                              .pop();

                                                          if (val.taskList
                                                                  .isEmpty ||
                                                              showConfetti) {
                                                            confettiController
                                                                .play();
                                                            await Future.delayed(
                                                                Durations
                                                                    .extralong3);
                                                            confettiController
                                                                .stop();
                                                          }
                                                        },
                                                        child: Text(
                                                          "Task Complete",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF3DD598)),
                                                        ),
                                                      ),
                                                      TextButton(
                                                          onPressed: () async {
                                                            bool showConfetti = (index ==
                                                                    0) ||
                                                                (val
                                                                            .taskList[index -
                                                                                1]
                                                                            .date
                                                                            ?.day !=
                                                                        val
                                                                            .taskList[
                                                                                index]
                                                                            .date
                                                                            ?.day ||
                                                                    val
                                                                            .taskList[index -
                                                                                1]
                                                                            .date
                                                                            ?.month !=
                                                                        val
                                                                            .taskList[
                                                                                index]
                                                                            .date
                                                                            ?.month ||
                                                                    val
                                                                            .taskList[index -
                                                                                1]
                                                                            .date
                                                                            ?.year !=
                                                                        val
                                                                            .taskList[index]
                                                                            .date
                                                                            ?.year);
                                                            showConfetti = showConfetti &&
                                                                ((index ==
                                                                        val.taskList.length -
                                                                            1) ||
                                                                    (val.taskList[index + 1].date?.day != val.taskList[index].date?.day ||
                                                                        val.taskList[index + 1].date?.month !=
                                                                            val.taskList[index].date?.month ||
                                                                        val.taskList[index + 1].date?.year != val.taskList[index].date?.year));
                                                            val.delete(index,
                                                                val.taskList);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();

                                                            if (val.taskList
                                                                    .isEmpty ||
                                                                showConfetti) {
                                                              confettiController
                                                                  .play();
                                                              await Future.delayed(
                                                                  Durations
                                                                      .extralong3);
                                                              confettiController
                                                                  .stop();
                                                            }
                                                          },
                                                          child: Text(
                                                              "Discard Task",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF3DD598))))
                                                    ],
                                                  ));
                                    },
                                  ),
                                ],
                              );
                            }),
                  )
                ],
              ),
            )),
      ),
      ConfettiWidget(
        confettiController: confettiController,
        shouldLoop: false,
        blastDirection: pi / 2,
        blastDirectionality: BlastDirectionality.explosive,
        numberOfParticles: 15,
        emissionFrequency: 0.1,
      )
    ]);
  }
}
