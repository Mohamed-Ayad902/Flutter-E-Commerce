abstract class IOnboardingRepo {
  Future<bool> isFirstTime();

  Future<void> changeIsFirstTime();

  String? getUserId();
}
