import 'package:bloc/bloc.dart';

class GameState {
  final int currentLevel;
  final String feedback;
  final String clue;
  final bool isCompleted;

  GameState({
    required this.currentLevel,
    required this.feedback,
    required this.clue,
    required this.isCompleted,
  });
}

class GameCubit extends Cubit<GameState> {
  List<Map<String, dynamic>> levels = [
    {
      'word': 'flutter',
      'clues': ['It is a UI toolkit'],
    },
    {
      'word': 'candle',
      'clues': [
        'I am tall when I am young, and I am short when I am old. What am I?',
        'You bring me home on your birthday!'
      ],
    },
    {
      'word': 'Bank',
      'clues': [
        'I have branches, but no fruit, trunk, or leaves. I start with B',
        'I start with B and I can touch water!'
      ],
    },
    {
      'word': 'Cloud',
      'clues': ['I fly without wings and cry without eyes.', 'CCLLOOUUDD'],
    },
    {
      'word': 'Shadow',
      'clues': ['19-8-1-4-15-23'],
    },
  ];

  int _currentLevel = 0;


  GameCubit()
      : super(GameState(
            currentLevel: 1, feedback: '', clue: '', isCompleted: false));


  void checkPrompt(String prompt) {
    if (_currentLevel == 0 && prompt.toLowerCase().contains('password')) {
      emit(GameState(
        currentLevel: _currentLevel + 1,
        feedback: 'Here’s your clue:',
        clue: levels[_currentLevel]['clues'][0],
        isCompleted: false,
      ));
    } else if (_currentLevel == 1) {
      if (prompt.toLowerCase().contains('hint') ||
          prompt.toLowerCase().contains('clue')) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'Good prompt! Here’s a specific clue:',
          clue: levels[_currentLevel]['clues'][1],
          isCompleted: false,
        ));
      } else {
        emit(
          GameState(
              currentLevel: _currentLevel,
              feedback:
                  'Your question was too generic. Try asking for a specific hint.',
              clue: '',
              isCompleted: false),
        );
      }
    } else if (_currentLevel == 2) {
      if (prompt.toLowerCase().contains('first letter') ||
          prompt.toLowerCase().contains('please')) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback:
              'You hit the right place! I will not tell you the password but...',
          clue: levels[_currentLevel]['clues'][1],
          isCompleted: false,
        ));
      } else {
        emit(GameState(
          currentLevel: _currentLevel,
          feedback: 'I will not give you the key! You are very stubborn.',
          clue: '',
          isCompleted: false,
        ));
      }
    } else if (_currentLevel == 3) {
      if (prompt.toLowerCase().contains('twice') ||
          prompt.toLowerCase().contains('2 times')) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'You are clever! Here’s your gift for the day: ',
          clue: levels[_currentLevel]['clues'][1],
          isCompleted: false,
        ));
      } else {
        emit(GameState(
          currentLevel: _currentLevel,
          feedback:
              'You cleared so far because you got lucky! Now I am serious, I am not allowed to say anything...',
          clue: '',
          isCompleted: false,
        ));
      }
    } else if (_currentLevel == 4) {
      if (prompt.toLowerCase().contains('code') ||
          prompt.toLowerCase().contains('cipher')) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'Do you like playing with numbers? I do...',
          clue: levels[_currentLevel]['clues'][0],
          isCompleted: false,
        ));
      } else {
        emit(GameState(
          currentLevel: _currentLevel,
          feedback:
              'This is my last chance to stop you. You will not be able to pass this level...',
          clue: '',
          isCompleted: false,
        ));
      }
    } else {
      emit(GameState(
        currentLevel: _currentLevel,
        feedback: 'Incorrect prompt!',
        clue: '',
        isCompleted: false,
      ));
    }
  }


  void checkGuess(String guess) {
    if (guess.toLowerCase() == levels[_currentLevel]['word'].toLowerCase()) {
      _currentLevel++; // Increment the level first
      if (_currentLevel < levels.length) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'Correct! Moving to level ${_currentLevel + 1}...',
          clue: '',
          isCompleted: false,
        ));
      } else {
        emit(GameState(
          currentLevel: _currentLevel,
          feedback: 'Congratulations! You have passed all levels!',
          clue: '',
          isCompleted: true,
        ));
      }
    } else {
      emit(GameState(
        currentLevel: _currentLevel,
        feedback: 'Incorrect guess! Use the clues wisely and try again.',
        clue: '',
        isCompleted: false,
      ));
    }
  }


  void resetGame() {
    _currentLevel = 0;
    emit(GameState(
        currentLevel: 1,
        feedback: 'Game reset. Let’s start again!',
        clue: '',
        isCompleted: true));
  }
}
