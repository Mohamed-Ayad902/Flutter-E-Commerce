import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/core/feature/authentication/domain/user.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/models/product.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/usecase/get_featured_products_uc.dart';
import 'package:flutter_ecommerce/core/feature/profile/domain/usecase/get_profile_uc.dart';
import 'package:flutter_ecommerce/presentation/main/home/home_contract.dart';

import '../../../core/utils/resources.dart';

class HomeBloc extends Bloc<HomeIntents, HomeState> {
  final GetFeaturedProductsUc _productsUc;
  final GetProfileUc _profileUc;

  final _effectController = StreamController<HomeEffects>.broadcast();
  Stream<HomeEffects> get effects => _effectController.stream;

  HomeBloc(this._productsUc, this._profileUc) : super(const HomeState()) {
    on<GetProfile>(_getProfile);
    on<GetProducts>(_getProducts);
  }

  Future<void> _getProfile(GetProfile intent, Emitter<HomeState> emit) async {
    await for (final res in _profileUc(body: null)) {
      if (emit.isDone) break;

      switch (res) {
      case Loading<User>():
        emit(state.copyWith(isLoadingProfile: res.loading));
        break;
      case Success<User>():
        emit(state.copyWith(user: res.data));
        break;
      case Failure<User>():
        _effectController.add(HomeFailure(res.exception));
        break;
      }
    }
  }

  Future<void> _getProducts(GetProducts intent, Emitter<HomeState> emit) async {
    await for (final res in _productsUc(body: null)) {
      if (emit.isDone) break;

      switch (res) {
        case Loading<List<Product>>():
          emit(state.copyWith(isLoadingProducts: res.loading));
          break;
        case Success<List<Product>>():
          emit(state.copyWith(products: res.data));
          break;
        case Failure<List<Product>>():
          _effectController.add(HomeFailure(res.exception));
          break;
      }
    }
  }

}