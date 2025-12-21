import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorite_contract.dart';

class FavoriteBloc extends Bloc<FavoriteIntents, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<FavoriteIntents>((event, emit) {

    });
  }
}