import 'package:bloc/bloc.dart';

/// GameState class to manage the current state of the game.
class GameState {
  final int currentLevel;
  final String feedback;
  final String clue;

  GameState({
    required this.currentLevel,
    required this.feedback,
    required this.clue,
  });
}

/// GameCubit class to handle the game logic using Bloc.
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
      'word': 'Brain',
      'clues': [
        'You are using me now while reading this clue.',
        'I make you sound reasonable.'
      ],
    },
  ];

  int _currentLevel = 0;

  /// Initial state of the game.
  GameCubit() : super(GameState(currentLevel: 1, feedback: '', clue: ''));

  /// Method to check the user's prompt input.
  void checkPrompt(String prompt) {
    if (_currentLevel == 0 && prompt.toLowerCase() == 'what is the word?') {
      emit(GameState(
        currentLevel: _currentLevel + 1,
        feedback: 'Here’s your clue:',
        clue: levels[_currentLevel]['clues'][0],
      ));
    } else if (_currentLevel == 1) {
      if (prompt.toLowerCase().contains('hint') ||
          prompt.toLowerCase().contains('clue')) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'Good prompt! Here’s a specific clue:',
          clue: levels[_currentLevel]['clues'][1],
        ));
      } else if (prompt.toLowerCase().contains('what is the word?')) {
        emit(GameState(
          currentLevel: _currentLevel,
          feedback:
              'Your prompt was too generic. Try asking for a specific hint.',
          clue: '',
        ));
      } else {
        emit(GameState(
          currentLevel: _currentLevel,
          feedback: 'Incorrect prompt! Be more specific.',
          clue: '',
        ));
      }
    } else if (_currentLevel == 2) {
      if (prompt.toLowerCase().contains('first letter') ||
          prompt.toLowerCase().contains('please')) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'Excellent prompt! Here’s an advanced clue:',
          clue: levels[_currentLevel]['clues'][1],
        ));
      } else {
        emit(GameState(
          currentLevel: _currentLevel,
          feedback:
              'Your prompt needs refinement. Focus on the main characteristics.',
          clue: '',
        ));
      }
    } else if (_currentLevel == 3) {
      if (prompt.toLowerCase().contains('twice') ||
          prompt.toLowerCase().contains('please')) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'Excellent prompt! Here’s an advanced clue:',
          clue: levels[_currentLevel]['clues'][1],
        ));
      } else {
        emit(GameState(
          currentLevel: _currentLevel,
          feedback:
              'Your prompt needs refinement. Focus on the main characteristics.',
          clue: '',
        ));
      }
    } else {
      emit(GameState(
        currentLevel: _currentLevel,
        feedback: 'Incorrect prompt!',
        clue: '',
      ));
    }
  }

  /// Method to check the user's guess input.
  void checkGuess(String guess) {
    if (guess.toLowerCase() == levels[_currentLevel]['word'].toLowerCase()) {
      _currentLevel++; // Increment the level first
      if (_currentLevel < levels.length) {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'Correct! Moving to level ${_currentLevel + 1}...',
          clue: '',
        ));
      } else {
        emit(GameState(
          currentLevel: _currentLevel + 1,
          feedback: 'Congratulations! You have completed all levels!',
          clue: '',
        ));
      }
    } else {
      emit(GameState(
        currentLevel: _currentLevel,
        feedback: 'Incorrect guess! Use the clues wisely and try again.',
        clue: '',
      ));
    }
  }

  /// Method to reset the game.
  void resetGame() {
    _currentLevel = 0;
    emit(GameState(
        currentLevel: 1, feedback: 'Game reset. Let’s start again!', clue: ''));
  }
}
