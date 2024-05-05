import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:provider/provider.dart';
import 'package:tekno_soft_todo/core/model/task_data.dart';

import 'package:tekno_soft_todo/widgets/tasks_list.dart';

import '../../pages/home_view.dart';
import '../../pages/setting_view.dart';
import '../../widgets/bottom_sheet_widget.dart';
import '../model/task_modal.dart';

class Home_Layout extends StatefulWidget {
  Home_Layout({Key? key}) : super(key: key);
  static String routeName = "Home_Layout";

  @override
  State<Home_Layout> createState() => _Home_LayoutState();
}

class _Home_LayoutState extends State<Home_Layout> {
  int selectedIndex = 0;

  List<Widget> pages = [
    HomeView(),
    const SettingView(),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white12,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            showAddTaskBottomSheet();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment(0, 2.6),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  color: Colors.blueAccent,
                  height: 160,
                  width: double.infinity,
                  child: Text(
                    "To Do List",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TimelineCalendar(
                  calendarType: CalendarType.GREGORIAN,
                  calendarLanguage: "en",
                  calendarOptions: CalendarOptions(
                    viewType: ViewType.DAILY,
                    toggleViewType: true,
                    headerMonthElevation: 10,
                    headerMonthShadowColor: Colors.black26,
                    headerMonthBackColor: Colors.transparent,
                  ),
                  dayOptions: DayOptions(
                      compactMode: true,
                      dayFontSize: 14.0,
                      disableFadeEffect: true,
                      weekDaySelectedColor: const Color(0xff3AC3E2),
                      differentStyleForToday: true,
                      todayBackgroundColor: Colors.black,
                      selectedBackgroundColor: const Color(0xff3AC3E2),
                      todayTextColor: Colors.white),
                  headerOptions: HeaderOptions(
                      weekDayStringType: WeekDayStringTypes.SHORT,
                      monthStringType: MonthStringTypes.FULL,
                      backgroundColor: const Color(0xff3AC3E2),
                      headerTextSize: 14,
                      headerTextColor: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),
            TasksList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 90,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_outlined,
                ),
                label: "Home",
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Settings",
              )
            ],
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            }),
      ),
    );
  }

  showAddTaskBottomSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) => BottomSheetWidget(
        addTaskCallback: (title,description,time){
          // setState(() {
          //   tasks.add(TaskModel(
          //       title: title,
          //       description: description,
          //       dateTime:time,
          //       ));
          //   Navigator.pop(context);
          // });
        },
      ),
    );
  }
}
