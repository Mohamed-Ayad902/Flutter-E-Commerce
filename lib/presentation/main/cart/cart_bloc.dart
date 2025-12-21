import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_contract.dart';

class CartBloc extends Bloc<CartIntents, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartIntents>((event, emit) {

    });
  }
}