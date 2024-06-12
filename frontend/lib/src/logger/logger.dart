import 'dart:convert';
import 'package:logger/logger.dart';
import 'console_output.dart';

export 'package:logger/logger.dart';

class CustomLogPrinter extends LogPrinter {
  static final levelPrefixes = {
    Level.verbose: 'VERBOSE',
    Level.debug: 'DEBUG',
    Level.info: 'INFO',
    Level.warning: 'WARN',
    Level.error: 'ERROR',
    Level.wtf: 'WTF',
  };

  final String className;

  CustomLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    List<String> buffer = [];

    var messageStr = _stringifyMessage(event.message);
    var errorStr = event.error != null ? '  ERROR: ${event.error}' : '';
    var timeStr = '${DateTime.now()}';
    buffer.add('[$timeStr | $className | ${levelPrefixes[event.level]}] $messageStr$errorStr');
    if (event.stackTrace != null) {
      buffer.add(event.stackTrace.toString());
    }
    return buffer;
  }

  String _stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = const JsonEncoder.withIndent(null);
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }
}

Level? _level;
LogOutput? _output;

Logger getLogger(String className) {
  if (_level == null) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    _level = inDebug ? Level.verbose : Level.info;
    _output = DevConsoleOutput();
  }
  return Logger(
    level: _level,
    printer: CustomLogPrinter(
      className,
    ),
    output: MultiOutput([
      _output,
    ]),
  );
}
