import 'package:androidsummit2020/app.dart';
import 'package:androidsummit2020/game/game.dart';
import 'package:androidsummit2020/questionnaire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AndroidSummit2020App', () {
    testWidgets('renders a MaterialApp with Questionnaire',
        (WidgetTester tester) async {
      final guessGame = GuessGame();
      await tester.pumpWidget(AndroidSummit2020App(guessGame: guessGame));
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Questionnaire), findsOneWidget);
    });
  });
}
