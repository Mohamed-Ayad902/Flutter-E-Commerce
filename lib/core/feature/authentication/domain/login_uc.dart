import 'package:flutter_ecommerce/core/exceptions/exceptions.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/auth_repo.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/login_request.dart';
import 'package:flutter_ecommerce/core/interactor/remote_use_case.dart';

class LoginUc extends UseCaseRemote<bool, LoginRequest> {
  final IAuthRepo _repo;

  LoginUc(this._repo);

  @override
  Stream<bool> execute(LoginRequest? body) async* {
    if (body == null) throw InvalidRequestBody("InvalidRequestBody, LoginRequest");

    yield await _repo.login(body);
  }
}
