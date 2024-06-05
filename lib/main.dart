import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/simple_bloc_observer.dart';
import 'package:todo_app/task.dart';
import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTaskBox);
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit()..checkConnection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Task(),
      ),
    );
  }
}
