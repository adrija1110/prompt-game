import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Hack my Passcode'),
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 26, 22, 32),
              Color.fromARGB(255, 24, 21, 53),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Hack My Passcode!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 152, 142, 214),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Rules:\n\n',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 224, 227, 239),
                          ),
                        ),
                        TextSpan(
                          text:
                              '- The game consists of several levels. 🎚️ \n\n'
                              '- Each level has a hidden passcode that you need to guess. 🖥️ \n\n'
                              '- Use the "Ask me for clues" field to request hints. 🤫\n\n'
                              '- Type your guess and proceed to the next level upon a correct guess.🤩\n\n\n',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 224, 227, 239),
                          ),
                        ),
                        TextSpan(
                          text: 'Objective:\n\n',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 224, 227, 239),
                          ),
                        ),
                        TextSpan(
                          text:
                              'Complete all levels by guessing the correct passcode using the hints provided! 🔐',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 224, 227, 239),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Show a loading dialog before navigating
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: const Color.fromARGB(255, 152, 142, 214),
                            ),
                          );
                        },
                      );

                      // Delay for 1 second, then navigate
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.of(context).pop(); // Close the loading dialog
                        Navigator.of(context).pushReplacementNamed('/game');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 152, 142, 214),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Start Game',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
