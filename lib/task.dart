import 'package:flutter/material.dart';
import 'package:todo_app/features/home/desktop/task_desktop1_home.dart';
import 'package:todo_app/features/home/mobile/task_mobile_home.dart';
import 'package:todo_app/features/resposive_and_adaptive.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: AdaptiveLayout(
          mobileLayout: (context) => const TaskMobileHome(),
          desktopLayout: (context) => const TaskDesktopHome(),
        ));
  }
}
