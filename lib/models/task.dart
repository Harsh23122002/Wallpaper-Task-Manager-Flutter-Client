import 'package:uuid/uuid.dart';
import 'package:wallpaper_task_manager/models/content.dart';

abstract class Task {
  late final String? id;
  String? title;
  Content? content;
  String? status;
  late final DateTime createdOn;
  Task({required String title, this.status = 'active', required this.content}) {
    id = Uuid().v4();
    createdOn = DateTime.now();
  }
}

class SimpleTask extends Task {
  SimpleTask(String title, Content content)
      : super(title: title, content: content);
}
