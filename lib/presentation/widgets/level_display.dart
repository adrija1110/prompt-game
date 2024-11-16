import 'package:flutter/material.dart';

class LevelDisplay extends StatelessWidget {
  final int level;

  const LevelDisplay({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 152, 142, 214),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0),
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          'Level $level',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
