import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<LoadHomeEvent>(_loadHome);

    add(LoadHomeEvent());
  }

  void _loadHome(LoadHomeEvent event, Emitter<HomeState> emit) {
    emit(HomeAvailableState());
  }
}
