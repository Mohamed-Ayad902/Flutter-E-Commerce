import '../../../../interactor/local_use_case.dart';
import '../../../../utils/unit.dart';
import '../repository/i_onboarding_repo.dart';

class GetIsFirstTimeUC extends UseCaseLocal<bool, Unit> {
  final IOnboardingRepo _repo;

  GetIsFirstTimeUC(this._repo);

  @override
  Stream<bool> execute(Unit? body) async* {
    yield await _repo.isFirstTime();
  }
}
