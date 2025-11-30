import 'package:flutter_ecommerce/core/firebase/authentication_utils.dart';
import 'package:flutter_ecommerce/core/storage/storage_extensions.dart';

import '../../../../constants/constants.dart';
import '../../../../storage/storage_file.dart';
import '../../domain/repository/i_onboarding_repo.dart';

class OnboardingRepo implements IOnboardingRepo {
  static const _key = Constants.isFirstAppRun;
  final IStorageKeyValueFile storage;
  final AuthenticationUtils authUtils;

  OnboardingRepo(this.storage,this.authUtils);

  @override
  Future<void> changeIsFirstTime() async {
    await storage.storageKV.saveBool(_key, false);
  }

  @override
  Future<bool> isFirstTime() async {
    return await storage.storageKV.readBool(_key, true);
  }

  @override
  String? getUserId() => authUtils.getCurrentUserId();

}
