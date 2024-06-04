import 'package:flutter/material.dart';
import 'package:todo_app/core/theming/colors.dart';
import 'package:todo_app/core/theming/styles.dart';

class HomeChoiceChip extends StatelessWidget {
  const HomeChoiceChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          runSpacing: 8,
          spacing: 8,
          children: [
            ChoiceChip(
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(20)), // Adjust as needed
              ),
              showCheckmark: false,
              label: Text(
                'All',
                style: AppStyles.styleMedium13(context),
              ),
              selected: true,
              selectedColor: AppColors.kGreenColor,
            ),
            ChoiceChip(
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(20)), // Adjust as needed
              ),
              showCheckmark: false,
              label: Text('Not Done', style: AppStyles.styleMedium12(context)),
              selected: true,
              selectedColor: AppColors.kGreenColor.withOpacity(.1),
            ),
            ChoiceChip(
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(20)), // Adjust as needed
              ),
              showCheckmark: false,
              label: Text('Done', style: AppStyles.styleMedium12(context)),
              selected: true,
              selectedColor: AppColors.kGreenColor.withOpacity(.1),
            ),
          ],
        ),
      ],
    );
  }
}
