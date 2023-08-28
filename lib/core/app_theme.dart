import 'package:flutter/material.dart';
import 'package:k_task/core/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    appBarTheme: AppBarTheme(
      color: AppColor.backgroundColor,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColor.appBarColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColor.appBarColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: AppColor.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: AppColor.blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColor.greenColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColor.grayColor,
        fontSize: 13,
        fontWeight: FontWeight.w300,
      ),
      displayLarge: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        color: AppColor.blackColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
