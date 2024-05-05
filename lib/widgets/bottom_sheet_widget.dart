
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tekno_soft_todo/widgets/tasks_list.dart';

import '../core/model/task_data.dart';
import 'custom_text_form_field.dart';
class BottomSheetWidget extends StatefulWidget {
 final Function(String title ,String desc , DateTime selectedTime) addTaskCallback;
  BottomSheetWidget({required this.addTaskCallback});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  DateTime selectedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Add a new task",
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
            ),
            CustomTextFormField(
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a title";
                  } else if (value.length < 10) {
                    return "Title must be at least 10 characters";
                  } else
                    return null;
                },
                title: "Enter your task title",
                controller: titleController),
            CustomTextFormField(
                maxLines: 4,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a description";
                  } else if (value.length < 10) {
                    return "Title must be at least 10 characters";
                  } else
                    return null;
                },
                title: "Enter your task description",
                controller: descriptionController),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Select time",
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    ShowCalendar(context);
                  },
                  child: Text(
                    DateFormat.yMMMd().format(selectedTime),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.primaryColor),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
                onPressed: (){
                  Provider.of<TaskData>(context,listen: false).addTask(titleController.text, descriptionController.text, selectedTime);
                  // widget.addTaskCallback(titleController.text,descriptionController.text,selectedTime);
                  Navigator.pop(context);
                },
                child: Text(
                  "Add task",
                  style:TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  ShowCalendar(BuildContext context) async {
    var dateSelected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add((const Duration(days: 365,)),
        ),
    );
    if (dateSelected==null)return;
    selectedTime=dateSelected;
    setState(() {});
  }
}
