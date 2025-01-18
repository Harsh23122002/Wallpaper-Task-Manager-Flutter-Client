import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_events.dart';
import 'package:wallpaper_task_manager/models/task.dart';
import 'package:wallpaper_task_manager/utils/config.dart';

import '../../models/content.dart';
import 'bloc/task_bloc.dart';

class TaskCreationPage extends StatefulWidget {
  const TaskCreationPage({super.key});

  @override
  State<TaskCreationPage> createState() => _TaskCreationPageState();
}

class _TaskCreationPageState extends State<TaskCreationPage> {
  final TextEditingController _titleInputController = TextEditingController();
  final TextEditingController _contentInputController = TextEditingController();
  late TaskBloc taskBloc;
  @override
  Widget build(BuildContext context) {
    taskBloc = BlocProvider.of<TaskBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Content content;
          if (_contentInputController.text.isNotEmpty) {
            content = Content(_contentInputController.text);
          } else {
            content = Content(" ");
          }
          taskBloc.add(
              CreateTaskEvent(SimpleTask(_titleInputController.text, content)));
          Navigator.of(context).pop();
        },
        child: Icon(Icons.check),
      ),
      appBar: AppBar(),
      // backgroundColor: ThemeData().primaryColorLight,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _titleInputController,
              decoration: InputDecoration(
                hintText: 'Title...',
                filled: true,
                fillColor: Theme.of(context).colorScheme.onSecondaryContainer,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 400,
              child: TextField(
                controller: _contentInputController,
                keyboardType: TextInputType.multiline,
                maxLines: 100,
                minLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter description...',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onSecondaryContainer,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
