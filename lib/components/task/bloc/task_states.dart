import 'package:wallpaper_task_manager/models/task.dart';

abstract class TaskState {}

class TaskInitialState extends TaskState {}

class TaskIdleListeningState extends TaskState {
  List<Task>? activeTaskList;
  TaskIdleListeningState(this.activeTaskList);
}

class TaskIdleNotListeningState extends TaskState {
  List<Task>? activeTaskList;
}

class TaskSyncingState extends TaskState {
  // List<Task> queue = [];

  // TaskSyncingState(List<Task> temp) {
  //   queue = queue + temp;
  // }
}

class TaskErrorState extends TaskState {}
