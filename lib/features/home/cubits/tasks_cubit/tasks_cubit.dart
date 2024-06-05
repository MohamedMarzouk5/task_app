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
import 'package:todo_app/features/home/repository/home_repository.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TaskInitial());
  final HomeRepository _homeRepository = HomeRepository();
  List<TaskModel>? tasks;
  getAllTasks() {
    tasks = _homeRepository.getAllTasks();
    emit(TasksSuccess());
  }

  checkConnection() {
    _homeRepository.checkConnection();
    emit(ConnectedState());
  }

  @override
  Future<void> close() {
    _homeRepository.cancel();
    return super.close();
  }
}
