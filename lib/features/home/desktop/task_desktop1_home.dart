import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/core/theming/colors.dart';
import 'package:todo_app/features/home/widgets/home_choice_chip.dart';
import 'package:todo_app/features/home/widgets/home_page_header.dart';

class TaskDesktopHome extends StatelessWidget {
  const TaskDesktopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 61, left: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HomePageHeader(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_box,
                  color: AppColors.kGreenColor,
                  size: 60,
                ),
              ),
            ],
          ),
          const HomeChoiceChip(),
        ],
      ),
    );
  }
}
