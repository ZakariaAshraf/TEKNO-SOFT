import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tekno_soft_todo/core/home_layout/home_layout.dart';
import 'package:tekno_soft_todo/pages/home_view.dart';
import 'package:tekno_soft_todo/pages/setting_view.dart';

import 'core/model/task_data.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => TaskData(),
      child: MaterialApp(
        title: 'To Do App',
        debugShowCheckedModeBanner: false,
        initialRoute: Home_Layout.routeName,
        routes: {
          Home_Layout.routeName: (context) => Home_Layout(),
          HomeView.routeName: (context) => HomeView(),
          SettingView.routeName: (context) => SettingView(),
        },
      ),
    );
  }
}
