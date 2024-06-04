part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class TaskInitial extends AddTaskState {}

class TaskAddLoading extends AddTaskState {}

class TaskAddSuccess extends AddTaskState {}

class TaskAddFailure extends AddTaskState {
  final String errMassage;

  TaskAddFailure(this.errMassage);
}
