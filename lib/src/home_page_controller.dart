

import 'package:flutter/material.dart';
import 'package:task/models/task_model.dart';

class HomePageController{

  final TextEditingController  taskTitleController = TextEditingController();
  final TextEditingController  taskDetailsController = TextEditingController();


    List<TaskModel> taskList =[

        // TaskModel(taskName: "Demo 1", taskDetails: '1. Hello world\n2. Hello world\n3. Hello world\n ', isComplete: true),

      ];
    void addNewTask() {
      taskList.add(
        TaskModel(taskName: taskTitleController.text, taskDetails: taskDetailsController.text, isComplete: false)

      );
      taskTitleController.clear();
      taskDetailsController.clear();

    }

    void markComplete(int index){

      taskList[index].isComplete = !taskList[index].isComplete;

    }
}
