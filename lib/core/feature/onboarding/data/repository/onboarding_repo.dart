import 'package:flutter_ecommerce/core/firebase/authentication_utils.dart';
import 'package:flutter_ecommerce/core/storage/storage_extensions.dart';

import '../../../../constants/constants.dart';
import '../../../../storage/storage_file.dart';
import '../../domain/repository/i_onboarding_repo.dart';

class OnboardingRepo implements IOnboardingRepo {
  static const _key = Constants.isFirstAppRun;
  final IStorageKeyValueFile _storage;
  final AuthenticationUtils _authUtils;

  OnboardingRepo(this._storage,this._authUtils);

  @override
  Future<void> changeIsFirstTime() async {
    await _storage.storageKV.saveBool(_key, false);
  }

  @override
  Future<bool> isFirstTime() async {
    return await _storage.storageKV.readBool(_key, true);
  }

  @override
  String? getUserId() => _authUtils.getCurrentUserId();

}
