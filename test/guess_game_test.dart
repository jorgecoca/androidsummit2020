import 'package:androidsummit2020/game/game.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  GuessGame guessGame;

  setUp(() {
    guessGame = GuessGame();
  });

  group('loadQuestion', () {
    test('returns a question for indexes 0 to 2', () {
      expect(
        guessGame.loadQuestion(0),
        'Is Android Summit the best Android conference in DC?',
      );
      expect(
        guessGame.loadQuestion(1),
        'Are Bugdroid and Dash best friends forever?',
      );
      expect(
        guessGame.loadQuestion(2),
        'Was there ever an Android Q (Quesadilla) release?',
      );
    });

    test('throws Exception for invalid index', () {
      expect(() => guessGame.loadQuestion(3), throwsRangeError);
    });
  });

  group('checkScore', () {
    test('returns -3 points if all answers are incorrect', () async {
      final score1 = await guessGame.checkScore(0, answer: false);
      final score2 = await guessGame.checkScore(1, answer: false);
      final score3 = await guessGame.checkScore(2, answer: true);
      expect(score1, Score(-1, GameStatus.nextQuestion));
      expect(score2, Score(-2, GameStatus.nextQuestion));
      expect(score3, Score(-3, GameStatus.gameFinished));
    });

    test('returns 3 points if all answers are correct', () async {
      final score1 = await guessGame.checkScore(0, answer: true);
      final score2 = await guessGame.checkScore(1, answer: true);
      final score3 = await guessGame.checkScore(2, answer: false);
      expect(score1, Score(1, GameStatus.nextQuestion));
      expect(score2, Score(2, GameStatus.nextQuestion));
      expect(score3, Score(3, GameStatus.gameFinished));
    });
  });
}
