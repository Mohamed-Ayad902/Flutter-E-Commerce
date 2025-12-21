import 'package:flutter_ecommerce/core/feature/authentication/domain/user.dart';
import 'package:flutter_ecommerce/core/feature/profile/domain/repo/i_profile_repo.dart';
import 'package:flutter_ecommerce/core/interactor/remote_use_case.dart';

import '../../../../utils/unit.dart';

class GetProfileUc extends UseCaseRemote<User, Unit> {
  final IProfileRepo _repo;

  GetProfileUc(this._repo);

  @override
  Stream<User> execute(Unit? body) async* {
    yield await _repo.getCurrentUser();
  }
}
