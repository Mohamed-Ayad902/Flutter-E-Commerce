import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';
import 'package:flutter_ecommerce/core/validation/validation.dart';

extension ValidationResultExtension on ValidationResult {
  String? localizedErrorMessage(BuildContext context) {
    if (this is Valid) {
      return null;
    }

    final invalidResult = this as Invalid;
    final strings = context.localization;

    final params = invalidResult.params;
    final int? length = (params != null && params.isNotEmpty) ? params.first as int? : null;

    switch (invalidResult.code) {
      case ValidationErrorCode.empty:
        return strings.errorEmptyField;

      case ValidationErrorCode.tooLong:
        return strings.errorValueTooLong(length ?? 0);

      case ValidationErrorCode.tooShort:
        return strings.errorValueTooShort(length ?? 0);

      case ValidationErrorCode.invalidEmail:
        return strings.errorInvalidEmail;

      case ValidationErrorCode.invalidPassword:
        return strings.errorInvalidPassword;

      case ValidationErrorCode.passwordMismatch:
        return strings.errorPasswordMismatch;

      case ValidationErrorCode.invalidPhoneNumber:
        return strings.errorInvalidPhoneNumber;
    }
  }
}
