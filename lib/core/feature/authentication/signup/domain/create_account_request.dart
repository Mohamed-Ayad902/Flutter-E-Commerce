import '../../../../constants/constants.dart';

class CreateAccountRequest {
  final String name;
  final String email;
  final String password;

  CreateAccountRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      Constants.name: name,
      Constants.email: email,
    };
  }
}
