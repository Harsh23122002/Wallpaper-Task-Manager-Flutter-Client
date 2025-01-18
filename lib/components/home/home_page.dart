import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_events.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_states.dart';
import 'package:wallpaper_task_manager/components/task/task_creation_page.dart';

import '../../models/task.dart';
import '../task/bloc/task_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NewTaskButton(),
      appBar: AppBar(
        // surfaceTintColor: Colors.cyan,
        elevation: 200,
        leading: Icon(Icons.menu),
      ),
      body: SafeArea(child: Center(
        child: BlocBuilder<TaskBloc, TaskState>(builder: (ctx, state) {
          log("$state");
          if (state is TaskIdleListeningState) {
            return Text(state.activeTaskList!.length.toString());
          } else {
            return Text("ERROR");
          }
        }),
      )),
    );
  }
}

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TaskCreationPage()));
      },
      label: Text("New Task"),
      icon: Icon(Icons.add),
    );
  }
}
