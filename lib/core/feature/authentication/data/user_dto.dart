import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/constants.dart';

class UserDto {
  final String uid;
  final String name;
  final String email;
  final Timestamp? createdAt;

  UserDto({
    required this.uid,
    required this.name,
    required this.email,
    this.createdAt,
  });

  factory UserDto.fromCreate({
    required String uid,
    required String name,
    required String email,
  }) {
    return UserDto(uid: uid, name: name, email: email, createdAt: null);
  }

  Map<String, dynamic> toMap() {
    return {
      Constants.uid: uid,
      Constants.name: name,
      Constants.email: email,
      Constants.createdAt: createdAt ,
    };
  }
}
