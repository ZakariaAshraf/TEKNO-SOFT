import 'package:flutter/material.dart';
import 'package:tekno_soft_todo/core/model/task_modal.dart';

class TaskData extends ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(
      title: "buying",
      description: "buy bread",
      dateTime: DateTime.now(),
    ),
  ];

  ///// add tasks data
  void addTask(String title, String description, DateTime date) {
    tasks.add(
      TaskModel(
        title: title,
        description: description,
        dateTime: date,
      ),
    );
    notifyListeners();
  }
  void removeTask(TaskModel) {
    tasks.remove(TaskModel);
    notifyListeners();
  }
}
