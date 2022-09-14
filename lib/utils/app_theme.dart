import 'package:flutter/material.dart';
import 'package:themeproj/utils/app_colors.dart';

class AppTheme {
  ThemeData darkTheme = ThemeData(
    splashColor: AppColors.darkbalue,
    brightness: Brightness.dark,
    primaryColor: AppColors.secondry,
    cardColor: Colors.white,
    backgroundColor: AppColors.darkbalue,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
  );

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    cardColor: Colors.black,
    splashColor: AppColors.whiteColor,

    backgroundColor: AppColors.secondry,
  );
}
