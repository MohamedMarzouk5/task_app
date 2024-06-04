import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theming/colors.dart';
import 'package:todo_app/core/theming/styles.dart';
import 'package:todo_app/core/widgets/custom_botton.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_app/features/home/widgets/bottom_sheet.dart';
import 'package:todo_app/features/home/widgets/tasks_list_view.dart';
import 'package:todo_app/features/home/widgets/home_choice_chip.dart';
import 'package:todo_app/features/home/widgets/home_page_header.dart';

class TaskMobileHome extends StatelessWidget {
  const TaskMobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 18, right: 19, top: 31, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomePageHeader(),
          const HomeChoiceChip(),
          const Expanded(child: TasksListView()),
          CustomBotton(
            title: 'Create Task',
            onPressed: () {
              bottomSheet(context);
            },
          )
        ],
      ),
    );
  }
}
