import 'package:flutter/material.dart';
import 'presentation/pages/game_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prompt Engineering Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamePage(),
    );
  }
}
