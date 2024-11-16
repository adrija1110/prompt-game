import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/game_cubit.dart';
import '../widgets/level_display.dart';
import '../widgets/prompt_input.dart';
import '../widgets/word_input.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess the Word'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 26, 22, 32),
                Color.fromARGB(255, 24, 21, 53),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          BlocProvider(
            create: (context) => GameCubit(),
            child: BlocBuilder<GameCubit, GameState>(
              builder: (context, state) {
                if (state.isCompleted) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Congratulations! You have passed all the levels!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    LevelDisplay(level: state.currentLevel),
                    PromptInput(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        state.feedback,
                        style: const TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                    if (state.clue.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          state.clue,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    const PasswordInput(),
                    const SizedBox(height: 30),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
