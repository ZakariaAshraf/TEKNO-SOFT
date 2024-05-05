import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:tekno_soft_todo/widgets/task_item_widget.dart';
import 'package:tekno_soft_todo/widgets/tasks_list.dart';

import '../core/model/task_modal.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  static String routeName = "Home_View";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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

      
        ],
      ),
    );
  }
}
