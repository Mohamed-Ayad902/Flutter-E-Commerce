import 'package:flutter_ecommerce/core/validation/validation.dart';

class FormValidators {
  static ValidationResult validateEmail(String? raw) {
    final text = raw?.trim() ?? '';
    if (text.isEmpty) return const ValidationResult.invalid(code: ValidationErrorCode.empty);
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(text)) {
      return const ValidationResult.invalid(code: ValidationErrorCode.invalidEmail);
    }
    return const ValidationResult.valid();
  }

  static ValidationResult validatePassword(String? raw) {
    final text = raw ?? '';
    if (text.isEmpty) return const ValidationResult.invalid(code: ValidationErrorCode.empty);
    if (text.length < 8) return const ValidationResult.invalid(code: ValidationErrorCode.tooShort, params: [8]);
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(text)) {
      return const ValidationResult.invalid(code: ValidationErrorCode.invalidPassword);
    }
    return const ValidationResult.valid();
  }

  static ValidationResult validatePasswordConfirmation(String? password, String? rePassword) {
    if (password != rePassword) {
      return const ValidationResult.invalid(code: ValidationErrorCode.passwordMismatch);
    }
    return const ValidationResult.valid();
  }

  static ValidationResult validateName(String? raw) {
    final text = raw?.trim() ?? '';
    if (text.isEmpty) return const ValidationResult.invalid(code: ValidationErrorCode.empty);
    if (text.length > 50) return const ValidationResult.invalid(code: ValidationErrorCode.tooLong, params: [50]);
    return const ValidationResult.valid();
  }

  static ValidationResult validatePhone(String phone, {bool ensureEgyptianNr = false}) {
    if (phone.trim().isEmpty) return const ValidationResult.invalid(code: ValidationErrorCode.empty);
    if (!RegExp(ensureEgyptianNr? r'^01[0-2,5]{1}[0-9]{8}$': r'^(?:[+0]9)?[0-9]{10,12}$').hasMatch(phone)) {
      return const ValidationResult.invalid(code: ValidationErrorCode.invalidPhoneNumber);
    }
    return const ValidationResult.valid();
  }
}
