import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/game_cubit.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: const InputDecoration(labelText: 'Guess the password'),
        controller: controller,
        onSubmitted: (value) {
          context.read<GameCubit>().checkGuess(value);
          controller.clear();
        },
      ),
    );
  }
}
