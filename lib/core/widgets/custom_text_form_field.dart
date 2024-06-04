import 'package:flutter/material.dart';
import 'package:todo_app/core/theming/colors.dart';
import 'package:todo_app/core/theming/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.labelText, this.onSave});
  final String labelText;
  final Function(String?)? onSave;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter a value';
        }
        return null;
      },
      style: AppStyles.styleRegular12(context)
          .copyWith(color: AppColors.kBlackColor.withOpacity(.5)),
      decoration: InputDecoration(
        // labelStyle: AppStyles.styleRegular12(context)
        //     .copyWith(color: AppColors.kBlackColor.withOpacity(.5)),
        isDense: true,
        hintText: labelText,
        hintStyle: AppStyles.styleRegular12(context)
            .copyWith(color: AppColors.kBlackColor.withOpacity(.5)),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGreyOpcityColor.withOpacity(.2),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGreyOpcityColor.withOpacity(.2),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGreyOpcityColor.withOpacity(.2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGreyOpcityColor.withOpacity(.2),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kGreyOpcityColor.withOpacity(.2),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.all(11.0),
        fillColor: AppColors.kGreyOpcityColor.withOpacity(.2),
      ),
    );
  }
}
