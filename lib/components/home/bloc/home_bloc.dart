import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/task.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Task> activeTasks = [];

  HomeBloc() : super(HomeInitialState()) {
    on<LoadHomeEvent>(_loadHome);
    on<UpdateHomeTasksEvent>(_updateHome);
    log("HOME-BLOC: HomeInitialState");
  }

  void _loadHome(LoadHomeEvent event, Emitter<HomeState> emit) {
    activeTasks = List.from(event.activeTaskList);
    log("HOME-BLOC: ${activeTasks.length.toString()}");
    emit(HomeAvailableListeningState());
    log("HOME-BLOC: HomeAvailableListeningState");
  }

  void _updateHome(UpdateHomeTasksEvent event, Emitter<HomeState> emit) {
    emit(HomeAvailableNotListeningState());
    activeTasks.add(event.payload);
    log("added");
    emit(HomeAvailableListeningState());
  }
}
