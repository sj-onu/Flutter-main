import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagerApp());
}
class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme:ThemeData(
        brightness: Brightness.dark
      ) ,
      themeMode: ThemeMode.light,
    );
  }
}

