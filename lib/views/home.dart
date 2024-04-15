import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/views/task_list_view.dart';

import 'add_task_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = "/home";

@override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header View
              Expanded(flex: 1, child: Center(
                child: Text("Bem vindo!")
              )),
              // Task List View
              Expanded(flex: 7, child: TaskListView()),
            ],
          ),
        ),
        floatingActionButton: AddTaskView());
  }
}