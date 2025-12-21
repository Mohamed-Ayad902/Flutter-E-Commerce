import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  const FavoriteState();
  @override
  List<Object?> get props => [];
}

// -------------- U S E R - I N T E N T S --------------

abstract class FavoriteIntents {}

// -------------- O N E - T I M E - E V E N T S --------------

sealed class FavoriteEffects {}
