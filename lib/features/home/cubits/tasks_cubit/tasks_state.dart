import 'package:flutter/material.dart';

@immutable
abstract class TasksState {}

final class TaskInitial extends TasksState {}

final class TasksLoading extends TasksState {}

final class TasksSuccess extends TasksState {}

final class TaskFailure extends TasksState {
  final String errMassage;

  TaskFailure(this.errMassage);
}
