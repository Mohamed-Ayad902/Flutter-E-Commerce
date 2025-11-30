// exception hierarchy using string keys for localization

abstract class CustomException implements Exception {
  /// Localization key (e.g. 'invalid_user_exception')
  final String messageKey;

  /// Optional raw error text for logging or debug UI
  final String? errorText;

  const CustomException(this.messageKey, [this.errorText]);

  @override
  String toString() =>
      'CustomException(messageKey: $messageKey, errorText: $errorText)';
}

/// Network-related problems (connectivity, service unavailable, etc.)
class NetworkException extends CustomException {
  const NetworkException(super.messageKey, [super.errorText]);
}

/// Authentication / authorization related problems
class AuthenticationException extends CustomException {
  const AuthenticationException(super.messageKey, [super.errorText]);
}

/// Storage (Firebase Storage) related problems
class StorageException extends CustomException {
  const StorageException(super.messageKey, [super.errorText]);
}

/// Unknown / fallback
class UnknownException extends CustomException {
  const UnknownException(super.messageKey, [super.errorText]);
}

/// Invalid local request body / client-side validation error
class InvalidRequestBody extends CustomException {
  const InvalidRequestBody([super.messageKey = 'invalid_request_body']);
}
