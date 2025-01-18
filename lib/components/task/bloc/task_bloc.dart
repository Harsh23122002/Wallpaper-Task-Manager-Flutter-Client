import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_events.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_states.dart';

import '../../../models/task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<Task> activeTasks = [];

  TaskBloc() : super(TaskInitialState()) {
    on<LoadTasksEvent>(_loadTasks);
    on<CreateTaskEvent>(_createTask);
    super.add(LoadTasksEvent());
  }

  void _createTask(CreateTaskEvent event, Emitter<TaskState> emit) {
    emit(TaskSyncingState());
    activeTasks.add(event.task);
    emit(TaskIdleListeningState(activeTasks));
  }

  void _loadTasks(LoadTasksEvent event, Emitter<TaskState> emit) {
    emit(TaskIdleListeningState(activeTasks));
  }
}
