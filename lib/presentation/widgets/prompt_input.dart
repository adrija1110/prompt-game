import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/game_cubit.dart';

class PromptInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    FocusNode _focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        focusNode: _focusNode,
        decoration: const InputDecoration(labelText: 'Ask me for clues'),
        controller: _controller,
        onTap: () {
          _focusNode.requestFocus();
        },
        onSubmitted: (value) {
          context.read<GameCubit>().checkPrompt(value);
          _controller.clear();
        },
      ),
    );
  }
}
