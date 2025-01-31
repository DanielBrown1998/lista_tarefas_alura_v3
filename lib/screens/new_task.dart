import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura_v3/components/new_task/form_task.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white70,
        title: Text('Nova Tarefa'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 650,
            width: 375,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormTask(taskContext: taskContext),
            ),
          ),
        ),
      ),
    );
  }
}
