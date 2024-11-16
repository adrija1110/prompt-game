import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/game_cubit.dart';

class PromptInput extends StatelessWidget {
  const PromptInput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FocusNode focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 7, 7, 7), // Custom text color
        ),
        decoration: const InputDecoration(
          labelText: 'Ask me for clues',
          labelStyle: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 192, 192, 253), // Custom label color
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 0, 0, 0), // Custom underline color
              width: 1.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(
                  255, 0, 0, 0), // Custom underline color when focused
              width: 1.0,
            ),
          ),
        ),
        onSubmitted: (value) {
          context.read<GameCubit>().checkPrompt(value);
          controller.clear();
        },
      ),
    );
  }
}
