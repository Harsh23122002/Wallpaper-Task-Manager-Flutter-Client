import 'package:wallpaper_task_manager/models/task.dart';

abstract class TaskState {}

class TaskInitialState extends TaskState {}

class TaskIdleListeningState extends TaskState {}

class TaskIdleNotListeningState extends TaskState {}

class TaskSyncingState extends TaskState {}

class TaskErrorState extends TaskState {}
