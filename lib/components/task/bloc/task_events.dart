import '../../../models/task.dart';

abstract class TaskEvent {}

class LoadTasksEvent extends TaskEvent {}

class CreateTaskEvent extends TaskEvent {
  final Task task;
  CreateTaskEvent(this.task);
}
