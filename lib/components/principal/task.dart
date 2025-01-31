import 'package:flutter/material.dart';

import 'package:lista_tarefas_alura_v3/components/principal/content.dart';

class Task extends StatelessWidget {
  final String text;
  final String namePicture;
  final String urlPicture;
  final int dificulty;
  const Task(this.text, this.urlPicture, this.dificulty,
      {super.key, this.namePicture='beija_flor_flutter.png'});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Content(text, urlPicture, dificulty, namePicture: namePicture),
            ],
          ),
        ));
  }
}
