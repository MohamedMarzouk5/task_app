import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theming/colors.dart';
import 'package:todo_app/core/theming/styles.dart';
import 'package:todo_app/core/widgets/custom_botton.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';
import 'package:todo_app/features/home/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, date;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        height: 262,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width - 17,
          // maxHeight: 262,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          color: AppColors.kWhiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.kBlackColor.withOpacity(.1),
              blurRadius: 10.0,
              offset: const Offset(0.0, -5),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14.0, right: 20.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  color: const Color(0xffF24E1E),
                  icon: const Icon(
                    size: 16,
                    Icons.close,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, bottom: 14),
              child: Text(
                'Create New Task',
                style: AppStyles.styleBold15(context),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 17.0, right: 20, bottom: 7),
                child: CustomTextFormField(
                  onSave: (value) {
                    title = value;
                  },
                  labelText: 'Task title',
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 17.0,
                right: 20,
              ),
              child: CustomTextFormField(
                onSave: (value) {
                  date = value;
                },
                labelText: 'Due Date',
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 11, left: 9),
              child: BlocBuilder<AddTaskCubit, AddTaskState>(
                builder: (context, state) {
                  return CustomBotton(
                      isLoading: state is TaskAddLoading ? true : false,
                      title: 'Save Task',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          TaskModel taskModel = TaskModel(
                              title: title!, date: date!, isSynced: false);
                          BlocProvider.of<AddTaskCubit>(context)
                              .addTask(taskModel);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      });
                },
              ),
            ),
            // const AddTaskBloc(),
          ],
        ),
      ),
    );
  }
}
