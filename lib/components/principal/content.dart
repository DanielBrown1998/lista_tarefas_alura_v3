import 'package:flutter/material.dart';
import 'package:lista_tarefas_alura_v3/components/principal/dificulty.dart';
import 'package:lista_tarefas_alura_v3/data/task_dao.dart';

class Content extends StatefulWidget {
  final String text;
  final String namePicture;
  final String urlPicture;
  final int dificulty;

  const Content(this.text, this.urlPicture, this.dificulty,
      {required this.namePicture, super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int lv = 0;
  Color colorBackgroundDefault = Colors.deepPurple.shade50;
  Color colorLine = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                ),
                height: 100,
                width: 72,
                child: Image.network(
                  widget.urlPicture,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/${widget.namePicture}",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Dificulty(widget.dificulty),
                  ],
                ),
              ),
              SizedBox(
                height: 48,
                width: 64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white70,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Atenção!!!'),
                        content: const Text('Deseja excluir a tarefa?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(color: Colors.white70),
                              )),
                          TextButton(
                            onPressed: () {
                              TaskDao().delete(widget.text);
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Tarefa Removida!",
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                        elevation: 24.0,
                        backgroundColor: Colors.deepPurple.shade400,
                      ),
                      barrierDismissible: true,
                    );
                  },
                  onPressed: () {
                    setState(() {
                      double lineValue = lv / (5 * (widget.dificulty + 1));
                      lv++;
                      if (0.15 >= lineValue || lineValue < 0.25) {
                        colorBackgroundDefault = Colors.deepPurple.shade100;
                        colorLine = Colors.black87;
                      } else if (0.25 >= lineValue || lineValue < 0.45) {
                        colorBackgroundDefault = Colors.deepPurple.shade200;
                        colorLine = Colors.black54;
                      } else if (0.45 >= lineValue || lineValue < 0.65) {
                        colorBackgroundDefault = Colors.deepPurple.shade300;
                        colorLine = Colors.white54;
                      } else if (0.65 >= lineValue || lineValue < 0.85) {
                        colorBackgroundDefault = Colors.deepPurple.shade400;
                        colorLine = Colors.white60;
                      } else if (0.85 >= lineValue || lineValue < 1) {
                        colorBackgroundDefault = Colors.deepPurple.shade500;
                        colorLine = Colors.white70;
                      } else if (lineValue >= 1) {
                        colorBackgroundDefault = Colors.deepPurple;
                        colorLine = Colors.white;
                      }
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_drop_up_outlined,
                        color: Colors.white70,
                      ),
                      const Text("up"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: colorBackgroundDefault,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 200,
                    child: LinearProgressIndicator(
                      color: colorLine,
                      value: lv / (5 * (widget.dificulty + 1)),
                      backgroundColor: Colors.white70,
                    ),
                  ),
                  Text(
                    "Nível: $lv",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 17,
                      color: colorLine,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
