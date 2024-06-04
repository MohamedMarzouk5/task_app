import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/data/model/task_modl.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TaskInitial());
  List<TaskModel>? tasks;
  getAllTasks() {
    var taskBox = Hive.box<TaskModel>(kTaskBox);
    tasks = taskBox.values.toList();
    print('length ${tasks!.length}');
    emit(TasksSuccess());
  }
}
