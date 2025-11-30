import '../../../../interactor/local_use_case.dart';
import '../../../../utils/unit.dart';
import '../repository/i_onboarding_repo.dart';

class GetCurrentUserIdUsecase extends UseCaseLocal<String?, Unit> {
  final IOnboardingRepo _repo;

  GetCurrentUserIdUsecase(this._repo);

  @override
  Stream<String?> execute(Unit? body) async* {
    yield _repo.getUserId();
  }
}
