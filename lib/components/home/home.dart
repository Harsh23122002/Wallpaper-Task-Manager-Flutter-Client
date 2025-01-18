import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_events.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_states.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<TaskBloc>(context).add(CreateTaskEvent(SimpleTask()));
        },
        child: Text("New Task"),
      ),
      appBar: AppBar(
        elevation: 10,
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
