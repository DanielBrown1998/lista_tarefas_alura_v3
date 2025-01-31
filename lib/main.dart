import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura_v3/data/task_inherited.dart';
import 'package:lista_tarefas_alura_v3/screens/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String titleMaterial = "Flutter Alura";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleMaterial,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: TaskInherited(child: Principal()),
    );
  }
}
