import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'exceptions.dart';


/// A small central place to map various runtime exceptions to your app-level exceptions.
/// - Maps runtime exceptions (Firebase, platform, IO, network) to CustomException subclasses,
/// - Returns a [CustomException] ready to be shown (via localization key) or logged.
class ExceptionMapper {
  const ExceptionMapper._(); // static-only

  /// Map any thrown [error] into a [CustomException].
  static CustomException map(Object? error, [StackTrace? st]) {
    if (error is CustomException) return error; // already mapped

    // --------------- Firebase Auth -----------------
    if (error is FirebaseAuthException) {
      final code = (error.code).toLowerCase();
      final message = error.message;

      switch (code) {
        case 'user-not-found':
        case 'invalid-user-token':
        case 'user-disabled':
          return const AuthenticationException('invalid_user_exception');

        case 'wrong-password':
        case 'invalid-credential':
        case 'invalid-credentials':
          return const AuthenticationException('invalid_credentials');

        case 'email-already-in-use':
        case 'account-exists-with-different-credential':
          return const AuthenticationException('email_already_exists');

        case 'too-many-requests':
          return const AuthenticationException('too_many_request');

        case 'network-request-failed':
        case 'network_error':
          return const NetworkException('network_retrial_message');

        default:
          return AuthenticationException('auth_unknown_error', message);
      }
    }

    // --------------- Firebase general exceptions ---------------
    if (error is FirebaseException) {
      // plugin e.g. 'cloud_firestore', 'firebase_storage', 'cloud_functions'
      final plugin = error.plugin;
      final code = (error.code).toString().toLowerCase();
      final message = error.message;

      // Try to parse JSON payload in message (some functions return JSON)
      try {
        if (message != null && message.isNotEmpty) {
          final trimmed = message.trim();
          if ((trimmed.startsWith('{') && trimmed.endsWith('}')) ||
              (trimmed.startsWith('[') && trimmed.endsWith(']'))) {
            final parsed = jsonDecode(trimmed);
            if (parsed is Map && parsed.containsKey('errors')) {
              final errorsRaw = parsed['errors'];
              if (errorsRaw is Map) {
                // You can convert this into a ClientResponseValidation-like object if needed.
                return UnknownException('validation_with_errors', parsed['message']?.toString());
              }
            }
          }
        }
      } catch (_) {
        // ignore parse errors
      }

      // Firestore-like codes
      if (plugin.contains('firestore')) {
        if (code.contains('permission') || code == 'permission-denied') {
          return const NetworkException('permission_denied');
        }
        if (code == 'unavailable') {
          return const NetworkException('service_not_available');
        }
        if (code == 'cancelled') {
          return const NetworkException('request_canceled');
        }
        return UnknownException('unknown_error', message);
      }

      // Storage-like codes
      if (plugin.contains('storage')) {
        if (code.contains('unauthorized') || code.contains('not-authorized')) {
          return const StorageException('un_authenticated');
        }
        if (code.contains('object-not-found') || code.contains('not_found')) {
          return const StorageException('not_found');
        }
        if (code.contains('quota') || code.contains('quota-exceeded')) {
          return const StorageException('quota_exceeded');
        }
        return UnknownException('unknown_error', message);
      }

      // Generic Firebase fallback
      if (code.contains('permission') || code.contains('unauth')) {
        return const AuthenticationException('un_authenticated');
      }
      if (code.contains('unavailable') || code.contains('network')) {
        return const NetworkException('service_not_available');
      }

      return UnknownException('unknown_error', message);
    }


    // --------------- Storage specific (firebase_storage.StorageException doesn't exist on Flutter, we cover via FirebaseException) ---------------

    // --------------- Platform / native errors ---------------
    if (error is PlatformException) {
      final code = (error.code).toLowerCase();
      final message = error.message;
      if (code.contains('network') || (message?.toLowerCase().contains('network') ?? false)) {
        return const NetworkException('network_retrial_message');
      }
      if (code.contains('permission') || (message?.toLowerCase().contains('permission') ?? false)) {
        return const AuthenticationException('un_authenticated');
      }
      return UnknownException('unknown_error', message);
    }

    // --------------- Common Dart/IO exceptions ---------------
    if (error is SocketException) {
      return const NetworkException('network_retrial_message');
    }

    if (error is TimeoutException) {
      return const NetworkException('network_timeout_message');
    }

    if (error is IOException) {
      return UnknownException('local_io_error', error.toString());
    }

    // --------------- Fallback ---------------
    return UnknownException('unknown_error', error?.toString());
  }

/// Helper: returns a typed Resource-like failure if you want to immediately wrap
/// the exception into a Result object similar to your Android `Resource.Failure`.
///
/// Uncomment and adapt this method if you already have a Resource<T> type in your app.
// static Resource<T> wrapFailure<T>(Object error) {
//   final mapped = map(error);
//   return Resource.failure(mapped); // adapt to your Resource API
// }
}
