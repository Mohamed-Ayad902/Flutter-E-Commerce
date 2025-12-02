sealed class ValidationResult {
  const ValidationResult();

  const factory ValidationResult.valid() = Valid;

  const factory ValidationResult.invalid({
    required ValidationErrorCode code,
    List<Object>? params,
  }) = Invalid;
}

class Valid extends ValidationResult {
  const Valid();
}

class Invalid extends ValidationResult {
  final ValidationErrorCode code;
  final List<Object>? params;

  const Invalid({required this.code, this.params});
}

enum ValidationErrorCode {
  empty,
  tooLong,
  tooShort,
  invalidEmail,
  invalidPassword,
  passwordMismatch,
  invalidPhoneNumber,
}
