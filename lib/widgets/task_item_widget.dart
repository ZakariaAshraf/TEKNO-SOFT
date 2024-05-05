import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tekno_soft_todo/core/model/task_data.dart';

import '../core/model/task_modal.dart';

class TaskItemWidget extends StatefulWidget {
  final TaskModel taskModal;
  final void Function() removeTask;

  // final  Function(bool) isChange;
  TaskItemWidget({
    Key? key,
    required this.taskModal, required this.removeTask,
  }) : super(key: key);

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return (widget.taskModal.isDone)
        ? Container(
            width: 352,
            height: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.red,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Consumer<TaskData>(
              builder: (context, value, child) {
                return Slidable(
                  startActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.
                          flex: 2,
                          onPressed: (context) {
                            value.removeTask(widget.taskModal);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ]),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    width: 352,
                    height: 115,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 8,
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              widget.taskModal.title,
                              style: theme.textTheme.titleLarge!
                                  .copyWith(color: Colors.blue),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                //Icon(Icons.access_time_rounded) ,
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  widget.taskModal.description,
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(color: Colors.black, fontSize: 15),
                                ),

                              ],
                            ),
                            Text(
                              DateFormat.yMMMd().format(widget.taskModal.dateTime),
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(color: theme.primaryColor),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.taskModal.isChanged();
                            });

                            // isChange(taskModal.isDone);
                            print(widget.taskModal.isDone);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 80,
                            height: 50,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 352,
            height: 115,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 8,
                  height: 100,
                ),
                const Expanded(
                    child: Center(
                        child: Text(
                  "Completed Task ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )))
              ],
            ),
          );
  }
}
