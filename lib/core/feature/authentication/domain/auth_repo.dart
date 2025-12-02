import 'package:flutter_ecommerce/core/feature/authentication/domain/login_request.dart';

import 'create_account_request.dart';

abstract class IAuthRepo {
  Future<void> createAccount(CreateAccountRequest request);
  Future<bool> login(LoginRequest request);
}