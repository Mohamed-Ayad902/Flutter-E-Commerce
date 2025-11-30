import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 170,
    colors: true,
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

void logDebug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
  if (kDebugMode) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }
}

void logInfo(dynamic message, {dynamic error, StackTrace? stackTrace}) {
  if (kDebugMode) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }
}

void logWarning(dynamic message, {dynamic error, StackTrace? stackTrace}) {
  if (kDebugMode) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }
}

void logError(dynamic message, {dynamic error, StackTrace? stackTrace}) {
  if (kDebugMode) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
