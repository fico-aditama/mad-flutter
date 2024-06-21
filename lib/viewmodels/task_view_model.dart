import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> _tasks = [
    Task(id: 1, title: 'Task 1'),
    Task(id: 2, title: 'Task 2'),
    Task(id: 3, title: 'Task 3'),
  ];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    int newId = _tasks.isNotEmpty ? _tasks.last.id + 1 : 1;
    Task newTask = Task(id: newId, title: title);
    _tasks.add(newTask);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    int index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void deleteTask(int taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    notifyListeners();
  }

  void toggleTaskCompletion(int taskId) {
    Task? task = _tasks.firstWhere((task) => task.id == taskId, orElse: () => Task(id: -1, title: "", isCompleted: false));
    if (task.id != -1) {
      task.isCompleted = !task.isCompleted;
      notifyListeners();
    }
  }
}
