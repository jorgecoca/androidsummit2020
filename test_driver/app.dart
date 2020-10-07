import 'package:flutter_driver/driver_extension.dart';
import 'package:androidsummit2020/main.dart' as app;

void main() {
  enableFlutterDriverExtension(); // enables running the instrumented app
  app.main(); // entry point to our real application
}
