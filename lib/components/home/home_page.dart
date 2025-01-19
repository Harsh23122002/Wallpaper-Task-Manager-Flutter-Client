import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_events.dart';
import 'package:wallpaper_task_manager/components/task/bloc/task_states.dart';
import 'package:wallpaper_task_manager/components/task/task_creation_page.dart';

import '../../models/task.dart';
import '../task/bloc/task_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_states.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeBloc homeBloc;
  late TaskBloc taskBloc;
  @override
  Widget build(BuildContext context) {
    taskBloc = context.read<TaskBloc>();
    homeBloc = context.read<HomeBloc>();
    return Scaffold(
      floatingActionButton: NewTaskButton(),
      appBar: AppBar(
        // surfaceTintColor: Colors.cyan,
        // elevation: 200,
        leading: Icon(Icons.menu),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (ctx, state) {
            return ListView.builder(
                itemCount: homeBloc.activeTasks.length,
                itemBuilder: (ctx, i) {
                  return TaskCard(
                    title: homeBloc.activeTasks[i].title.toString(),
                  );
                });
          },
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Card(
            color: Theme.of(context).colorScheme.primary.withAlpha(40),
            elevation: 0,
            child: Center(
              child: ListTile(
                title: Text(title),
                trailing: Icon(Icons.do_disturb_on_outlined),
              ),
            )));
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
