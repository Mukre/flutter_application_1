import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_model.dart';
import 'package:flutter_application_1/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 80,
          child: Center(
            child: SizedBox(height: 40, width: 250 ,child: 
            TextField(
              onSubmitted: (value) {
                if (entryController.text.isNotEmpty) {
                  Task newTask = Task(entryController.text, false);
                  viewModel.addTask(newTask);
                  entryController.clear();
                }
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 5), 
              filled: true, 
              fillColor: viewModel.clrLvl2, 
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
              autocorrect: true,
              controller: entryController, 
              autofocus: true, 
              textAlign: TextAlign.center, 
              textAlignVertical: TextAlignVertical.center, 
              cursorColor: viewModel.clrLvl4,
              style: TextStyle(color: viewModel.clrLvl4, fontWeight: FontWeight.w500),
              ),),
          ),
        ),
      );
    });
  }
}