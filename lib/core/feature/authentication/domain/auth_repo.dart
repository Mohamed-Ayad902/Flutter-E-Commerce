import 'create_account_request.dart';

abstract class IAuthRepo {
  Future<void> createAccount(CreateAccountRequest request);
}