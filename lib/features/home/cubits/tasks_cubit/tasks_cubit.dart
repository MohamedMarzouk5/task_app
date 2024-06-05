import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/data/models/task_modl.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TaskInitial());
  StreamSubscription? _subscription;
  List<TaskModel>? tasks;
  var taskBox = Hive.box<TaskModel>(kTaskBox);
  CollectionReference tasksFirebase =
      FirebaseFirestore.instance.collection('tasks');
  getAllTasks() {
    tasks = taskBox.values.toList();

    // print('length ${tasks!.where((task) => task.isSynced == true).toList()}');

    // print('length ${tasks!.where((task) => task.isSynced == true).toList()}');

    // tasks?.forEach((task) => print('task ${task.title}'));
    // taskBox.putAt(0,TaskModel(title: title, date: date, isSynced: isSynced));
    emit(TasksSuccess());
  }

  void checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        addTaskFirebaseAndSyncInHive();
        connected();
      } else {
        notConnected();
      }
    });
  }

  void connected() {
    emit(ConnectedState());
  }

  void notConnected() {
    emit(NotConnectedState());
  }

  List<TaskModel> getUnSyncedTasks() {
    // tasks!.where((task) => task.isSynced == false).toList().forEach(
    //     (task) => taskBox.put(task.key, task.copyWith(isSynced: true)));

    return tasks!.where((task) => task.isSynced == false).toList();
  }

  Future<void> addTaskToFirebase(TaskModel task) {
    return tasksFirebase
        .add({
          'title': task.title,
          'date': task.date,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void addTaskFirebaseAndSyncInHive() {
    var unSyncedTasks = getUnSyncedTasks();
    for (var task in unSyncedTasks) {
      addTaskToFirebase(task);
      taskBox.put(task.key, task.copyWith(isSynced: true));
    }
    print('done');
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
