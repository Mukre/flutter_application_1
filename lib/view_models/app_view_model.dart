import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("Maurício");

  Color clrLvl1 = Colors.grey.shade50;
  Color clrLvl2 = Colors.grey.shade200;
  Color clrLvl3 = Colors.grey.shade800;
  Color clrLvl4 = Colors.grey.shade900;

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  bool getTaskValue(int taskIndex){
    return tasks[taskIndex].complete;
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title; 
  }

  int getNumTasks() {
    return tasks.length;
  }

    void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }
}