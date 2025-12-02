import 'package:flutter_ecommerce/core/exceptions/exceptions.dart';
import 'package:flutter_ecommerce/core/interactor/remote_use_case.dart';

import 'auth_repo.dart';
import 'create_account_request.dart';

class CreateAccountUC extends UseCaseRemote<void, CreateAccountRequest> {
  final IAuthRepo _repo;

  CreateAccountUC(this._repo);

  @override
  Stream<void> execute(CreateAccountRequest? body) async* {
    if (body == null) throw InvalidRequestBody("InvalidRequestBody, CreateAccountRequest");

    yield _repo.createAccount(body);
  }
}
