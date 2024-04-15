import 'package:flutter/material.dart';
import 'package:flutter_application_1/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        decoration: BoxDecoration(
          color: viewModel.clrLvl2, borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
        ),
        child: ListView.separated(itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              viewModel.deleteTask(index);
            },
            background: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.red.shade300, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Icon(Icons.delete, color: Colors.red.shade700,),
              ),
            ),
            key: UniqueKey(),
            child: Container(
              decoration: BoxDecoration(
                color: viewModel.clrLvl1,
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListTile(
                leading: Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  side: BorderSide(width: 2, color: viewModel.clrLvl3),
                  checkColor: viewModel.clrLvl1,
                  activeColor: viewModel.clrLvl3,
                  value: viewModel.getTaskValue(index),
                  onChanged: (value) {
                    viewModel.setTaskValue(index, value!);
                  },
                  ),
                  title: Text(viewModel.getTaskTitle(index), style: TextStyle(color: viewModel.clrLvl4, fontSize: 17, fontWeight: FontWeight.w500),),
              ),
            ),
          );
        },
        padding: const EdgeInsets.all(15), 
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        }, itemCount: viewModel.getNumTasks()),

      );

    });
  }
}