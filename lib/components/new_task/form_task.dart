import 'package:lista_tarefas_alura_v3/components/principal/task.dart';
import 'package:lista_tarefas_alura_v3/data/task_dao.dart';
import 'package:flutter/material.dart';

class FormTask extends StatefulWidget {
  const FormTask({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dificultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 25,
        children: [
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Digite o nome da tarefa";
              }
              return null;
            },
            keyboardType: TextInputType.text,
            controller: nameController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              hintText: "Digite o nome",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: Colors.white70,
              filled: true,
            ),
          ),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Digite a dificuldade da tarefa";
              } else if (int.tryParse(value) == null) {
                return "Digite um número inteiro";
              } else if (int.tryParse(value)! < 1 || int.tryParse(value)! > 5) {
                return "Digite um número entre 1 e 5";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            controller: dificultyController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: "Dificuldade",
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              hintText: "Digite a dificuldade: 1, 2, 3, 4 ou 5",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: Colors.white70,
              filled: true,
            ),
          ),
          TextFormField(
            onChanged: (text) {
              setState(() {});
            },
            keyboardType: TextInputType.url,
            controller: imageController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: "Imagem",
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              hintText: "Digite a url da imagem",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: Colors.white70,
              filled: true,
            ),
          ),
          Container(
            height: 100,
            width: 72,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageController.text,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    "assets/images/beija_flor_flutter.png",
                    fit: BoxFit.cover,
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }

              final String name = nameController.text;
              final int dificulty = int.parse(dificultyController.text);
              final String image = imageController.text;

              TaskDao().save(Task(name, image, dificulty));

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Tarefa adicionada!",
                  ),
                ),
              );
            },
            child: Text("Adicionar"),
          ),
        ],
      ),
    );
  }
}
