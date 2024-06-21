import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/task_list_screen.dart';
import 'viewmodels/task_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: MaterialApp(
        title: 'MVVM To-Do List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskListScreen(),
      ),
    );
  }
}
