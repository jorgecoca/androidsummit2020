import 'package:androidsummit2020/game/game.dart';
import 'package:androidsummit2020/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGuessGame extends Mock implements GuessGame {}

void main() {
  GuessGame guessGame;

  setUp(() {
    guessGame = MockGuessGame();
    when(guessGame.loadQuestion(0)).thenReturn('Test question 1');
    when(guessGame.loadQuestion(1)).thenReturn('Test question 2');
    when(guessGame.checkScore(0, answer: true)).thenAnswer(
      (_) async => Score(1, GameStatus.nextQuestion),
    );
    when(guessGame.checkScore(1, answer: true)).thenAnswer(
      (_) async => Score(2, GameStatus.gameFinished),
    );
  });

  group('Questionnaire', () {
    testWidgets(
        'renders the question and the final score when the game is completed',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Questionnaire(game: guessGame)),
      );
      expect(find.text('Test question 1'), findsOneWidget);
      await tester.tap(find.text('Yes!'));
      await tester.pumpAndSettle();
      expect(find.text('Test question 2'), findsOneWidget);
      await tester.tap(find.text('Yes!'));
      await tester.pumpAndSettle();
      expect(
        find.text(
            'Congratulations! You finished the game with a total of 2 points'),
        findsOneWidget,
      );
    });
  });
}
