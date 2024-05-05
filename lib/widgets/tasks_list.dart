import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tekno_soft_todo/widgets/task_item_widget.dart';

import '../core/model/task_data.dart';
import '../core/model/task_modal.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.tasks.length,
          itemBuilder: (context, index) {
            return TaskItemWidget(
              taskModal: value.tasks[index],
              removeTask: () {
                value.removeTask(value.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
