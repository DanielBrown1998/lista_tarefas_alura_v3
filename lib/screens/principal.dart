import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura_v3/components/principal/task.dart';
import 'package:lista_tarefas_alura_v3/data/task_dao.dart';
import 'package:lista_tarefas_alura_v3/screens/new_task.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String titleAppbar = "Lista de Tarefas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white70,
        leading: Icon(Icons.account_balance_outlined),
        title: Text(titleAppbar),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 80),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando...")
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando...")
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("Carregando...")
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            "Não há tarefas",
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                    );
                  }
                  return Text("ERROR! tarefas não carregadas");
              }
            }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white70,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (newContext) => FormScreen(taskContext: context)),
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
