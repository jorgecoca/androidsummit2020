import 'package:androidsummit2020/game/game.dart';

class Score {
  const Score(this.points, this.status);

  final int points;
  final GameStatus status;

  Score update({bool isValidAnswer, bool wasLastQuestion}) {
    final updatedPoints = isValidAnswer ? points + 1 : points - 1;
    final updatedStatus =
        wasLastQuestion ? GameStatus.gameFinished : GameStatus.nextQuestion;
    return Score(updatedPoints, updatedStatus);
  }

  @override
  bool operator ==(o) => o is Score && points == o.points && status == o.status;

  @override
  int get hashCode => points.hashCode ^ status.hashCode;
}
