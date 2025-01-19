import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_task_manager/components/home/bloc/home_events.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_events.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_states.dart';
import 'package:wallpaper_task_manager/models/content.dart';

import '../../../models/task.dart';
import '../../home/bloc/home_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<Task> activeTasks = [];
  final HomeBloc homeBloc;
  TaskBloc(this.homeBloc) : super(TaskInitialState()) {
    on<LoadTasksEvent>(_loadTasks);
    on<CreateTaskEvent>(_createTask);
    super.add(LoadTasksEvent());
  }

  void _createTask(CreateTaskEvent event, Emitter<TaskState> emit) {
    emit(TaskSyncingState());
    activeTasks.add(event.task);
    homeBloc.add(UpdateHomeTasksEvent(operation: "add", payload: event.task));
    emit(TaskIdleListeningState());
  }

  void _loadTasks(LoadTasksEvent event, Emitter<TaskState> emit) {
    homeBloc.add(LoadHomeEvent(activeTaskList: activeTasks));

    emit(TaskIdleListeningState());
  }
}
