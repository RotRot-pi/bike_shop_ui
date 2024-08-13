import 'dart:ui';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color primaryColor = Color(0xFF242C3B);
  static const Color secondaryColor = Color(0xFF37B6E9);
  static const Color secondaryLightColor = Color(0xFF34C8E8);
  static const Color thirdColor = Color(0xFF4B4CED);
  static const Color fourthColor = Color(0xFF353F54);
  static const Color fifthColor = Color(0xFF222834);
  static const Color sixthColor = Color(0xFF181C24);
  static const Color seventhColor = Color(0xFF28303F);
  static const List<Color> linearLightGradient = [
    AppColors.secondaryLightColor,
    AppColors.thirdColor,
  ];
  static const List<Color> linearDarkGradient = [
    AppColors.fourthColor,
    AppColors.fifthColor,
    AppColors.fifthColor,
  ];
}
