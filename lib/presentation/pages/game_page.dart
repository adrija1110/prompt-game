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
                Color.fromARGB(255, 154, 205, 230),
                Color.fromARGB(255, 22, 127, 145)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => GameCubit(),
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) {
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
                PasswordInput(),
                const SizedBox(height: 30),
                // const Center(
                //   child: CircleAvatar(
                //     radius: 100,
                //     backgroundImage: AssetImage('assets/images/wizard.png'),
                //     backgroundColor: Colors.transparent,
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
