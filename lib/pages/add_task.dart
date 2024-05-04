import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/Services/notification_services.dart';
import 'package:taskify/class_theme.dart';

import '../task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _headingController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  late DateTime? _selectedDate = null;
  late TimeOfDay? _selectedTime = null;
  bool _notify = false;

  String selectedValue = 'Medium';
  List<String> options = ['Low', 'Medium', 'High'];

  @override
  void dispose() {
    _headingController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTheme>(
        builder: (context, val, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: const Color(0xFF3DD598)),
              ),
              home: Scaffold(
                backgroundColor: val.statPage[val.currTheme],
                appBar: AppBar(
                  title: const Text(
                    "Add Task",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3DD598)),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                body: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              cursorColor: const Color(0xFF3DD598),
                              style: TextStyle(
                                  color: MyTheme.fontColor[val.currTheme]),
                              controller: _headingController,
                              maxLength: 15,
                              decoration: const InputDecoration(
                                labelText: 'Task Title',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Task Title is Necessary';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              style: TextStyle(
                                  color: MyTheme.fontColor[val.currTheme]),
                              controller: _descriptionController,
                              maxLength: 120,
                              decoration: const InputDecoration(
                                labelText: 'Description',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Description is Necessary';
                                }
                                return null;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date: ',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      color: MyTheme.fontColor[val.currTheme]),
                                ),
                                ElevatedButton(
                                  onPressed: () => _selectDate(context),
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(7.0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              val.navBtm[val.currTheme])),
                                  child: Text(
                                    _selectedDate != null
                                        ? '${_selectedDate?.year}-${_selectedDate?.month}-${_selectedDate?.day}'
                                        : 'Select Date',
                                    style: const TextStyle(
                                        color: Color(0xFF3DD598)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Time: ',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      color: MyTheme.fontColor[val.currTheme]),
                                ),
                                ElevatedButton(
                                  onPressed: () => _selectTime(context),
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(7.0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              val.navBtm[val.currTheme])),
                                  child: Text(
                                      _selectedTime != null
                                          ? '${_selectedTime?.hour}:${_selectedTime?.minute}'
                                          : 'Select Time',
                                      style: const TextStyle(
                                          color: Color(0xFF3DD598))),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Notify: ',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      color: MyTheme.fontColor[val.currTheme]),
                                ),
                                Checkbox(
                                  value: _notify,
                                  checkColor: Colors.white,
                                  activeColor: const Color(0xFF3DD598),
                                  overlayColor:
                                      MaterialStateProperty.all(Colors.white),
                                  onChanged: (value) {
                                    setState(() {
                                      _notify = value!;
                                    });
                                  },
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Priority ',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      color: MyTheme.fontColor[val.currTheme]),
                                ),
                                DropdownButton<String>(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3DD598)),
                                  borderRadius: BorderRadius.circular(30.0),
                                  value: selectedValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedValue = value!;
                                    });
                                  },
                                  items: options.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: (value == "Low")
                                                ? Colors.lime
                                                : (value == "High")
                                                    ? Colors.red
                                                    : const Color(0xFF3DD598)),
                                      ),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(7.0),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              val.navBtm[val.currTheme])),
                                  onPressed: () {
                                    if (_notify) {
                                      if (_selectedTime == null ||
                                          _selectedDate == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              "Time & Date necessary for Notification"),
                                          duration: Durations.extralong2,
                                        ));
                                      }
                                    }
                                    if (_formKey.currentState!.validate()) {
                                      Task task = Task(
                                          title: _headingController.text,
                                          description:
                                              _descriptionController.text,
                                          date: _selectedDate ?? DateTime.now(),
                                          time: _selectedTime,
                                          isCompleted: false,
                                          isNotify: _notify,
                                          priority: selectedValue);
                                      if (_notify) {
                                        if (_selectedTime == null) {
                                          SnackBar snackBar = const SnackBar(
                                            margin: EdgeInsets.all(5.0),
                                            behavior: SnackBarBehavior.floating,
                                            content: Center(
                                                child: Text(
                                                    "Specify time to Notify")),
                                            duration: Durations.long1,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          DateTime notifyDate = DateTime(
                                              task.date!.year,
                                              task.date!.month,
                                              task.date!.day,
                                              task.time!.hour,
                                              task.time!.minute);
                                          if (notifyDate
                                              .isAfter(DateTime.now())) {
                                            val.add(task, val.taskList);
                                            val.sortList(val.taskList);

                                            NotificationServices
                                                .scheduledNotification(
                                                    "Hurry!! Task To Do!!",
                                                    task.title,
                                                    notifyDate);
                                            setState(() {
                                              _headingController.clear();
                                              _selectedDate = null;
                                              _selectedTime = null;
                                              _notify = false;
                                              _descriptionController.clear();
                                              selectedValue = "Medium";
                                            });
                                          } else {
                                            SnackBar snackBar = const SnackBar(
                                              margin: EdgeInsets.all(5.0),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              content: Center(
                                                  child: Text(
                                                      "Specify Future Time!!")),
                                              duration: Durations.long1,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        }
                                      } else {
                                        val.add(task, val.taskList);
                                        val.sortList(val.taskList);
                                        setState(() {
                                          _headingController.clear();
                                          _selectedDate = null;
                                          _selectedTime = null;
                                          _notify = false;
                                          _descriptionController.clear();
                                          selectedValue = "Medium";
                                        });
                                      }
                                    }
                                  },
                                  child: const Text('Taskify',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF3DD598))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
