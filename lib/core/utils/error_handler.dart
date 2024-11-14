import 'package:flutter/foundation.dart';

class ErrorHandler {
  static void handleError(Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('=== Error ===');
      print('Error: $error');
      print('Stack trace: $stackTrace');
      print('=============');
    } else {
      // TODO: Implement production error reporting
      // Examples:
      // - Firebase Crashlytics
      // - Sentry
      // - Custom error reporting service
    }
  }

  static Future<T> guardedOperation<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } catch (error, stackTrace) {
      handleError(error, stackTrace);
      rethrow;
    }
  }

  static T synchronousGuardedOperation<T>(T Function() operation) {
    try {
      return operation();
    } catch (error, stackTrace) {
      handleError(error, stackTrace);
      rethrow;
    }
  }
}