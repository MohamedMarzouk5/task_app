import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

class HomeRepository {
// Firebase
  StreamSubscription? _subscription;
  CollectionReference tasksFirebase =
      FirebaseFirestore.instance.collection('tasks');
// hive
  List<TaskModel>? _tasks;
  Box<TaskModel> taskBox = Hive.box<TaskModel>(kTaskBox);

  List<TaskModel> getAllTasks() {
    return _tasks = taskBox.values.toList();
  }

  void checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        addTaskFirebaseAndSyncInHive();
      }
    });
  }

  List<TaskModel> getUnSyncedTasks() {
    return _tasks!.where((task) => task.isSynced == false).toList();
  }

  void addTaskFirebaseAndSyncInHive() {
    print(
        'length false ${_tasks!.where((task) => task.isSynced == false).toList().length}');
    var unSyncedTasks = getUnSyncedTasks();
    for (var task in unSyncedTasks) {
      addTaskToFirebase(task).then((function) {
        syncInHive(task);
      });
    }
    print(
        'length true ${_tasks!.where((task) => task.isSynced == true).toList().length}');

    print('done');
  }

  Future<void> addTaskToFirebase(TaskModel task) async {
    try {
      await tasksFirebase.add({
        'title': task.title,
        'date': task.date,
      });
      print("Task Added successfully!");
    } catch (error) {
      log(
        "Failed to add task:  ${error.toString()}",
      ); // Use console.error for logging in Flutter
    }
  }

  void syncInHive(TaskModel task) {
    taskBox.put(task.key, task.copyWith(isSynced: true));
  }

  cancel() {
    _subscription?.cancel();
  }
}
