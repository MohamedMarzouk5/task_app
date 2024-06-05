import 'package:flutter/material.dart';
import 'package:todo_app/core/theming/colors.dart';
import 'package:todo_app/core/theming/styles.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

class TaskItemListView extends StatelessWidget {
  final TaskModel task;

  const TaskItemListView({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 6),
      color: AppColors.kWhiteColor,
      shadowColor: AppColors.kBlackColor,
      elevation: 2,
      child: SizedBox(
        height: 65,
        child: ListTile(
          title: Text(
            task.title,
            style: AppStyles.styleBold15(context),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              // 'Due Date: Mon. 21/3/2024',
              task.date,
              style: AppStyles.styleRegular12(context),
            ),
          ),
          trailing: Icon(
            Icons.check_circle_sharp,
            color: AppColors.kGreenColor.withOpacity(.25),
          ),
        ),
      ),
    );
  }
}
