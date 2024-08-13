import 'package:bike_shop_experiment/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.primaryColor,
  );
}
