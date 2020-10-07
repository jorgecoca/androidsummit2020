import 'package:androidsummit2020/game/game.dart';
import 'package:androidsummit2020/game/guess_game.dart';
import 'package:androidsummit2020/questionnaire.dart';
import 'package:flutter/material.dart';

class AndroidSummit2020App extends StatelessWidget {
  AndroidSummit2020App({Key key, @required GuessGame guessGame})
      : assert(guessGame != null),
        _guessGame = guessGame,
        super(key: key);

  final GuessGame _guessGame;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android Summit 2020 App',
      home: Scaffold(
        appBar: AppBar(title: Text('Android Summit 2020')),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Questionnaire(game: _guessGame),
        ),
      ),
    );
  }
}
