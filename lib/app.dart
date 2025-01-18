import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/home/home.dart';
import 'components/task/bloc/task_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (_) => TaskBloc(),
      child: const Home(),
    ));
  }
}
