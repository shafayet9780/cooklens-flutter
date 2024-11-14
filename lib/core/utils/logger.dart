import 'package:flutter/foundation.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

class Logger {
  static final Map<LogLevel, String> _levelPrefixes = {
    LogLevel.debug: '🐛 DEBUG',
    LogLevel.info: 'ℹ️ INFO',
    LogLevel.warning: '⚠️ WARN',
    LogLevel.error: '🔥 ERROR',
  };

  static void log(
    String message, {
    LogLevel level = LogLevel.info,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;

    final timestamp = DateTime.now().toIso8601String();
    final prefix = _levelPrefixes[level];

    print('[$timestamp] $prefix: $message');
    if (error != null) {
      print('Error: $error');
    }
    if (stackTrace != null) {
      print('Stack trace:\n$stackTrace');
    }
  }

  static void debug(String message) => log(message, level: LogLevel.debug);
  static void info(String message) => log(message, level: LogLevel.info);
  static void warning(String message) => log(message, level: LogLevel.warning);
  static void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) =>
      log(
        message,
        level: LogLevel.error,
        error: error,
        stackTrace: stackTrace,
      );
} 