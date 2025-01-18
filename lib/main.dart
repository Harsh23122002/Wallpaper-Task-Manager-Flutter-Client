import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'components/task/bloc/task_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider<TaskBloc>(create: (context) => TaskBloc())],
      child: App()));
}
