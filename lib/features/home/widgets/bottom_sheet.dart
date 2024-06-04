import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app/features/home/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_app/features/home/data/model/task_modl.dart';
import 'package:todo_app/features/home/widgets/add_task_form.dart';

Future<void> bottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    barrierColor: Colors.transparent,
    elevation: 1,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => AddTaskCubit(),
        child: BlocConsumer<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
            if (state is TaskAddFailure) {}
            if (state is TaskAddSuccess) {
              BlocProvider.of<TasksCubit>(context).getAllTasks();
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddTaskForm(),
              ),
            );
          },
        ),
      );
    },
  );
}
