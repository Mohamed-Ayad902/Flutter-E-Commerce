
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../core/firebase/authentication_utils.dart';
import '../core/firebase/firestore_utils.dart';

Future<void> registerFirebaseModule(GetIt getIt) async {
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<AuthenticationUtils>(() => AuthenticationUtils(getIt()));
  getIt.registerLazySingleton<FirebaseUtils>(() => FirebaseUtils(getIt()));
}