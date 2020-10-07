import 'package:androidsummit2020/game/guess_game.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';

void main() {
  final game = GuessGame();
  runApp(AndroidSummit2020App(guessGame: game));
}
