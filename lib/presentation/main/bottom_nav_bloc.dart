import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBloc extends Bloc<BottomNavBlocIntents, int> {
  BottomNavBloc() : super(0) {
    on<SelectTab>(_onSelectTab);
  }

  FutureOr<void> _onSelectTab(SelectTab event, Emitter<int> emit) {
    emit(event.index);
  }
}

// -------------- I N T E N T S --------------

abstract class BottomNavBlocIntents {}

class SelectTab extends BottomNavBlocIntents {
  final int index;

  SelectTab(this.index);
}