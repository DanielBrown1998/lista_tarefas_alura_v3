import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura_v3/components/principal/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
    Task('Math', '', 4),
    Task("Dart", '', 3),
    Task("FLutter", '', 4),
    Task("Python", '', 3),
    Task("Docker", '', 4),
    Task("Java", '', 5),
  ];

  void newTask(String title, String urlPicture, int dificulty,
      {String photo = 'beija_flor_flutter.png'}) {
    taskList.add(Task(title, urlPicture, dificulty, namePicture: photo));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return taskList != oldWidget.taskList;
  }
}
