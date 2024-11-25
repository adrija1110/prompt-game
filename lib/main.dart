

import 'package:flutter/material.dart';
import 'presentation/pages/game_page.dart';
import 'presentation/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prompt Engineering Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/intro', 
      routes: {
        '/intro': (context) => const IntroPage(), 
        '/game': (context) => const GamePage(),   
      },
    );
  }
}
