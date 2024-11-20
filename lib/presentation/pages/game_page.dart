// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:confetti/confetti.dart'; // Import the Confetti package

// import '../cubit/game_cubit.dart';
// import '../widgets/level_display.dart';
// import '../widgets/prompt_input.dart';
// import '../widgets/word_input.dart';

// class GamePage extends StatefulWidget {
//   const GamePage({super.key});

//   @override
//   _GamePageState createState() => _GamePageState();
// }

// class _GamePageState extends State<GamePage> {
//   late ConfettiController _confettiController;

//   @override
//   void initState() {
//     super.initState();
//     _confettiController =
//         ConfettiController(duration: const Duration(seconds: 3));
//   }

//   @override
//   void dispose() {
//     _confettiController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hack my passcode'),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 26, 22, 32),
//                 Color.fromARGB(255, 24, 21, 53),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/background.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           BlocProvider(
//             create: (context) => GameCubit(),
//             child: BlocBuilder<GameCubit, GameState>(
//               builder: (context, state) {
//                 // Check if the game is completed
//                 if (state.isCompleted) {
//                   // Play confetti animation when the game is completed
//                   _confettiController.play();
//                   return Stack(
//                     children: [
//                       const Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text(
//                             'Congratulations! You have passed all the levels!',
//                             style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.green,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       // Confetti Animation
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: ConfettiWidget(
//                           confettiController: _confettiController,
//                           blastDirectionality: BlastDirectionality.explosive,
//                           shouldLoop: false,
//                           colors: const [
//                             Colors.red,
//                             Colors.blue,
//                             Colors.green,
//                             Colors.orange,
//                             Colors.purple,
//                           ],
//                           numberOfParticles: 50,
//                           gravity: 0.5,
//                         ),
//                       ),
//                     ],
//                   );
//                 }

//                 // Main game content
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 30),
//                     LevelDisplay(level: state.currentLevel),
//                     const PromptInput(),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         state.feedback,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           color: Color.fromARGB(255, 224, 227, 239),
//                         ),
//                       ),
//                     ),
//                     if (state.clue.isNotEmpty)
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(
//                           state.clue,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 234, 232, 245),
//                           ),
//                         ),
//                       ),
//                     const PasswordInput(),
//                     const SizedBox(height: 30),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confetti/confetti.dart'; // Import the Confetti package

import '../cubit/game_cubit.dart';
import '../widgets/level_display.dart';
import '../widgets/prompt_input.dart';
import '../widgets/word_input.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hack my passcode'),
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
          Center(
            // Added Center to center content
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400), // Line added
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocProvider(
                create: (context) => GameCubit(),
                child: BlocBuilder<GameCubit, GameState>(
                  builder: (context, state) {
                    // Check if the game is completed
                    if (state.isCompleted) {
                      // Play confetti animation when the game is completed
                      _confettiController.play();
                      return Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Congratulations! You have passed all the levels!',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          // Confetti Animation
                          Align(
                            alignment: Alignment.topCenter,
                            child: ConfettiWidget(
                              confettiController: _confettiController,
                              blastDirectionality:
                                  BlastDirectionality.explosive,
                              shouldLoop: false,
                              colors: const [
                                Colors.red,
                                Colors.blue,
                                Colors.green,
                                Colors.orange,
                                Colors.purple,
                              ],
                              numberOfParticles: 50,
                              gravity: 0.5,
                            ),
                          ),
                        ],
                      );
                    }

                    // Main game content
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        LevelDisplay(level: state.currentLevel),
                        const PromptInput(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            state.feedback,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 224, 227, 239),
                            ),
                          ),
                        ),
                        if (state.clue.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              state.clue,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 234, 232, 245),
                              ),
                            ),
                          ),
                        const PasswordInput(),
                        const SizedBox(height: 30),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
