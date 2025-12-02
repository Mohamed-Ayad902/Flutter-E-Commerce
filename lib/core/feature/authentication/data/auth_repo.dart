import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/core/constants/constants.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/auth_repo.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/create_account_request.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/login_request.dart';
import 'package:flutter_ecommerce/core/firebase/authentication_utils.dart';
import 'package:flutter_ecommerce/core/firebase/firestore_utils.dart';

class AuthRepo implements IAuthRepo{
  final FirebaseUtils _firestore;
  final AuthenticationUtils _auth;

  AuthRepo(this._firestore, this._auth);

  @override
  Future<void> createAccount(CreateAccountRequest request) async {
    final String? uid = await _auth.createUser(
      email: request.email,
      password: request.password,
    );

    if (uid == null) {
      return;
    }

    final Map<String, dynamic> profile = {
      ...request.toMap(),
      Constants.uid: uid,
      Constants.createdAt: FieldValue.serverTimestamp(),
    };

    await _firestore.saveDocument(
      collectionPath: [Constants.users],
      documentId: uid,
      data: profile,
    );
  }

  @override
  Future<bool> login(LoginRequest request) async {
    final user = await _auth.login(
        email: request.email,
        password: request.password
    );

    return user !=null;
  }
}
