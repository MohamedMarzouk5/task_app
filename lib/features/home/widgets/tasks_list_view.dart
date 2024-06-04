import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theming/styles.dart';
import 'package:todo_app/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_app/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_app/features/home/data/model/task_model.dart';
import 'package:todo_app/features/home/widgets/task_item_list_view.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TasksCubit>(context).tasks!;
        return tasks.isEmpty
            ? Center(
                child: Text(
                  'NO TASKS YET',
                  style: AppStyles.styleMedium30(context),
                ),
              )
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskItemListView(
                    task: tasks[index],
                  );
                },
              );
      },
    );
  }
}
