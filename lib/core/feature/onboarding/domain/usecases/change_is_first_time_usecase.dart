import '../../../../interactor/local_use_case.dart';
import '../../../../utils/unit.dart';
import '../repository/i_onboarding_repo.dart';

class ChangeIsFirstTimeUC extends UseCaseLocal<void, Unit> {
  final IOnboardingRepo _repo;

  ChangeIsFirstTimeUC(this._repo);

  @override
  Stream<void> execute(Unit? body) async* {
    await _repo.changeIsFirstTime();
  }
}
