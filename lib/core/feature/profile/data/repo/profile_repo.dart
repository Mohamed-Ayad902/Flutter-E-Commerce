import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/core/exceptions/exceptions.dart';
import 'package:flutter_ecommerce/core/feature/authentication/data/user_dto.dart';
import 'package:flutter_ecommerce/core/feature/authentication/data/user_mapper.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/user.dart';
import 'package:flutter_ecommerce/core/feature/profile/domain/repo/i_profile_repo.dart';
import 'package:flutter_ecommerce/core/firebase/authentication_utils.dart';
import 'package:flutter_ecommerce/core/firebase/firestore_utils.dart';

import '../../../../constants/constants.dart';

class ProfileRepo implements IProfileRepo {
  final FirebaseUtils _firestore;
  final AuthenticationUtils _authUtils;

  ProfileRepo(this._firestore, this._authUtils);

  @override
  Future<User> getCurrentUser() async {
    final uid = _authUtils.getCurrentUserId();
    if (uid == null) throw InvalidRequestBody('CurrentUserId is null, cant get profile data');

    final mapper = UserMapper();

    final user = await _firestore.getItem(
      documentPath: [Constants.users, uid],
      mapper: (ds) {
        final doc = ds as DocumentSnapshot<Map<String, dynamic>>;
        final dto = UserDto.fromFirestore(doc);
        return mapper.dtoToDomain(dto);
      },
    );

    return user ?? (throw StorageException('User profile not found in database'));
  }
}
