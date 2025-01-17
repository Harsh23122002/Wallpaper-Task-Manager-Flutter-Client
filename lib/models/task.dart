import 'package:uuid/uuid.dart';
import 'package:wallpaper_task_manager/models/content.dart';

abstract class Task {
  final String? id;
  String? title;
  Content? content;
  final DateTime createdOn = DateTime.now();
  Task({required String title}) : id = Uuid().v4();
}

class SimpleTask extends Task {
  SimpleTask() : super(title: "");
}
