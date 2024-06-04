import 'package:flutter/material.dart';
import 'package:todo_app/core/theming/styles.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Good Morning',
      style: AppStyles.styleMedium30(context),
    );
  }
}
