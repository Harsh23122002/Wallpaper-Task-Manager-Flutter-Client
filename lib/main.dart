import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'components/home/bloc/home_bloc.dart';
import 'components/task/bloc/task_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeBloc>(lazy: false, create: (context) => HomeBloc()),
    BlocProvider<TaskBloc>(
        lazy: false, create: (context) => TaskBloc(context.read<HomeBloc>())),
  ], child: App()));
}
