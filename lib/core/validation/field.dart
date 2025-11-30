
import 'package:flutter_ecommerce/core/validation/validation.dart';

/// marker for generic form fields
abstract class FieldType {}

abstract class ImageFieldType extends FieldType {}

/// represents a form field with a value and a validation result
class FormField<T> {
  final T value;
  final ValidationResult result;

  FormField(this.value, {this.result = const ValidationResult.valid()});

  FormField<T> copyWith({
    T? value,
    ValidationResult? result,
  }) {
    return FormField<T>(
      value ?? this.value,
      result: result ?? this.result,
    );
  }
}