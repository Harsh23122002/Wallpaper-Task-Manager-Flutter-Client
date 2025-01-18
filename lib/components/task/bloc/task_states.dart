import 'package:wallpaper_task_manager/models/task.dart';

abstract class TaskState {
  List<Task>? activeTaskList;
  TaskState({required this.activeTaskList});
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(activeTaskList: []);
}

class TaskIdleListeningState extends TaskState {
  TaskIdleListeningState(List<Task> tasks) : super(activeTaskList: tasks);
}

class TaskIdleNotListeningState extends TaskState {
  TaskIdleNotListeningState(List<Task> tasks) : super(activeTaskList: tasks);
}

class TaskSyncingState extends TaskState {
  TaskSyncingState(List<Task> tasks) : super(activeTaskList: tasks);
}

class TaskErrorState extends TaskState {
  TaskErrorState(List<Task> tasks) : super(activeTaskList: tasks);
}
