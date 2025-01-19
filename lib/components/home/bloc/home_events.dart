import 'package:wallpaper_task_manager/models/task.dart';

abstract class HomeEvent {}

class LoadHomeEvent extends HomeEvent {
  List<Task> activeTaskList;

  LoadHomeEvent({required this.activeTaskList});
}

class UpdateHomeTasksEvent extends HomeEvent {
  String operation;
  Task payload;
  UpdateHomeTasksEvent({required this.operation, required this.payload});
}
