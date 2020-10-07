import 'package:androidsummit2020/game/game.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key key, @required this.game}) : super(key: key);

  final GuessGame game;

  @override
  State<StatefulWidget> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  var _questionIndex = 0;
  var _points = 0;
  var _isLoading = false;
  var _isGameFinished = false;

  @override
  Widget build(BuildContext context) {
    return _isGameFinished
        ? _FinalScore(points: _points)
        : _Question(
            question: widget.game.loadQuestion(_questionIndex),
            isLoading: _isLoading,
            onNoSelected: () async => await _checkAnswer(answer: false),
            onYesSelected: () async => await _checkAnswer(answer: true),
          );
  }

  Future<void> _checkAnswer({bool answer}) async {
    setState(() {
      _isLoading = true;
    });
    final score = await widget.game.checkScore(
      _questionIndex,
      answer: answer,
    );
    setState(() {
      _points = score.points;
      if (score.status == GameStatus.nextQuestion) {
        _questionIndex = _questionIndex + 1;
      } else {
        _isGameFinished = true;
      }
      _isLoading = false;
    });
  }
}

class _Question extends StatelessWidget {
  const _Question({
    Key key,
    @required this.question,
    @required this.isLoading,
    @required this.onNoSelected,
    @required this.onYesSelected,
  }) : super(key: key);

  final String question;
  final bool isLoading;
  final VoidCallback onYesSelected;
  final VoidCallback onNoSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question, style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 12),
        if (isLoading)
          CircularProgressIndicator()
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(child: Text('Yes!'), onPressed: onYesSelected),
              RaisedButton(child: Text('No!'), onPressed: onNoSelected),
            ],
          ),
      ],
    );
  }
}

class _FinalScore extends StatelessWidget {
  const _FinalScore({Key key, @required this.points}) : super(key: key);

  final int points;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Congratulations! You finished the game with a total of $points points',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
