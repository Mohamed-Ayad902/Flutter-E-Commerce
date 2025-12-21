import 'package:flutter_ecommerce/core/base/base_mapper.dart';
import 'package:flutter_ecommerce/core/feature/authentication/data/user_dto.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/user.dart';

class UserMapper implements IMapper<UserDto, User> {
  @override
  User dtoToDomain(UserDto dto) {
    return User(id: dto.uid, name: dto.name, email: dto.email);
  }
}