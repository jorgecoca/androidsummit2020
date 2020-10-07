import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() {
    driver.close();
  });

  group('Android Summit 2020 App', () {
    test('completes the game after three questions', () async {
      await driver.waitFor(
        find.text('Is Android Summit the best Android conference in DC?'),
      );
      await driver.tap(find.text('Yes!'));
      await driver.waitFor(
        find.text('Are Bugdroid and Dash best friends forever?'),
      );
      await driver.tap(find.text('Yes!'));
      await driver.waitFor(
        find.text('Was there ever an Android Q (Quesadilla) release?'),
      );
      await driver.tap(find.text('No!'));
      await driver.waitFor(
        find.text(
          'Congratulations! You finished the game with a total of 3 points',
        ),
      );
    });
  });
}
