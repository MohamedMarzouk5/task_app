import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(TaskInitial());

  addTask(TaskModel task) async {
    emit(TaskAddLoading());
    try {
      var taskBox = Hive.box<TaskModel>(kTaskBox);

      await taskBox.add(task);
      emit(TaskAddSuccess());
    } catch (e) {
      emit(TaskAddFailure(e.toString()));
    }
  }
}
