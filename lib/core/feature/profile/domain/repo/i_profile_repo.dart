import 'package:flutter_ecommerce/core/feature/authentication/domain/user.dart';

abstract class IProfileRepo {
  Future<User> getCurrentUser();
}