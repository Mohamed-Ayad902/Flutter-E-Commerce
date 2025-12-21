import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/core/exceptions/exceptions.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/user.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/models/product.dart';

class HomeState extends Equatable{
  final bool isLoadingProfile;
  final User? user;
  final bool isLoadingProducts;
  final List<Product> products;

  const HomeState({
    this.isLoadingProfile = false,
    this.user,
    this.isLoadingProducts = false,
    this.products = const [],
  });

  HomeState copyWith({bool? isLoadingProfile, User? user, bool? isLoadingProducts, List<Product>? products}) {
    return HomeState(
      isLoadingProfile: isLoadingProfile ?? this.isLoadingProfile,
      user: user ?? this.user,
      isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [isLoadingProfile, user, isLoadingProducts,products];
}

// -------------- U S E R - I N T E N T S --------------

abstract class HomeIntents {}

class GetProfile implements HomeIntents {}

class GetProducts implements HomeIntents {}

// -------------- O N E - T I M E - E V E N T S --------------

abstract class HomeEffects {}

class HomeFailure implements HomeEffects{
  final CustomException exception;

  HomeFailure(this.exception);
}
