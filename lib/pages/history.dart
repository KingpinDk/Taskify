import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../class_theme.dart';
import '../widgets/task_tile.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
      builder: (context, val, child) => Scaffold(
        backgroundColor: val.statPage[val.currTheme],
        appBar: AppBar(
          title: const Text(
            "History",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3DD598)),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: (val.historyTaskList.isEmpty)
            ? Center(
                child: Image.asset(
                  "lib/assets/history_page_fill.png",
                  height: 500,
                  width: 500,
                ),
              )
            : Center(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: val.historyTaskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      TimeOfDay? time;
                      DateTime? date;
                      bool showDateHeader = index == 0 ||
                          val.historyTaskList[index - 1].date?.day !=
                              val.historyTaskList[index].date?.day ||
                          val.historyTaskList[index - 1].date?.month !=
                              val.historyTaskList[index].date?.month ||
                          val.historyTaskList[index - 1].date?.year !=
                              val.historyTaskList[index].date?.year;
                      return Column(
                        children: [
                          if (showDateHeader)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: Container(
                                width: 300,
                                padding: const EdgeInsets.all(9.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: val.navBtm[val.currTheme],
                                ),
                                child: Center(
                                  child: Text(
                                    '${val.historyTaskList[index].date?.day} / ${val.historyTaskList[index].date?.month} / ${val.historyTaskList[index].date?.year}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Color(0xFF3DD598)),
                                  ),
                                ),
                              ),
                            ),
                          taskTile(
                              icon: val.historyTaskList[index].isCompleted
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.white,
                                    )
                                  : Icon(Icons.dangerous_rounded,
                                      color: Colors.white),
                              tileColor: (val.historyTaskList[index].priority ==
                                      "Medium")
                                  ? const Color(0xFF3DD598)
                                  : (val.historyTaskList[index].priority ==
                                          "Low")
                                      ? Colors.lime.shade600
                                      : Colors.red.shade500,
                              task: val.historyTaskList[index].title,
                              taskDesc: val.historyTaskList[index].description,
                              onPressed: () {},
                              trailing: IconButton(
                                  onPressed: () {
                                    val.deleteHistory(
                                        index, val.historyTaskList);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ))),
                        ],
                      );
                    })),
      ),
    );
  }
}
