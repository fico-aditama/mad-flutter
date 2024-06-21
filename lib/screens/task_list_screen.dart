import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../viewmodels/task_view_model.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, taskViewModel, child) {
          List<Task> tasks = taskViewModel.tasks;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              Task task = tasks[index];
              return ListTile(
                title: Text(task.title),
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    taskViewModel.toggleTaskCompletion(task.id);
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    taskViewModel.deleteTask(task.id);
                  },
                ),
                onTap: () {
                  _editTask(context, taskViewModel, task);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTask(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Enter task title'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                String title = titleController.text.trim();
                if (title.isNotEmpty) {
                  Provider.of<TaskViewModel>(context, listen: false)
                      .addTask(title);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editTask(BuildContext context, TaskViewModel taskViewModel, Task task) {
    TextEditingController titleController = TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Enter task title'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                String title = titleController.text.trim();
                if (title.isNotEmpty) {
                  Task updatedTask = Task(
                    id: task.id,
                    title: title,
                    isCompleted: task.isCompleted,
                  );
                  taskViewModel.updateTask(updatedTask);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
