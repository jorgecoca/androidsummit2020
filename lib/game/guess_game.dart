import 'package:androidsummit2020/game/game.dart';
import 'package:meta/meta.dart';

class GuessGame {
  var _score = Score(0, GameStatus.nextQuestion);

  final _questionsAndAnswers = {
    'Is Android Summit the best Android conference in DC?': true,
    'Are Bugdroid and Dash best friends forever?': true,
    'Was there ever an Android Q (Quesadilla) release?': false,
  };

  String loadQuestion(int index) => _questionsAndAnswers.keys.toList()[index];

  Future<Score> checkScore(
    int questionIndex, {
    @required bool answer,
  }) {
    final solution = _questionsAndAnswers.values.toList()[questionIndex];
    final isValidAnswer = solution == answer;
    final wasLastQuestion = questionIndex == _questionsAndAnswers.length - 1;
    final newScore = _score.update(
      isValidAnswer: isValidAnswer,
      wasLastQuestion: wasLastQuestion,
    );
    _score = newScore;
    return Future.delayed(Duration(milliseconds: 500), () => _score);
  }
}
