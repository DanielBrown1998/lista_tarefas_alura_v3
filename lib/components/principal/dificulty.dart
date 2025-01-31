import 'package:flutter/material.dart';

class Dificulty extends StatelessWidget {
  final int dificulty;

  const Dificulty(this.dificulty, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Icon>[
        Icon(
          dificulty >= 1 ? Icons.star : Icons.star_border,
          size: 16,
          color: Colors.deepPurple.shade200,
        ),
        Icon(
          dificulty >= 2 ? Icons.star : Icons.star_border,
          size: 16,
          color: Colors.deepPurple.shade300,
        ),
        Icon(
          dificulty >= 3 ? Icons.star : Icons.star_border,
          size: 16,
          color: Colors.deepPurple.shade400,
        ),
        Icon(
          dificulty >= 4 ? Icons.star : Icons.star_border,
          size: 16,
          color: Colors.deepPurple.shade500,
        ),
        Icon(
          dificulty >= 5 ? Icons.star : Icons.star_border,
          size: 16,
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
