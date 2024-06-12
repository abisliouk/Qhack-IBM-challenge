import 'dart:developer' as developer;

import 'package:logger/logger.dart';

class DevConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach((line) => developer.log(line));
  }
}

class ReleaseConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach((line) => print(line));
  }
}
