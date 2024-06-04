import 'package:flutter/material.dart';
import 'package:todo_app/core/theming/colors.dart';
import 'package:todo_app/core/theming/size_config.dart';

abstract class AppStyles {
  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      color: AppColors.kBlackColor,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium12(BuildContext context) {
    return TextStyle(
      color: AppColors.kGreenColor,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium13(BuildContext context) {
    return TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleBold15(BuildContext context) {
    return TextStyle(
      color: AppColors.kBlackColor,
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium30(BuildContext context) {
    return TextStyle(
      color: AppColors.kBlackColor,
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.desktop1) {
    return width / 550;
  } else if (width < SizeConfig.desktop2) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
