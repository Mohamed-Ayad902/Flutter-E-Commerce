import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/constants.dart';

class UserDto {
  final String uid;
  final String name;
  final String email;
  final Timestamp createdAt;

  UserDto({
    required this.uid,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  static UserDto fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data() ?? {};
    return UserDto(
      uid: data[Constants.uid],
      name: data[Constants.name],
      email: data[Constants.email],
      createdAt: data[Constants.createdAt],
    );
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
