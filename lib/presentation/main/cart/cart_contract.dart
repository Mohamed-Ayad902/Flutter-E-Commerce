import 'package:equatable/equatable.dart';

class CartState extends Equatable{
  const CartState();

  @override
  List<Object?> get props => [];

}

// -------------- U S E R - I N T E N T S --------------

abstract class CartIntents {}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class CartEffects {}
