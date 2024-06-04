import 'package:flutter/material.dart';
import 'package:todo_app/core/theming/colors.dart';
import 'package:todo_app/core/theming/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });
  final String title;
  final Function() onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.sizeOf(context).width, 53),
            backgroundColor: AppColors.kGreenColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.blue,
                )
              : Text(
                  title,
                  style: AppStyles.styleBold15(context)
                      .copyWith(color: AppColors.kWhiteColor),
                ),
        ));
  }
}
